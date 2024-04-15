import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class Notifications extends GetxController {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  @override
  onInit() async {
    super.onInit();
    await init();
  }

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );
    await _notifications.initialize(initializationSettings);
  }

  Future<void> askNotificationPermission() async {
    final AndroidFlutterLocalNotificationsPlugin? manager =
        _notifications.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>();
    if (manager == null) {
      throw Exception(
          'Error in setup for requesting permission to send notifications');
    }
      throw Exception('Permission to send notifications not granted');
    }
    await manager.requestNotificationsPermission();
  }

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

  NotificationDetails get notificationDetails {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'tasks_reminders',
      'task_reminders',
      importance: Importance.max,
      priority: Priority.max,
      ticker: 'task_reminder',
    );
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    return notificationDetails;
  }
}
