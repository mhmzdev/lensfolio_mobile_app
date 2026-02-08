import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/providers/app.dart';

/// A test-friendly version of AppProvider that doesn't use SharedPreferences
class TestAppProvider extends ChangeNotifier implements AppProvider {
  @override
  var themeMode = ThemeMode.light;

  @override
  var key = const Key('test-app');

  @override
  var firstOpen = false;

  @override
  void setTheme(ThemeMode newTheme) {
    if (themeMode == newTheme) return;
    themeMode = newTheme;
    notifyListeners();
  }

  @override
  void setFirstOpen() {
    firstOpen = true;
    notifyListeners();
  }

  @override
  void reset() {
    firstOpen = true;
    themeMode = ThemeMode.system;
    key = Key(DateTime.now().toString());
    notifyListeners();
  }

  @override
  void resetKey([bool notify = true]) {
    key = Key(DateTime.now().toString());
    if (notify) notifyListeners();
  }
}
