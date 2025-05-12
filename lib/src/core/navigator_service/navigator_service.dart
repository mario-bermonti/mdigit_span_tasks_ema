import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/data/notifications_manager_service.dart';
import 'package:mdigit_span_tasks_ema/src/study_progress/study_progress_service.dart';

import '../../auth/participant.dart';

class NavigatorService extends GetxService {
  bool notificationsPermissionAsked = false;
  bool demographicsSurveyAsked = false;
  final StudyProgressService studyProgressService = StudyProgressService.init();
  final Participant participant = Get.find();

  Future<String> determineNextScreen() async {
    final NotificationsManagerService notificationsManagerService =
        NotificationsManagerService.init(participantId: participant.id);

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

    if (!consentCompleted) {
      return 'consent';
    } else if (await notificationsManagerService.areNotificationsEnabled() ==
            false &&
        notificationsPermissionAsked == false) {
      notificationsPermissionAsked = true;
      return 'notificationsPermission';
    } else if (notificationsManagerService.notificationWhileOnTerminated !=
        null) {
      return 'emaScreen';
    } else if (!demographicsSurveyCompleted &&
        demographicsSurveyAsked == false) {
      demographicsSurveyAsked = true;
      return 'demographicsSurvey';
    } else {
      return 'tasklist';
    }
  }
}
