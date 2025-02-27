import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/models/notification.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/remote_notifications.dart';
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
    Get.toNamed('/emaScreen');
  }
}
