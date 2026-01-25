import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

class FireRemoteConfig {
  static final FireRemoteConfig _instance = FireRemoteConfig._();
  FireRemoteConfig._();

  static FireRemoteConfig get ins => _instance;

  // --- remote config keys --- ///
  static const String generativeModelKey = 'generative_model';

  // --- remote config values --- ///
  String get generativeModel =>
      FirebaseRemoteConfig.instance.getString(generativeModelKey);

  Future<void> init() async {
    try {
      await FirebaseRemoteConfig.instance.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: 60.seconds,
          minimumFetchInterval: 1.minutes,
        ),
      );

      await FirebaseRemoteConfig.instance.setDefaults({
        generativeModelKey: 'gemini-2.5-flash',
      });

      await FirebaseRemoteConfig.instance.fetchAndActivate();
    } catch (e) {
      throw UnknownFault(
        'Something went wrong during remote config initialization!',
        StackTrace.current,
      );
    }
  }
}
