import 'package:lensfolio_mobile_app/services/fault/faults.dart';
import 'package:url_launcher/url_launcher.dart';

class LauncherHelper {
  static void url(String url) async {
    try {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } catch (e) {
      CustomFault(e.toString(), StackTrace.current);
    }
  }
}
