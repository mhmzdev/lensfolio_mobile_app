part of '../login.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.email: 'hamza.6.shakeel+1@gmail.com',
      _FormKeys.password: 'Hamza@123',
    };
  }
}
