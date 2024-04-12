import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class Notifications extends GetxController {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

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
      getNotificationDetails(),
      payload: payload,
    );
  }

}
