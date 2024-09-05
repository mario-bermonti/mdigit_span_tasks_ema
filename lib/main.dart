import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mdigit_span_tasks_ema/src/auth/auth.dart';
import 'package:mdigit_span_tasks_ema/src/auth/participant.dart';
import 'package:mdigit_span_tasks_ema/src/digit_span_tasks/config/config.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/local_notifications.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/firebase_notifications.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await GetStorage.init();
  GetStorage().remove('baselineCompleted');
  Get.put(LocalNotifications());
  Get.put(FirebaseNotifications());
  final Participant participant =
      await Auth(auth: FirebaseAuth.instance).signIn();
  Get.put(participant, permanent: true);
  Get.put(DigitSpanTaskConfig(), permanent: true);
  runApp(const MyApp());
}
