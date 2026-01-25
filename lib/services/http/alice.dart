import 'package:alice/alice.dart';
import 'package:alice/core/alice_dio_interceptor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppAlice {
  AppAlice._();

  static AppAlice? _instance;
  static Alice? _alice;

  static AppAlice get ins {
    _instance ??= AppAlice._();
    return _instance!;
  }

  void init() {
    _alice ??= Alice(
      showInspectorOnShake: true,
      showNotification: kDebugMode,
    );
  }

  void setNavigatorKey(GlobalKey<NavigatorState> key) {
    _alice?.setNavigatorKey(key);
  }

  AliceDioInterceptor getDioInterceptor() {
    if (_alice == null) {
      throw StateError(
        'AppAlice not initialized. Call AppAlice.ins.init() first.',
      );
    }
    return _alice!.getDioInterceptor();
  }

  void showInspector() {
    if (_alice == null) {
      throw StateError(
        'AppAlice not initialized. Call AppAlice.ins.init() first.',
      );
    }
    _alice!.showInspector();
  }
}
