import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/remote_notifications.dart';

import 'local_notifications.dart';

/// Handle messages that are received while app in the foreground.
Future<void> _onForegroundNotification(
  RemoteMessage message,
) async {
  final RemoteNotification? notification = message.notification;
  final AndroidNotification? android = message.notification?.android;
  final LocalNotifications localNotifications = LocalNotifications();
  if (notification == null || notification.body == null) {
    return;
  }
  if (android != null) {
    await localNotifications.showNotification(
      title: notification.title ?? '',
      body: notification.body ?? '',
      payload: '',
    );
  }
}

class NotificationsManager extends GetxService {
  final RemoteNotifications _remoteNotifications = RemoteNotifications();
  final LocalNotifications _localNotifications = LocalNotifications();

  bool get localNotificationsEnabled => _localNotifications.authorized ?? false;
  bool get remoteNotificationsEnabled =>
      _remoteNotifications.authorizationStatus ==
      AuthorizationStatus.authorized;

  RemoteMessage? get notificationWhileOnTerminated =>
      _remoteNotifications.initialMessage;

  /// Returns the token used to send remote notifications to user.
  Future<String?> getToken() async => await _remoteNotifications.getToken();

  Future<void> setupNotifications() async {
    await _remoteNotifications.setup();
  }

  Future<void> initNotifications() async {
    await _remoteNotifications.init(
      onForegroundNotification: _onForegroundNotification,
      onNotificationTap: onNotificationTap,
    );
    if (Platform.isAndroid) {
      await _localNotifications.init(onLocalNotificationTap: onNotificationTap);
    }
  }

  /// Handles notification taps
  void onNotificationTap(dynamic message) {
    Get.toNamed('/emaScreen');
  }
}
