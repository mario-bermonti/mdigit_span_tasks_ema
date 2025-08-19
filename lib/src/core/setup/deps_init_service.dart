import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mdigits/firebase_options.dart';
import 'package:mdigits/src/auth/auth.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/ema_db/participant/models/participant.dart'
    as ema_participant;
import 'package:mdigits/src/core/ema_db/progress/models/status.dart';
import 'package:mdigits/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigits/src/core/participant/participant_service.dart';
import 'package:mdigits/src/core/physical_activity/pedometer/pedometer_service.dart';
import 'package:mdigits/src/digit_span_tasks/config/config.dart';
import 'package:mdigits/src/notifications/data/notifications_manager_service.dart';
import 'package:mdigits/src/notifications/data/notifications_permission_repository_service.dart';
import 'package:mdigits/src/study_progress/study_progress_service.dart';

class DependencyInitService {
  late final Participant _participant;
  final StudyProgressService _studyProgressService =
      StudyProgressService.init();
  final ParticipantService _participantService = ParticipantService.init();
  late final NotificationsManagerService _notificationsManagerService;

  Future<void> initAllServices() async {
    await initNotifications();
    await initPedometerService();
  }

  void initApp() {
    /// init app
    WidgetsFlutterBinding.ensureInitialized();
  }

  Future<void> initDB() async {
    /// init db
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  Future<void> initAuth() async {
    /// init auth
    _participant = await Auth(auth: FirebaseAuth.instance).signIn();
    if (_participant.id.isNotEmpty) {
      final ema_participant.Participant emaParticipant =
          ema_participant.Participant(
        id: _participant.id,
      );
      _participantService.save(participant: emaParticipant);
    }
  }

  void initGlobalServices() {
    /// init global services
    Get.put(_participant, permanent: true);
    Get.put(DigitSpanTaskConfig(), permanent: true);
  }

  Future<void> initNotifications() async {
    _notificationsManagerService =
        NotificationsManagerService.init(participantId: _participant.id);
    await _notificationsManagerService.initNotifications();
  }

  Future<void> initNotificationsIfConsented() async {
    /// init general notifications service, init notifications, save new token
    final NotificationsManagerService notificationsManagerService =
        NotificationsManagerService.init(participantId: _participant.id);

    final StudyProgressStep? consentStep = await _studyProgressService.get(
      participantId: _participant.id,
      stepId: 'consentStep',
    );
    if (consentStep?.status == Status.completed) {
      await notificationsManagerService.initNotifications();
      final String? token = await notificationsManagerService.getToken();
      if (token != null) {
        final ema_participant.Participant emaParticipant =
            ema_participant.Participant(
          id: _participant.id,
          notificationTokens: [token],
        );

        _participantService.save(participant: emaParticipant);
      }
    }
  }

  Future<void> initPedometerService() async {
    await Get.putAsync<PedometerService>(() async {
      final PedometerService pedometerService =
          await PedometerService.init(participantId: _participant.id);
      return pedometerService;
    }, permanent: true);
  }

  Future<void> updateNotificationsPermissions() async {
    /// init
    /// update notifications permission

    /// Update notifications permission to db if it has changed
    final NotificationsPermissionRepositoryService
        notificationsPermissionRepositoryService =
        NotificationsPermissionRepositoryService.init(
            participantId: _participant.id);

    final bool areAccepted =
        await _notificationsManagerService.areNotificationsEnabled();
    notificationsPermissionRepositoryService.updateIfNecessary(
        areAccepted: areAccepted);
  }
}
