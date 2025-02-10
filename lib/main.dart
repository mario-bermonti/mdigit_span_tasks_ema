import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mdigit_span_tasks_ema/src/auth/auth.dart';
import 'package:mdigit_span_tasks_ema/src/auth/participant.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/models/participant.dart'
    as ema_participant;
import 'package:mdigit_span_tasks_ema/src/digit_span_tasks/config/config.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/notifications_manager.dart';
import 'package:mdigit_span_tasks_ema/src/core/participant/participant_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final Participant participant =
      await Auth(auth: FirebaseAuth.instance).signIn();
  final ParticipantService participantService = ParticipantService.init();
  if (participant.id.isNotEmpty) {
    final ema_participant.Participant emaParticipant =
        ema_participant.Participant(
      id: participant.id,
    );
    participantService.save(participant: emaParticipant);
  }

  Get.put(participant, permanent: true);
  Get.put(DigitSpanTaskConfig(), permanent: true);
  final NotificationsManager notificationManager =
      Get.put(NotificationsManager());
  await GetStorage.init();
  final bool consentCompleted = GetStorage().read('consentCompleted') ?? false;
  if (consentCompleted) {
    await notificationManager.initNotifications();
    final String? token = await notificationManager.getToken();
    if (token != null) {
      final ema_participant.Participant emaParticipant =
          ema_participant.Participant(
        id: participant.id,
        notificationTokens: [token],
      );

      participantService.save(participant: emaParticipant);
    }
  }
  runApp(const MyApp());
}
