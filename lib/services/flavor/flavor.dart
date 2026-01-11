import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lensfolio_mobile_app/gen/assets/assets.gen.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:uuid/data.dart';
import 'package:uuid/uuid.dart';

import '_creds.dart';

part '_enums.dart';

class AppFlavor {
  static late final PackageInfo packageInfo;
  static late final String packageName;
  static late final int buildNo;
  static late final String version;
  static late final String deviceId;
  static late final SupabaseCreds supabaseCreds;
  static late final Flavor flavor;

  static Future<void> init() async {
    try {
      packageInfo = await PackageInfo.fromPlatform();
      final deviceInfo = DeviceInfoPlugin();

      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor ?? '';
      } else if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        final bytes = utf8.encode(androidInfo.id);
        final time = bytes.reduce((a, b) => a + b);
        final uuid = const Uuid().v7(config: V7Options(time, bytes));
        deviceId = uuid;
      }

      final flavorString =
          (Platform.isAndroid
                  ? packageInfo.appName.split('-')
                  : packageInfo.packageName.split('.'))
              .last
              .toLowerCase();

      flavor = switch (flavorString) {
        'stage' => Flavor.stage,
        'qa' => Flavor.qa,
        'prod' || 'lensfolio' => Flavor.prod,
        _ => Flavor.stage,
      };

      final creds = await rootBundle.loadString(Assets.creds);
      final credsMap = json.decode(creds);
      supabaseCreds = SupabaseCreds.fromJson(
        credsMap[flavor.name]['supabase'],
      );

      buildNo = int.parse(
        packageInfo.buildNumber.replaceAll(RegExp('[a-z]'), ''),
      );
      version = packageInfo.version;
      packageName = packageInfo.packageName;
    } catch (e) {
      e.appLog(level: AppLogLevel.error, tag: 'APP_ENV_INIT');
    }
  }

  /// Getters
  static bool get isStage => flavor.isStage;
  static bool get isQa => flavor.isQa;
  static bool get isProd => flavor.isProd;
  static bool get isProduction => flavor.isProduction;
  static bool get isProdRelease => flavor.isProd && kReleaseMode;
}
