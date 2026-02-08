part of 'faults.dart';

/// Represents Supabase Postgres error details
typedef PostgresFailure = ({
  String message,
  String? code,
  String? details,
  String? hint,
});

/// Represents Supabase Storage error details
typedef StorageFailure = ({
  String message,
  String? error,
  int? statusCode,
});

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

final class SupaStorageFault<T> extends Fault<T> {
  final StorageFailure failure;
  const SupaStorageFault(this.failure, StackTrace stackTrace)
    : super._internal(stackTrace);

  factory SupaStorageFault.fromStorageException(
    StorageException ex,
    StackTrace stackTrace,
  ) {
    ex.message.appLog(level: AppLogLevel.error, tag: 'SupaStorageFault');

    final statusCodeStr = ex.statusCode;
    final statusCode = int.tryParse(statusCodeStr ?? '');
    final errorCode = ex.error;

    final userMessage = switch (statusCode) {
      400 =>
        'Review the request parameters and structure, ensure they meet the API\'s requirements.',
      401 =>
        'The provided JWT (JSON Web Token) is invalid. The JWT provided might be expired or malformed, provide a valid JWT',
      403 =>
        'Access to the specified resource is denied. Check your credentials, signature format, and RLS policies.',
      404 =>
        'The specified resource does not exist, or you don\'t have permissions to access it.',
      409 =>
        'The specified resource already exists. Use a different name or identifier to avoid conflicts.',
      411 =>
        'The Content-Length header is missing. Ensure it is included in the request with the correct value.',
      413 =>
        'The entity being uploaded is too large. Verify the max-file-limit in your Project Settings.',
      416 =>
        'The specified range is not valid. Make sure the range is within the file size boundary.',
      423 =>
        'The specified resource is locked. Wait and try the request again.',
      500 =>
        'An internal server error occurred. Investigate server logs or Contact Support.',
      503 =>
        'The request rate is too high and has been throttled. Reduce the request rate or implement retry mechanisms.',
      504 =>
        'Timeout occurred while accessing the database. Investigate database performance.',
      _ => ex.message,
    };

    return SupaStorageFault(
      (
        message: userMessage,
        error: errorCode,
        statusCode: statusCode,
      ),
      stackTrace,
    );
  }

  String get message => failure.message;
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
