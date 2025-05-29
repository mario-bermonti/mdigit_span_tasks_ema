import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mdigits/src/auth/auth.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/ema_db/participant/models/participant.dart'
    as ema_participant;
import 'package:mdigits/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigits/src/core/ema_db/progress/models/status.dart';
import 'package:mdigits/src/core/navigator_service/navigator_service.dart';
import 'package:mdigits/src/digit_span_tasks/config/config.dart';
import 'package:mdigits/src/core/participant/participant_service.dart';
import 'package:mdigits/src/notifications/data/notifications_manager_service.dart';
import 'package:mdigits/src/notifications/data/notifications_permission_repository_service.dart';
import 'package:mdigits/src/study_progress/study_progress_service.dart';
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

  final StudyProgressService studyProgressService = StudyProgressService.init();
  studyProgressService.saveFirstAppLaunch(participantId: participant.id);
  Get.put(participant, permanent: true);
  Get.put(DigitSpanTaskConfig(), permanent: true);
  final NotificationsManagerService notificationsManagerService =
      NotificationsManagerService.init(participantId: participant.id);
  final StudyProgressStep? consentStep = await studyProgressService.get(
    participantId: participant.id,
    stepId: 'consentStep',
  );
  if (consentStep?.status == Status.completed) {
    await notificationsManagerService.initNotifications();
    final String? token = await notificationsManagerService.getToken();
    if (token != null) {
      final ema_participant.Participant emaParticipant =
          ema_participant.Participant(
        id: participant.id,
        notificationTokens: [token],
      );

      participantService.save(participant: emaParticipant);
    }
  }

  /// Update notifications permission to db if it has changed
  final NotificationsPermissionRepositoryService
      notificationsPermissionRepositoryService =
      NotificationsPermissionRepositoryService.init(
          participantId: participant.id);

  final bool areAccepted =
      await notificationsManagerService.areNotificationsEnabled();
  notificationsPermissionRepositoryService.updateIfNecessary(
      areAccepted: areAccepted);

  /// Start app
  final NavigatorService navigatorService = Get.put(NavigatorService());
  final String initialRoute = await navigatorService.determineNextScreen();
  runApp(MyApp(initialRoute: initialRoute));
}
