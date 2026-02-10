import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:lensfolio_mobile_app/services/http/alice.dart';

/// Local notification handler for Lensfolio.
///
/// This service is **local-only** (no remote/Firebase wiring). It also supports
/// a debug-only "Alice Inspector" notification that opens the Alice inspector
/// when tapped.
class LocalNotificationHandler {
  LocalNotificationHandler._();

  static LocalNotificationHandler? _instance;
  static final _plugin = FlutterLocalNotificationsPlugin();

  static LocalNotificationHandler get ins {
    _instance ??= LocalNotificationHandler._();
    return _instance!;
  }

  /// Initialize local notifications
  Future<void> init() async {
    const androidSettings = AndroidInitializationSettings(
      'ic_launcher',
    );
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _plugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        // Show Alice inspector when notification is tapped (debug only)
        if (kDebugMode && details.id == 0) {
          AppAlice.ins.showInspector();
        }
      },
    );

    // Request Android 13+ notification permissions
    if (Platform.isAndroid) {
      final hasAndroidPermission = await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.requestNotificationsPermission();

      'Android notification permission granted: $hasAndroidPermission'.appLog(
        level: AppLogLevel.info,
        tag: 'LOCAL_NOTIFICATION',
      );
    } else if (Platform.isIOS) {
      final hasIOSPermission = await _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );

      'iOS notification permission granted: $hasIOSPermission'.appLog(
        level: AppLogLevel.info,
        tag: 'LOCAL_NOTIFICATION',
      );
    }
  }

  /// Trigger a custom notification with specified title and body
  /// Useful for showing error/info notifications from anywhere in the app
  ///
  /// [title] The notification title
  /// [body] The notification body/message
  /// [notificationId] Optional unique ID for the notification (defaults to hashCode of title+body)
  /// [playSound] Whether to play sound with the notification (defaults to true)
  /// [channelId] Optional custom channel ID (defaults to 'app_alerts')
  /// [channelName] Optional custom channel name (defaults to 'App Alerts')
  Future<void> triggerNotification({
    required String title,
    required String body,
    int? notificationId,
    bool playSound = true,
    String channelId = 'app_alerts',
    String channelName = 'App Alerts',
  }) async {
    try {
      final id = notificationId ?? (title + body).hashCode;

      'Triggering custom notification: $title'.appLog(
        level: AppLogLevel.info,
        tag: 'LOCAL_NOTIFICATION',
      );

      await _plugin.show(
        id,
        title,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channelId,
            channelName,
            channelDescription: 'Important app notifications and alerts',
            priority: Priority.high,
            importance: Importance.max,
            playSound: playSound,
            styleInformation: BigTextStyleInformation(body),
          ),
          iOS: DarwinNotificationDetails(presentSound: playSound),
        ),
      );

      'Custom notification shown successfully'.appLog(
        level: AppLogLevel.debug,
        tag: 'LOCAL_NOTIFICATION',
      );
    } catch (e) {
      'Failed to show custom notification: $e'.appLog(
        level: AppLogLevel.error,
        tag: 'LOCAL_NOTIFICATION',
      );
    }
  }
}
