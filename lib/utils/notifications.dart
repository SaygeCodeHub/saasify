import 'dart:developer';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:saasify/caches/cache.dart';
import 'package:saasify/caches/cache_keys.dart';

import '../../di/app_module.dart';

class NotificationUtil {
  final pushNotifications = FirebaseMessaging.instance;
  final Cache _cache = getIt<Cache>();

  Future<void> initNotifications() async {
    await pushNotifications.requestPermission();
    await pushNotifications.getNotificationSettings();
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }

  ifTokenExists<bool>() async {
    String? fcmToken = await _cache.getFCMToken(CacheKeys.fcmToken);
    return fcmToken != null;
  }

  getToken<String>() async {
    return await pushNotifications.getToken();
  }
}

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  log('Notification title ${message.notification!.title}');
  log('Notification body ${message.notification!.body}');
}
