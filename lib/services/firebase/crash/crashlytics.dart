import 'package:dio/dio.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';
import 'package:lensfolio_mobile_app/services/flavor/flavor.dart';
import 'package:lensfolio_mobile_app/services/route_logger/route_logger.dart';
part '_exts.dart';

class EnhancedCrashlytics {
  EnhancedCrashlytics._();

  static EnhancedCrashlytics? _instance;
  static late FirebaseCrashlytics _firebaseCrashlytics;
  static String? _lastAction;
  bool _apiContextSet = false;

  static EnhancedCrashlytics get ins {
    _instance ??= EnhancedCrashlytics._();
    return _instance!;
  }

  Future<void> init() async {
    try {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      _firebaseCrashlytics = FirebaseCrashlytics.instance;

      await _setAppVersionInfo();

      final Function? originalOnError = FlutterError.onError;
      FlutterError.onError = (FlutterErrorDetails errorDetails) async {
        /// Add navigation context to crashes
        await _addNavigationContext();
        await _firebaseCrashlytics.recordFlutterError(errorDetails);

        /// Forward to original handler
        originalOnError!(errorDetails);
      };

      'Enhanced Crashlytics initialized successfully'.appLog();
    } catch (e) {
      throw Exception('Error in Enhanced Crashlytics init: $e');
    }
  }

  Future<void> recordNonFatalEvent(
    dynamic exception,
    StackTrace? stackTrace, {
    String? reason,
    bool includeNavigation = false,
    String? lastAction,
  }) async {
    await _recordEvent(
      exception,
      stackTrace,
      reason: reason,
      includeNavigation: includeNavigation,
      lastAction: lastAction,
    );
  }

  Future<void> recordFatalEvent(
    dynamic exception,
    StackTrace stackTrace, {
    String? reason,
    String? lastAction,
  }) async {
    await _recordEvent(
      exception,
      stackTrace,
      reason: reason,
      fatal: true,
      includeNavigation: true,
      lastAction: lastAction,
    );
  }

  /// This is the BRAIN of the Crashlytics, it has almost all the configurations
  /// that we can use to record the events to Crashlytics.
  Future<void> _recordEvent(
    dynamic exception,
    StackTrace? stackTrace, {
    String? reason,
    bool fatal = false,
    bool includeNavigation = false,
    String? lastAction,
  }) async {
    try {
      /// Add navigation context if requested or if fatal, just to avoid extra memory usage
      /// we are not adding the navigation context for non-fatal errors. BUT, if needed
      /// we can use [includeNavigation] flag.
      if (includeNavigation || fatal) {
        await _addNavigationContext();
      }

      // Add last action if provided
      if (lastAction != null) {
        await _firebaseCrashlytics.setCustomKey('last_action', lastAction);
      } else if (_lastAction != null) {
        await _firebaseCrashlytics.setCustomKey('last_action', _lastAction!);
      }

      if (exception is HttpFault) {
        final body = exception.body;
        Future.wait([
          if (body.status != null)
            _firebaseCrashlytics.setCustomKey('api_status_code', body.status!),
          if (body.message != null)
            _firebaseCrashlytics.setCustomKey(
              'api_response_message',
              body.message!,
            ),
          if (body.data != null)
            _firebaseCrashlytics.setCustomKey(
              'api_response',
              body.data.toString(),
            ),
        ]);

        _apiContextSet = true;
      } else if (exception is DioException) {
        final response = exception.response;
        if (response != null) {
          Future.wait([
            _firebaseCrashlytics.setCustomKey(
              'api_status_code',
              response.statusCode ?? 0,
            ),
            _firebaseCrashlytics.setCustomKey(
              'api_method',
              response.requestOptions.method,
            ),
            _firebaseCrashlytics.setCustomKey(
              'api_url',
              response.requestOptions.uri.toString(),
            ),
          ]);
          if (response.data != null) {
            _firebaseCrashlytics.setCustomKey(
              'api_response',
              response.data.toString(),
            );
          }
          _apiContextSet = true;
        }
      } else if (_apiContextSet) {
        Future.wait([
          _firebaseCrashlytics.setCustomKey('api_status_code', 0),
          _firebaseCrashlytics.setCustomKey('api_method', ''),
          _firebaseCrashlytics.setCustomKey('api_url', ''),
          _firebaseCrashlytics.setCustomKey('api_response', ''),
          _firebaseCrashlytics.setCustomKey('api_response_message', ''),
        ]);
        _apiContextSet = false;
      }

      await _firebaseCrashlytics.recordError(
        exception,
        stackTrace,
        reason: reason,
        fatal: fatal,
      );

      'Recorded ${fatal ? 'fatal' : 'non-fatal'} error: $reason'.appLog(
        level: AppLogLevel.info,
        tag: 'CRASHLYTICS',
      );
    } catch (e) {
      'Failed to record error to Crashlytics: $e'.appLog(
        level: AppLogLevel.error,
        tag: 'CRASHLYTICS',
      );
    }
  }

  void flog(String message) {
    _firebaseCrashlytics.log(message);
  }

  /// The only missing piece of the puzzle in Crashlytics are it doesn't
  /// recording the Navigation History. So, we already have a service [RouteLogger]
  /// that is recording the Navigation History. Hence, we'll be using that to have our
  /// history stored in Crashlytics.
  Future<void> _addNavigationContext() async {
    try {
      /// Get last 10 routes from RouteLogger, this is to avoid any memory issues
      /// with the navigation history.
      final routeHistory = RouteLogger.routeHistory;
      final last10Routes = routeHistory.length > 10
          ? routeHistory.sublist(routeHistory.length - 10)
          : routeHistory;

      // Set navigation breadcrumbs
      await _firebaseCrashlytics.setCustomKey(
        'navigation_history',
        last10Routes.join(' → '),
      );
    } catch (e) {
      'Failed to add navigation context: $e'.appLog(
        level: AppLogLevel.error,
        tag: 'CRASHLYTICS',
      );
    }
  }

  Future<void> _setAppVersionInfo() async {
    await Future.wait([
      _firebaseCrashlytics.setCustomKey('app_version', AppFlavor.version),
      _firebaseCrashlytics.setCustomKey(
        'build_number',
        AppFlavor.buildNo.toString(),
      ),
      _firebaseCrashlytics.setCustomKey('package_name', AppFlavor.packageName),
    ]);
  }

  void setCustomKey(String key, dynamic value) {
    _firebaseCrashlytics.setCustomKey(key, value);
  }

  /// Track user action for crash context, this might NOT be used very much
  /// but keeping it here for future reference.
  void trackUserAction(String action) {
    _lastAction = action;
    'User action: $action'.appLog(level: AppLogLevel.info, tag: 'USER_ACTION');
  }

  Future<void> setUserContext({
    String? userId,
    String? userRole,
    List<String>? userTypes,
  }) async {
    if (userId != null) {
      await _firebaseCrashlytics.setUserIdentifier(userId);
    }

    if (userRole != null) {
      setCustomKey('user_role', userRole);
    }

    if (userTypes != null) {
      setCustomKey('user_types', userTypes.join(', '));
    }
  }

  /// --- ONLY FOR TESTING --- ///
  /// Forces a crash for testing
  void testCrash() {
    assert(
      !kReleaseMode,
      'testCrash() should only be used in debug/profile mode',
    );
    _firebaseCrashlytics.crash();
  }

  /// Test navigation tracking
  Future<void> testNavigationTracking() async {
    assert(
      !kReleaseMode,
      'testNavigationTracking() should only be used in debug/profile mode',
    );

    // Add navigation context and log it
    await _addNavigationContext();
    'Navigation tracking test completed'.appLog(
      level: AppLogLevel.info,
      tag: 'CRASHLYTICS',
    );

    // Optionally trigger a non-fatal error to see navigation context
    await recordNonFatalEvent(
      'Navigation tracking test',
      StackTrace.current,
      reason: 'Testing navigation context in crashes',
      includeNavigation: true,
    );
  }
}
