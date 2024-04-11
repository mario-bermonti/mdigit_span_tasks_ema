import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class Notifications extends GetxController {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  Future<void> showNotification({
    int id = 0,
    required String title,
    required String body,
    required String payload,
  }) async {}
}
