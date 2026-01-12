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

  static Future<UserData> login(Map<String, dynamic> values) async {
    try {
      final response = await _UserMocks.login(values['email']);
      await 1.seconds.delay;

      final raw = response['data'] as Map<String, dynamic>;
      return UserData.fromJson(raw);
    } catch (e, st) {
      if (e is DioException) {
        throw HttpFault.fromDioException(e, st);
      }
      throw UnknownFault('Something went wrong!', st);
    }
  }
}
