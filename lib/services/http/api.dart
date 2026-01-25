import 'package:dio/dio.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:lensfolio_mobile_app/services/flavor/flavor.dart';
import 'package:lensfolio_mobile_app/services/http/alice.dart';

import 'urls.dart';

abstract class Api {
  final String baseUrl;
  late final Dio ins;

  Api(this.baseUrl) {
    ins = Dio(
      BaseOptions(
        contentType: 'application/json',
        connectTimeout: 1.minutes,
        receiveTimeout: 1.minutes,
        baseUrl: baseUrl,
        headers: {
          'accept': 'application/json',
        },
      ),
    );
    ins.interceptors.add(_RetryInterceptor(ins));
    if (!AppFlavor.isProdRelease) {
      ins.interceptors.add(AppAlice.ins.getDioInterceptor());
    }
  }
}

/// Interceptor that implements exponential backoff retry mechanism.
/// Retries failed requests up to [_maxRetries] times with increasing delays.
class _RetryInterceptor extends Interceptor {
  final Dio dio;

  _RetryInterceptor(this.dio);

  static const int _maxRetries = 7;
  static const int _baseDelayMs = 1000;

  /// Determines if the error is retryable (network/timeout issues).
  bool _shouldRetry(DioException err) {
    return err.type == DioExceptionType.connectionTimeout ||
        err.type == DioExceptionType.sendTimeout ||
        err.type == DioExceptionType.receiveTimeout ||
        err.type == DioExceptionType.connectionError ||
        (err.response?.statusCode != null &&
            err.response!.statusCode! >= 500 &&
            err.response!.statusCode! < 600);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final attempt = err.requestOptions.extra['retryAttempt'] ?? 0;

    if (_shouldRetry(err) && attempt < _maxRetries) {
      final nextAttempt = attempt + 1;
      final delayMs =
          _baseDelayMs * (1 << attempt); // 1s, 2s, 4s, 8s, 16s, 32s, 64s

      'Retry attempt $nextAttempt/$_maxRetries after ${delayMs}ms'.appLog(
        tag: 'RETRY_INTERCEPTOR',
      );

      await delayMs.milliseconds.delay;

      try {
        err.requestOptions.extra['retryAttempt'] = nextAttempt;
        final response = await dio.fetch(err.requestOptions);
        return handler.resolve(response);
      } on DioException catch (e) {
        return handler.reject(e);
      }
    }

    return handler.next(err);
  }
}

class AppApi extends Api {
  AppApi()
    : super(
        BaseUrls.baseUrl(),
      );
}
