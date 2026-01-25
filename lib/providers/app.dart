import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

final themeMap = {
  'system': ThemeMode.system,
  'dark': ThemeMode.dark,
  'light': ThemeMode.light,
};

enum Cache {
  theme,
  firstOpen,
}

extension ThemeModeX on ThemeMode {
  bool get isDark => this == ThemeMode.dark;
  bool get isLight => this == ThemeMode.light;
  bool get isSystem => this == ThemeMode.system;
}

class AppProvider extends ChangeNotifier {
  static AppProvider s(BuildContext context, [bool listen = false]) =>
      Provider.of<AppProvider>(context, listen: listen);

  var themeMode = ThemeMode.light;
  var key = const Key('app');
  var firstOpen = false;

  late SharedPreferences _cache;

  AppProvider() {
    _init();
  }

  void _init() async {
    _cache = await SharedPreferences.getInstance();

    final cachedTheme = _cache.get(Cache.theme.toString());
    themeMode = cachedTheme == null ? themeMode : themeMap[cachedTheme]!;
    themeMode = ThemeMode.dark;

    final hasOpened = _cache.get(Cache.firstOpen.toString());
    firstOpen = hasOpened == null;

    notifyListeners();
  }

  void setTheme(ThemeMode newTheme) {
    if (themeMode == newTheme) return;
    themeMode = newTheme;
    notifyListeners();
    _cache.setString(
      Cache.theme.toString(),
      newTheme.toString().split('.').last,
    );
  }

  void setFirstOpen() {
    firstOpen = true;
    notifyListeners();
    _cache.setBool(Cache.firstOpen.toString(), true);
  }

  void reset() async {
    firstOpen = true;
    themeMode = ThemeMode.system;
    await _cache.clear();
    await _cache.reload();
    key = Key(DateTime.now().toString());
    notifyListeners();
  }

  void resetKey([bool notify = true]) {
    key = Key(DateTime.now().toString());
    if (notify) notifyListeners();
  }
}
