import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/progress_step.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/notifications_manager.dart';
import 'package:mdigit_span_tasks_ema/src/study_progress/study_progress_service.dart';

import '../auth/participant.dart';

class LandingController extends GetxController {
  String nextScreen = '';
  GetStorage storage = GetStorage();
  final StudyProgressService studyProgressService = StudyProgressService.init();
  final NotificationsManager _notificationsManager = Get.find();
  final Participant participant = Get.find();
  RxBool isLoading = false.obs;

  Future<void> determineNextScreen() async {
    isLoading.value = true;
    final ProgressStep? consentStep = await studyProgressService.get(
      participantId: participant.id,
      stepId: 'consentStep',
    );
    final bool consentCompleted = consentStep?.status == Status.completed;
    final ProgressStep? demographicsSurveyStep = await studyProgressService.get(
      participantId: participant.id,
      stepId: 'demographicsStep',
    );
    final bool demographicsSurveyCompleted =
        demographicsSurveyStep?.status == Status.completed;

    if (!consentCompleted) {
      nextScreen = 'consent';
    } else if (_notificationsManager.notificationWhileOnTerminated != null) {
      nextScreen = 'emaScreen';
    } else if (!demographicsSurveyCompleted) {
      nextScreen = 'demographicsSurvey';
    } else {
      nextScreen = 'tasklist';
    }
    isLoading.value = false;
  }
}
