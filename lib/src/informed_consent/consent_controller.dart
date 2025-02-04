import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/auth/participant.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/participant/models/participant.dart'
    as ema_participant;
import 'package:mdigit_span_tasks_ema/src/notifications/notifications_manager.dart';
import 'package:mdigit_span_tasks_ema/src/participant/participant_service.dart';
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

    final NotificationsManager notificationsManager =
        Get.put(NotificationsManager());
    await notificationsManager.setupNotifications();
    await notificationsManager.initNotifications();

    final String? token = await notificationsManager.getToken();
    if (token == null) return;

    final Participant participant = Get.find<Participant>();
    final ema_participant.Participant emaParticipant =
        ema_participant.Participant(
      id: participant.id,
      notificationTokens: [token],
    );
    final ParticipantService participantService = ParticipantService.init();
    participantService.save(participant: emaParticipant);
  }

  void nextScreen() {
    Get.offAndToNamed('/');
  }
}
