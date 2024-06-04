import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mdigit_span_tasks_ema/src/digit_span_tasks/config/config.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/local_notifications.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/firebase_notifications.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(LocalNotifications());
  Get.put(FirebaseNotifications());
  Get.put(DigitSpanTaskConfig(), permanent: true);
  runApp(const MyApp());
}
