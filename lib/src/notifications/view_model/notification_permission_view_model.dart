import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/notifications_service.dart';
import 'package:mdigit_span_tasks_ema/src/study_progress/study_progress_service.dart';

class NotificationPermissionViewModel extends GetxController {
  final String _participantId;

  NotificationPermissionViewModel({required String participantId})
      : _participantId = participantId;

  void onDeclined() {
    Get.toNamed("landing_page");
  }

  Future<void> onAccepted() async {
    await AppSettings.openAppSettings(type: AppSettingsType.notification);
    final StudyProgressService studyProgressService =
        StudyProgressService.init();
    final DateTime completionTime = DateTime.now();

    final NotificationService notificationService =
        NotificationService.init(participantId: _participantId);
    await notificationService.setupNotifications();
    await notificationService.initNotifications();

    if (notificationService.localNotificationsEnabled) {
      final StudyProgressStep localNotificationStep = StudyProgressStep(
        participantId: _participantId,
        stepId: "localNotificationStep",
        completionDateTime: completionTime,
        stepDescription:
            "Local notifications enabled. Necessary for background notifications on Android. Only relevant on Android.",
        lastUpdatedDateTime: completionTime,
        status: Status.completed,
      );
      await studyProgressService.save(progressStep: localNotificationStep);
    }

    if (notificationService.remoteNotificationsEnabled) {
      final StudyProgressStep remoteNotificationStep = StudyProgressStep(
        participantId: _participantId,
        stepId: "remoteNotificationStep",
        completionDateTime: completionTime,
        stepDescription: "Remote notifications enabled",
        lastUpdatedDateTime: completionTime,
        status: Status.completed,
      );
      await studyProgressService.save(progressStep: remoteNotificationStep);
    }
    Get.toNamed("landing_page");
  }
}
