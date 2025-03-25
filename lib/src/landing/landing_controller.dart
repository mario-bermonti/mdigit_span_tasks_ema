import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/notifications_service.dart';
import 'package:mdigit_span_tasks_ema/src/study_progress/study_progress_service.dart';

import '../auth/participant.dart';

class LandingController extends GetxController {
  String nextScreen = '';
  GetStorage storage = GetStorage();
  final StudyProgressService studyProgressService = StudyProgressService.init();
  final Participant participant = Get.find();
  RxBool isLoading = false.obs;

  Future<void> determineNextScreen() async {
    isLoading.value = true;
    final NotificationService notificationService =
        NotificationService.init(participantId: participant.id);

    final StudyProgressStep? consentStep = await studyProgressService.get(
      participantId: participant.id,
      stepId: 'consentStep',
    );
    final bool consentCompleted = consentStep?.status == Status.completed;
    final StudyProgressStep? demographicsSurveyStep =
        await studyProgressService.get(
      participantId: participant.id,
      stepId: 'demographicsStep',
    );
    final bool demographicsSurveyCompleted =
        demographicsSurveyStep?.status == Status.completed;
    final StudyProgressStep? notificationsStep = await studyProgressService.get(
      participantId: participant.id,
      stepId: 'remoteNotificationStep',
    );

    if (!consentCompleted) {
      nextScreen = 'consent';
    } else if (notificationsStep?.status != Status.completed) {
      nextScreen = 'notificationsPermission';
    } else if (notificationService.notificationWhileOnTerminated != null) {
      nextScreen = 'emaScreen';
    } else if (!demographicsSurveyCompleted) {
      nextScreen = 'demographicsSurvey';
    } else {
      nextScreen = 'tasklist';
    }
    isLoading.value = false;
  }
}
