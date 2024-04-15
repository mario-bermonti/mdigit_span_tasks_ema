import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/notifications.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // final Notifications notifications = Notifications();
  // await notifications.init();
  Get.put(LocalNotifications());
  runApp(const MyApp());
}
