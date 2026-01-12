part of '../login.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.email: 'john.doe@example.com',
      _FormKeys.password: 'password123',
    };
  }
}
