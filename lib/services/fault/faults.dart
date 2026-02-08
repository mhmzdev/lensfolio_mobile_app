import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part '_supabase_faults.dart';

/// Represents the body and status code of a HTTP response that failed
typedef HttpFailure = ({
  Map<String, dynamic>? data,
  int? status,
  String? message,
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
    final SupaStorageFault supaStorageFault => supaStorageFault.message,
  };
}

extension StringX on String {
  String get splitError => split(': ').lastOrNull ?? 'Unknown error';
}
