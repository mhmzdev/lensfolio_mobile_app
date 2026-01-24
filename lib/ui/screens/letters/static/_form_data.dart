part of '../letters.dart';

class _FormData {
  static Map<String, dynamic> initialValues() {
    if (!kDebugMode) {
      return {};
    }

    return {
      _FormKeys.companyName: 'Sastaticket.pk',
      _FormKeys.position: 'Software Engineer',
      _FormKeys.jobDescription:
          'We are seeking a talented Flutter Developer to join our dynamic team. The ideal candidate will have experience building cross-platform mobile applications using Flutter and Dart. You will be responsible for developing high-quality mobile apps, collaborating with cross-functional teams, and ensuring optimal performance across iOS and Android platforms. Strong knowledge of state management, RESTful APIs, and modern development practices is required.',
    };
  }
}
