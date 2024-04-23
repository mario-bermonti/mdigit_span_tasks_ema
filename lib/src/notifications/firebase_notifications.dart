import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/local_notifications.dart';

/// Handle messages that are received while app in the foreground.
Future<void> _handleForegroundMessages(RemoteMessage message) async {
  final LocalNotifications localNotifications = Get.find();
  final RemoteNotification? notification = message.notification;
  final AndroidNotification? android = message.notification?.android;
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

/// Service that handles all interactions with FCM.
///
/// It is a [GetxController] so it can be accessed from anywhere in the app.
class FirebaseNotifications extends GetxController {
  final FirebaseMessaging notifications = FirebaseMessaging.instance;
  final LocalNotifications _localNotifications = Get.put(LocalNotifications());

  @override
  onInit() async {
    super.onInit();
    await init();
  }

  /// Initializes the FCM and all necessary configuration.
  Future<void> init() async {
    await notifications.requestPermission();
    final String? token = await notifications.getToken();
    print('token: $token');
    FirebaseMessaging.onMessage.listen(((message) async {
      await _handleForegroundMessages(message);
    }));
  }
}
