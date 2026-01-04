part of '../letters.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.companyName: 'CompanyName',
      _FormKeys.position: 'Position',
      _FormKeys.description: 'Description',
    };
  }
}
