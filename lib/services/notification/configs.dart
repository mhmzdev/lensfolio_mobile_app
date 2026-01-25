import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Android notification channel configuration
const methodChannel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  description:
      'This channel is used for important notifications.', // description
  importance: Importance.high,
);
