// ignore_for_file: unused_element

part of 'file_repo.dart';

class _FileMocks {
  static Future<Map<String, dynamic>> uploadResume() {
    return Future.value({'status': 200, 'message': 'mock', 'data': {}});
  }

  static Future<Map<String, dynamic>> downloadResume() {
    return Future.value({'status': 200, 'message': 'mock', 'data': {}});
  }

  static Future<Map<String, dynamic>> uploadProfilePicture() {
    return Future.value({'status': 200, 'message': 'mock', 'data': {}});
  }

  static Future<Map<String, dynamic>> deleteFile() {
    return Future.value({'status': 200, 'message': 'mock', 'data': {}});
  }
}
