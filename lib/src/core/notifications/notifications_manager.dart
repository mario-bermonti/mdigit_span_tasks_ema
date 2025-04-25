import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/core/navigator_service/navigator_service.dart';
import 'package:mdigit_span_tasks_ema/src/core/notifications/models/notification.dart';
import 'package:mdigit_span_tasks_ema/src/core/notifications/remote_notifications.dart';
import 'package:uuid/uuid.dart';

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

  final Map<String, dynamic> remoteNotification = {
    'id': message.messageId,
    'type': message.from,
    'title': notification.title,
    'body': notification.body,
    'timeSent': message.sentTime?.toString(),
  };
  if (android != null) {
    await localNotifications.showNotification(
      title: notification.title ?? '',
      body: notification.body ?? '',
      payload: jsonEncode(remoteNotification),
    );
  }
}

class NotificationsManager extends GetxService {
  final RemoteNotifications _remoteNotifications = RemoteNotifications();
  final LocalNotifications _localNotifications = LocalNotifications();

  /// Function that will be called whenever a user taps on a notification
  Function({required Notification notification})? handleData;

  NotificationsManager({this.handleData});

  /// Returns true if notifications are enabled on this device.
  ///
  /// On Android, it checks using both remote (FCM) and local
  /// notifications (flutter_local_notifications).
  Future<bool> areNotificationsEnabled() async {
    final bool remoteEnabled = await _remoteNotifications.areEnabled();
    if (!Platform.isAndroid) {
      return remoteEnabled;
    }
    final bool localEnabled = await _localNotifications.areEnabled();
    return remoteEnabled && localEnabled;
  }

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
  Future<void> onNotificationTap(dynamic message) async {
    final DateTime timeTapped = DateTime.now();
    final Notification notification;

    if (message is RemoteMessage) {
      notification = Notification(
        notificationId: message.messageId ?? const Uuid().v4(),
        notificationType: message.from,
        title: message.notification?.title,
        body: message.notification?.body,
        timeSent: message.sentTime,
        timeTapped: timeTapped,
      );
    } else {
      final Map<String, dynamic> payload = jsonDecode(message.payload!);

      notification = Notification(
        notificationId: const Uuid().v4(),
        notificationType: payload["id"],
        title: payload['title'],
        body: payload['body'],
        timeSent: DateTime.parse(payload['timeSent']),
        timeTapped: timeTapped,
      );
    }
    if (handleData != null) {
      handleData!(notification: notification);
    }
    final NavigatorService navigatorService = Get.find();
    final String nextScreen = await navigatorService.determineNextScreen();
    Get.offAndToNamed(nextScreen);
  }
}
