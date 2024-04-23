import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

/// Manager for local notifications
///
/// It is a [GetXController] so it can be accessed from anywhere in the app.
class LocalNotifications extends GetxController {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  @override
  onInit() async {
    super.onInit();
    await init();
  }

  /// Initializes the [LocalNotifications] for android and ios.
  ///
  /// Must be called before using the notifications objects.
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

  /// Asks the user during runtime for permission to send notifications.
  ///
  /// Only android is supported. Will cause throw an [Exception] if the
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
    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    return notificationDetails;
  }

  /// Shows a local notification to the user with the given information.
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
