import 'dart:convert';

import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCache {
  AppCache._();

  static AppCache? _instance;
  static SharedPreferences? _prefs;

  static AppCache get ins {
    _instance ??= AppCache._();
    return _instance!;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const String _userKey = 'user';

  /// Sets current user object to cache
  Future<void> setUser(UserData user) async {
    try {
      'User cached'.appLog(
        tag: 'APP_CACHE: setUser()',
        toCrashlytics: true,
      );
      await _prefs!.setString(_userKey, jsonEncode(user.toJson()));
    } catch (e) {
      'Error caching user: $e'.appLog(
        tag: 'APP_CACHE: setUser()',
        level: AppLogLevel.error,
      );
    }
  }

  /// Gets current user object from cache
  UserData? get user => _prefs?.getString(_userKey) != null
      ? UserData.fromJson(jsonDecode(_prefs!.getString(_userKey)!))
      : null;

  Future<void> reset() async {
    await _prefs?.clear();
  }
}
