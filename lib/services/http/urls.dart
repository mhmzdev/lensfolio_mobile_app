import 'package:lensfolio_mobile_app/services/flavor/flavor.dart';

class BaseUrls {
  static String baseUrl() {
    if (AppFlavor.isProduction) {
      return 'https://remotive.com/api/';
    }

    ///
    /// Since this API is public and doesn't have any staging URL
    /// so we've used the same for both staging and production.
    /// In real life, we would use a different URL for staging.
    /// eg. https://staging.remotive.com/api/
    ///
    return 'https://remotive.com/api/';
  }
}
