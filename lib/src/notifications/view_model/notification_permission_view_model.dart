import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/data/notifications_permission_service.dart';
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

    final StudyProgressStep notificationStep = StudyProgressStep(
      participantId: _participantId,
      stepId: "notificationStep",
      stepDescription:
          "Step where participants indicate whether they accept to receive notifications.",
      lastUpdatedDateTime: completionTime,
      status: Status.completed,
    );
    await studyProgressService.save(progressStep: notificationStep);

    final NotificationsPermissionService notificationsPermissionService =
        NotificationsPermissionService.init(participantId: _participantId);
    await notificationsPermissionService.save();

    Get.toNamed("landing_page");
  }
}
