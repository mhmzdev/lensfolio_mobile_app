import 'package:firebase_performance/firebase_performance.dart';
import 'package:lensfolio_mobile_app/services/flavor/flavor.dart';

/// Singleton service for Firebase Performance Monitoring
///
/// Provides methods for tracking app performance metrics including:
/// - Custom traces for measuring specific operations
/// - HTTP request metrics
/// - Screen rendering traces
/// - Custom metrics and attributes
class AppPerformance {
  AppPerformance._();

  static AppPerformance? _instance;
  static late FirebasePerformance _firebasePerformance;
  final Map<String, Trace> _activeTraces = {};

  static AppPerformance get ins {
    _instance ??= AppPerformance._();
    return _instance!;
  }

  /// Initializes Firebase Performance Monitoring
  ///
  /// Sets up performance collection and configures app metadata
  Future<void> init() async {
    try {
      _firebasePerformance = FirebasePerformance.instance;

      /// Enable performance monitoring
      await _firebasePerformance.setPerformanceCollectionEnabled(true);
    } catch (e) {
      throw Exception('Error in App Performance init: $e');
    }
  }

  /// Starts a custom trace for performance monitoring
  ///
  /// [name] - Unique identifier for the trace
  /// Returns the created Trace object
  Future<Trace?> startTrace(String name) async {
    try {
      if (_activeTraces.containsKey(name)) {
        return _activeTraces[name];
      }

      final trace = _firebasePerformance.newTrace(name);
      await trace.start();
      _activeTraces[name] = trace;

      return trace;
    } catch (e) {
      return null;
    }
  }

  /// Stops an active trace
  ///
  /// [name] - Name of the trace to stop
  Future<void> stopTrace(String name) async {
    try {
      if (!_activeTraces.containsKey(name)) {
        return;
      }

      final trace = _activeTraces[name];
      await trace?.stop();
      _activeTraces.remove(name);
    } catch (e) {
      // Silently handle errors
    }
  }

  /// Adds a metric to an active trace
  ///
  /// [traceName] - Name of the trace
  /// [metricName] - Name of the metric
  /// [value] - Metric value
  void setMetric(String traceName, String metricName, int value) {
    try {
      if (!_activeTraces.containsKey(traceName)) {
        return;
      }

      _activeTraces[traceName]?.setMetric(metricName, value);
    } catch (e) {
      // Silently handle errors
    }
  }

  /// Increments a metric value in an active trace
  ///
  /// [traceName] - Name of the trace
  /// [metricName] - Name of the metric to increment
  void incrementMetric(String traceName, String metricName, int value) {
    try {
      if (!_activeTraces.containsKey(traceName)) {
        return;
      }

      _activeTraces[traceName]?.incrementMetric(metricName, value);
    } catch (e) {
      // Silently handle errors
    }
  }

  /// Adds a custom attribute to an active trace
  ///
  /// [traceName] - Name of the trace
  /// [key] - Attribute key
  /// [value] - Attribute value
  void setAttribute(String traceName, String key, String value) {
    try {
      if (!_activeTraces.containsKey(traceName)) {
        return;
      }

      _activeTraces[traceName]?.putAttribute(key, value);
    } catch (e) {
      // Silently handle errors
    }
  }

  /// Convenience method to track a complete operation
  ///
  /// Automatically starts and stops a trace around the provided operation
  /// [name] - Trace name
  /// [operation] - Async operation to track
  /// [attributes] - Optional custom attributes
  /// [metrics] - Optional custom metrics
  Future<T> trackOperation<T>(
    String name,
    Future<T> Function() operation, {
    Map<String, String>? attributes,
    Map<String, int>? metrics,
  }) async {
    final trace = await startTrace(name);

    try {
      /// Add custom attributes if provided
      if (attributes != null && trace != null) {
        for (final entry in attributes.entries) {
          trace.putAttribute(entry.key, entry.value);
        }
      }

      /// Execute the operation
      final result = await operation();

      /// Add custom metrics if provided
      if (metrics != null && trace != null) {
        for (final entry in metrics.entries) {
          trace.setMetric(entry.key, entry.value);
        }
      }

      return result;
    } catch (e) {
      /// Track the error as an attribute
      trace?.putAttribute('error', e.toString());
      rethrow;
    } finally {
      await stopTrace(name);
    }
  }

  /// Tracks screen rendering performance
  ///
  /// Call this when a screen is rendered
  /// [screenName] - Name of the screen
  Future<void> trackScreenTrace(String screenName) async {
    final traceName = 'screen_$screenName';
    await startTrace(traceName);

    /// Add screen metadata
    setAttribute(traceName, 'screen_name', screenName);
    setAttribute(traceName, 'app_version', AppFlavor.version);
    setAttribute(traceName, 'flavor', AppFlavor.flavor.name);

    /// Auto-stop after a brief delay to capture initial render
    Future.delayed(const Duration(milliseconds: 500), () {
      stopTrace(traceName);
    });
  }

  /// Creates an HTTP metric manually
  ///
  /// Note: For Dio, use firebase_performance_dio interceptor
  /// This is for manual HTTP tracking if needed
  HttpMetric newHttpMetric(String url, HttpMethod httpMethod) {
    return _firebasePerformance.newHttpMetric(url, httpMethod);
  }

  /// Stops all active traces
  ///
  /// Useful for cleanup or testing
  Future<void> stopAllTraces() async {
    final traceNames = _activeTraces.keys.toList();
    for (final name in traceNames) {
      await stopTrace(name);
    }
  }
}
