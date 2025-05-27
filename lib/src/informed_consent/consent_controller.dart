import 'package:get/get.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/ema_db/participant/models/participant.dart'
    as ema_participant;
import 'package:mdigits/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigits/src/core/ema_db/progress/models/status.dart';
import 'package:mdigits/src/core/navigator_service/navigator_service.dart';
import 'package:mdigits/src/core/participant/app_service.dart';
import 'package:mdigits/src/core/participant/location_services.dart';
import 'package:mdigits/src/core/participant/participant_service.dart';
import 'package:mdigits/src/core/sensing/step_counter/step_counter_service.dart';
import 'package:mdigits/src/device/device_service.dart';
import 'package:mdigits/src/notifications/data/notifications_manager_service.dart';
import 'package:mdigits/src/notifications/data/notifications_permission_repository_service.dart';
import 'package:mdigits/src/study_progress/study_progress_service.dart';
import 'package:research_package/research_package.dart';

import 'consent_steps.dart';

class ConsentController extends GetxController {
  final RPOrderedTask consentTask = RPOrderedTask(
    identifier: "consentTaskID",
    steps: [
      instructionStep,
      consentVisualStep,
      consentReviewStep,
      completionStep,
    ],
    closeAfterFinished: false,
  );

  /// Marks consent as completed and initializes notifications.
  /// This ensures that consent is not presented again and that notifications
  /// are only enabled after participants has consented to being part of the
  /// study.
  Future<void> completeConsent() async {
    final StudyProgressService studyProgressService =
        StudyProgressService.init();

    final Participant participant = Get.find<Participant>();
    final DateTime completionTime = DateTime.now();
    final StudyProgressStep consentStep = StudyProgressStep(
      participantId: participant.id,
      stepId: "consentStep",
      completionDateTime: completionTime,
      stepDescription: "Consent form to participante in the study",
      lastUpdatedDateTime: completionTime,
      status: Status.completed,
    );

    await studyProgressService.save(
      progressStep: consentStep,
    );

    /// Setup/init notifications
    final NotificationsManagerService notificationsManagerService =
        NotificationsManagerService.init(participantId: participant.id);
    await notificationsManagerService.setupNotifications();
    await notificationsManagerService.initNotifications();

    final StudyProgressStep notificationStep = StudyProgressStep(
      participantId: participant.id,
      stepId: "notificationStep",
      completionDateTime: completionTime,
      stepDescription:
          "Step where participants indicate whether they accept to receive notifications.",
      lastUpdatedDateTime: completionTime,
      status: Status.completed,
    );
    await studyProgressService.save(progressStep: notificationStep);

    /// Save notifications permissions.
    final NotificationsPermissionRepositoryService
        notificationsPermissionService =
        NotificationsPermissionRepositoryService.init(
            participantId: participant.id);
    await notificationsPermissionService.save(
        areAccepted:
            await notificationsManagerService.areNotificationsEnabled());

    /// Collect localization info about participant.
    final LocationService locationService = LocationService();
    final AppService appService = await AppService.init();
    ema_participant.Participant emaParticipant = ema_participant.Participant(
      id: participant.id,
      locale: locationService.locale,
      timezone: locationService.timezone,
      appVersion: appService.appVersion,
      appBuildNumber: appService.appBuildNumber,
    );

    /// Collect remote notification tokens.
    final String? token = await notificationsManagerService.getToken();
    if (token != null) {
      emaParticipant = emaParticipant.copyWith(
        notificationTokens: [token],
      );
    }

    final ParticipantService participantService = ParticipantService.init();
    participantService.save(participant: emaParticipant);

    /// Collect device metadata.
    final DeviceService deviceService =
        DeviceService.init(participantId: participant.id);
    deviceService.saveData();

    /// Step counter service
    await Get.putAsync<StepCounterService>(() async {
      final StepCounterService stepCounter = await StepCounterService.init();
      return stepCounter;
    }, permanent: true);
  }

  Future<void> nextScreen() async {
    final NavigatorService navigatorService = Get.find();
    final String nextScreen = await navigatorService.determineNextScreen();
    Get.offAndToNamed(nextScreen);
  }
}
