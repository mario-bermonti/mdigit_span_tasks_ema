import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/auth/participant.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/models/participant.dart'
    as ema_participant;
import 'package:mdigit_span_tasks_ema/src/core/participant/app_service.dart';
import 'package:mdigit_span_tasks_ema/src/core/participant/location_services.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/notifications_manager.dart';
import 'package:mdigit_span_tasks_ema/src/core/participant/participant_service.dart';
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
    await GetStorage().write('consentCompleted', true);

    /// Setup/init notifications
    final NotificationsManager notificationsManager =
        Get.put(NotificationsManager());
    await notificationsManager.setupNotifications();
    await notificationsManager.initNotifications();

    /// Collect localization info about participant.
    final Participant participant = Get.find<Participant>();
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
    final String? token = await notificationsManager.getToken();
    if (token != null) {
      emaParticipant = emaParticipant.copyWith(
        notificationTokens: [token],
      );
    }

    final ParticipantService participantService = ParticipantService.init();
    participantService.save(participant: emaParticipant);
  }

  void nextScreen() {
    Get.offAndToNamed('/');
  }
}
