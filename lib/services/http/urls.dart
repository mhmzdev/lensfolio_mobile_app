import 'package:lensfolio_mobile_app/services/flavor/flavor.dart';

class BaseUrls {
  static String baseUrl() {
    if (AppFlavor.isProduction) {
      return 'https://remotive.com/api/';
    }

    return 'https://staging.remotive.com/api/';
  }
}
