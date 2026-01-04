part of 'user_repo.dart';

class _UserProvider {
  static Future<UserData> register() async {
    try {
      final raw = <String, dynamic>{};
      return UserData.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<UserData> logout() async {
    try {
      final raw = <String, dynamic>{};
      return UserData.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<UserData> fetch() async {
    try {
      final raw = <String, dynamic>{};
      return UserData.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }

  static Future<UserData> login() async {
    try {
      final raw = <String, dynamic>{};
      return UserData.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
