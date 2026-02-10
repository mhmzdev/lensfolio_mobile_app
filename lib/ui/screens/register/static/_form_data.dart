part of '../register.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.fullName: 'Hamza Shakeel',
      _FormKeys.email: 'hamza.6.shakeel+1@gmail.com',
      _FormKeys.password: 'Hamza@123',
      _FormKeys.confirmPassword: 'Hamza@123',
    };
  }
}
