// ignore_for_file: unused_element

part of 'user_repo.dart';

class _UserMocks {
  static Future<Map> register() {
    return Future.value({'message': 'mock', 'data': ''});
  }

  static Future<Map<String, dynamic>> login() {
    return Future.value({'status': 200, 'message': 'mock', 'data': {}});
  }
}
