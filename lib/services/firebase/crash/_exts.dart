part of 'crashlytics.dart';

extension EnhancedCrashlyticsExt<T> on T {
  T flog([String? message]) {
    EnhancedCrashlytics.ins.flog(message ?? toString());
    return this;
  }

  T trackUserAction([String? action]) {
    EnhancedCrashlytics.ins.trackUserAction(action ?? toString());
    return this;
  }

  T setCustomKey(String key, dynamic value) {
    EnhancedCrashlytics.ins.setCustomKey(key, value);
    return this;
  }
}
