import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

Future<void> handleBackgroundMessages(RemoteMessage message) async {
}

class FirebaseNotifications extends GetxController {
  final FirebaseMessaging notifications = FirebaseMessaging.instance;

  @override
  onInit() async {
    super.onInit();
    await init();
  }

  Future<void> init() async {
    await notifications.requestPermission();
    final String? token = await notifications.getToken();
  }
}
