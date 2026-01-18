import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Represents the body and status code of a HTTP response that failed
typedef HttpFailure = ({
  Map<String, dynamic>? data,
  int? status,
  String? message,
});

/// Represents Supabase Postgres error details
typedef PostgresFailure = ({
  String message,
  String? code,
  String? details,
  String? hint,
});

/// [Fault] is a sealed class that represents a fault in the system.
/// It handles exceptions, errors, unknown faults, and custom faults.
sealed class Fault<T> {
  const Fault._internal(this.stackTrace);
  final StackTrace stackTrace;

  factory Fault.fromObjectAndStackTrace(Object object, StackTrace stackTrace) =>
      switch (object) {
        final Exception ex => ExceptionFault(ex, stackTrace),
        final Error err => ErrorFault(err, stackTrace),
        _ => UnknownFault(object.toString(), stackTrace),
      };

  @override
  String toString() => message;
}

/// Represents a fault caused by a http calls
final class HttpFault<T> extends Fault<T> {
  final HttpFailure body;
  const HttpFault(this.body, StackTrace stackTrace)
    : super._internal(stackTrace);

  /// Creates an [HttpFault] from a [DioException] by parsing the response data
  /// and extracting relevant error information.
  factory HttpFault.fromDioException(DioException ex, StackTrace stackTrace) {
    final errorData = ex.response?.data;
    final statusCode = ex.response?.statusCode;

    final HttpFailure httpFailure = switch (errorData) {
      // Handle String responses
      final String message => (
        message: message,
        data: {'message': message},
        status: statusCode,
      ),

      // Handle Map responses with nested 'data' field
      final Map<String, dynamic> map when map.containsKey('data') => (
        message: _extractMessage(map),
        data: map['data'] as Map<String, dynamic>?,
        status: statusCode,
      ),

      // Handle Map responses with 'message' field
      final Map<String, dynamic> map when map.containsKey('message') => (
        message: map['message']?.toString() ?? 'UNKNOWN-ERROR',
        data: {'message': map['message']},
        status: statusCode,
      ),

      // Handle generic Map responses
      final Map<String, dynamic> map => (
        message: _extractMessage(map),
        data: map,
        status: statusCode,
      ),

      // Handle invalid or null error data
      _ => (
        message: 'Invalid error response format',
        data: <String, dynamic>{},
        status: statusCode,
      ),
    };

    httpFailure.appLog(
      level: AppLogLevel.error,
      tag: 'HttpFault',
    );

    return HttpFault(httpFailure, stackTrace);
  }

  /// Extracts a meaningful error message from the response map.
  /// Checks common error message fields in order of priority.
  static String _extractMessage(Map<String, dynamic> map) {
    return map['message']?.toString() ??
        map['error']?.toString() ??
        map['detail']?.toString() ??
        'UNKNOWN-ERROR';
  }
}

/// Represents a fault caused by a Firebase core
final class FirebaseFault<T> extends Fault<T> {
  final String errorMessage;
  const FirebaseFault(this.errorMessage, StackTrace stackTrace)
    : super._internal(stackTrace);

  factory FirebaseFault.fromFirebase(
    FirebaseException ex,
    StackTrace stackTrace,
  ) {
    ex.message?.appLog(level: AppLogLevel.error, tag: 'FirebaseFault');

    return switch (ex.code) {
      'permission-denied' => FirebaseFault(
        'Permission denied. Please check your internet connection.',
        stackTrace,
      ),
      'unavailable' => FirebaseFault(
        'Service unavailable. Please check your internet connection.',
        stackTrace,
      ),
      'internal' => FirebaseFault(
        'Internal server error. Please try again later.',
        stackTrace,
      ),
      'unknown' => FirebaseFault(
        'Unknown error. Please try again later.',
        stackTrace,
      ),
      'failed-precondition' => FirebaseFault(
        'Something went wrong with indexing. Please contact support.',
        stackTrace,
      ),
      _ => FirebaseFault(
        ex.message ?? 'Firebase error, try again!',
        stackTrace,
      ),
    };
  }
}

/// Represents a fault caused by Supabase Auth
final class SupaAuthFault<T> extends Fault<T> {
  final String errorMessage;
  const SupaAuthFault(this.errorMessage, StackTrace stackTrace)
    : super._internal(stackTrace);

  factory SupaAuthFault.fromAuthApiException(
    AuthApiException ex,
    StackTrace stackTrace,
  ) {
    ex.message.appLog(level: AppLogLevel.error, tag: 'SupaAuthFault');

    final code = ex.code;

    return switch (code) {
      // Email related
      'email_exists' => SupaAuthFault(
        'This email is already registered. Please sign in instead.',
        stackTrace,
      ),
      'email_not_confirmed' => SupaAuthFault(
        'Please verify your email address before signing in.',
        stackTrace,
      ),
      'email_provider_disabled' => SupaAuthFault(
        'Email sign up is currently disabled.',
        stackTrace,
      ),
      'email_address_invalid' => SupaAuthFault(
        'Please enter a valid email address.',
        stackTrace,
      ),
      'email_address_not_authorized' => SupaAuthFault(
        'This email address is not authorized for sign up.',
        stackTrace,
      ),

      // Credentials & validation
      'invalid_credentials' => SupaAuthFault(
        'Invalid email or password. Please try again.',
        stackTrace,
      ),
      'weak_password' => SupaAuthFault(
        'Password is too weak. Use at least 8 characters with letters and numbers.',
        stackTrace,
      ),
      'same_password' => SupaAuthFault(
        'New password must be different from your current password.',
        stackTrace,
      ),
      'validation_failed' => SupaAuthFault(
        'Please check your input and try again.',
        stackTrace,
      ),

      // User related
      'user_not_found' => SupaAuthFault(
        'No account found with this email.',
        stackTrace,
      ),
      'user_already_exists' => SupaAuthFault(
        'An account with this email already exists.',
        stackTrace,
      ),
      'user_banned' => SupaAuthFault(
        'Your account has been suspended. Please contact support.',
        stackTrace,
      ),
      'signup_disabled' => SupaAuthFault(
        'New account registration is currently disabled.',
        stackTrace,
      ),

      // Session & auth
      'session_expired' => SupaAuthFault(
        'Your session has expired. Please sign in again.',
        stackTrace,
      ),
      'session_not_found' => SupaAuthFault(
        'Session not found. Please sign in again.',
        stackTrace,
      ),
      'refresh_token_not_found' ||
      'refresh_token_already_used' => SupaAuthFault(
        'Your session is invalid. Please sign in again.',
        stackTrace,
      ),

      // Rate limiting
      'over_request_rate_limit' => SupaAuthFault(
        'Too many requests. Please wait a moment and try again.',
        stackTrace,
      ),
      'over_email_send_rate_limit' => SupaAuthFault(
        'Too many emails sent. Please wait a few minutes.',
        stackTrace,
      ),

      // Server errors
      'unexpected_failure' => SupaAuthFault(
        'Something went wrong. Please try again later.',
        stackTrace,
      ),
      'request_timeout' => SupaAuthFault(
        'Request timed out. Please check your connection.',
        stackTrace,
      ),
      'conflict' => SupaAuthFault(
        'Request conflict. Please try again.',
        stackTrace,
      ),

      // Default fallback
      _ => SupaAuthFault(
        ex.message,
        stackTrace,
      ),
    };
  }
}

/// Represents a fault caused by Supabase Postgres operations
final class SupaPostgresFault<T> extends Fault<T> {
  final PostgresFailure failure;
  const SupaPostgresFault(this.failure, StackTrace stackTrace)
    : super._internal(stackTrace);

  factory SupaPostgresFault.fromPostgrestException(
    PostgrestException ex,
    StackTrace stackTrace,
  ) {
    final failure = (
      message: ex.message,
      code: ex.code,
      details: ex.details?.toString() ?? 'UNKNOWN-ERROR',
      hint: ex.hint?.toString() ?? 'UNKNOWN-ERROR',
    );

    failure.appLog(level: AppLogLevel.error, tag: 'SupaPostgresFault');

    return SupaPostgresFault(failure, stackTrace);
  }

  /// Returns the user-facing error message (details or fallback to message).
  String get errorMessage => failure.details ?? failure.message;
}

/// Represents a fault caused by an exception
final class ExceptionFault<T> extends Fault<T> {
  final Exception exception;
  const ExceptionFault(this.exception, StackTrace stackTrace)
    : super._internal(stackTrace);
}

/// Represents a fault caused by an error
final class ErrorFault<T> extends Fault<T> {
  final Object error;
  const ErrorFault(this.error, StackTrace stackTrace)
    : super._internal(stackTrace);
}

/// Represents a fault with unknown cause
final class UnknownFault<T> extends Fault<T> {
  final String text;
  const UnknownFault(this.text, StackTrace stackTrace)
    : super._internal(stackTrace);
}

/// Represents a fault with network connection
final class NetworkFault<T> extends Fault<T> {
  final String text;
  const NetworkFault(this.text, StackTrace stackTrace)
    : super._internal(stackTrace);
}

/// Represents a fault with custom information
final class CustomFault<T> extends Fault<T> {
  final T faultInfo;
  const CustomFault(this.faultInfo, StackTrace stackTrace)
    : super._internal(stackTrace);
}

/// Returns the message of the fault
extension FaultExtension on Fault {
  String get message => switch (this) {
    final ExceptionFault ex => ex.exception.toString().splitError,
    final ErrorFault err => err.error.toString(),
    final UnknownFault text => text.text,
    final CustomFault fault => fault.faultInfo.toString(),
    final FirebaseFault firebaseFault => firebaseFault.errorMessage.splitError,
    final NetworkFault networkFault => networkFault.text.splitError,
    final HttpFault httpFault => httpFault.body.message.toString(),
    final SupaAuthFault supaAuthFault => supaAuthFault.errorMessage.splitError,
    final SupaPostgresFault supaPostgresFault => supaPostgresFault.errorMessage,
  };
}

extension StringX on String {
  String get splitError => split(': ').lastOrNull ?? 'Unknown error';
}
