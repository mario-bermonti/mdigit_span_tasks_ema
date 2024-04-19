import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

/// Handles messages received from FCM while in the background.
///
/// It needs to be a top-level method (static method do not work).
Future<void> handleBackgroundMessages(RemoteMessage message) async {
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
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessages);
  }
}
