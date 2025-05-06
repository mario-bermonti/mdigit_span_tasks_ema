import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Manager for local notifications.
///
/// Delivers notifications while application is in the background on Android.
/// Currently uses the flutter_local_notifications package.
class LocalNotifications {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<bool> areEnabled() async {
    if (!Platform.isAndroid) {
      throw Exception(
          "Not supported. Local notifications are only implemented for Android.");
    }
    final bool? authorized = await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.areNotificationsEnabled();
    if (authorized == null) {
      throw Exception(
          'Error checking local notifications on Android. Make sure '
          '`flutter_local_notifications` plugin has been configured correctly. '
          'Also setup and init `LocalNotifications` by calling the '
          'appropriate methods.');
    }
    return authorized;
  }

  Future<void> init({
    required void Function(NotificationResponse response)
        onLocalNotificationTap,
  }) async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await _notifications.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onLocalNotificationTap,
    );
  }

  /// Asks the user during runtime for permission to send notifications.
  ///
  /// Only Android is supported and will cause throw an [Exception] if the
  /// platform is not supported or the user does not grant permission.
  Future<void> askNotificationPermission() async {
    if (!Platform.isAndroid) {
      throw Exception("Notifications not implemented for this platform");
    }
    final AndroidFlutterLocalNotificationsPlugin? manager =
        _notifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (manager == null) {
      throw Exception(
          'Error in setup for requesting permission to send notifications');
    }
    bool? granted = await manager.requestNotificationsPermission();
    if (granted == null || granted == false) {
      throw Exception('Permission to send notifications not granted');
    }
  }

  /// Configures the details for the supported platforms and returns them.
  NotificationDetails get notificationDetails {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'ema_tasks_reminders',
      'ema_tasks_reminders',
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'task_reminder',
    );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
    );

    return notificationDetails;
  }

  /// Shows a local notification to the user.
  Future<void> showNotification({
    int id = 0,
    required String title,
    required String body,
    required String payload,
  }) async {
    await _notifications.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
