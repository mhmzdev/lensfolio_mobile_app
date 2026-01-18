part of '../login.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.email: 'john.doe@gmail.com',
      _FormKeys.password: 'Password@123',
    };
  }
}
