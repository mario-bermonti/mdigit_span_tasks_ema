import 'package:app_settings/app_settings.dart';
import 'package:get/get.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigit_span_tasks_ema/src/core/navigator_service/navigator_service.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/data/notifications_manager_service.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/data/notifications_permission_repository_service.dart';
import 'package:mdigit_span_tasks_ema/src/study_progress/study_progress_service.dart';

class NotificationPermissionViewModel extends GetxController {
  final String _participantId;

  NotificationPermissionViewModel({required String participantId})
      : _participantId = participantId;

  Future<void> onDeclined() async {
    final NavigatorService navigatorService = Get.find();
    final String nextScreen = await navigatorService.determineNextScreen();
    Get.offAndToNamed(nextScreen);
  }

  Future<void> onAccepted() async {
    await AppSettings.openAppSettings(type: AppSettingsType.notification);
    final StudyProgressService studyProgressService =
        StudyProgressService.init();
    final DateTime completionTime = DateTime.now();

    final NotificationsManagerService notificationsManagerService =
        NotificationsManagerService.init(participantId: _participantId);
    await notificationsManagerService.setupNotifications();
    await notificationsManagerService.initNotifications();

    final StudyProgressStep notificationStep = StudyProgressStep(
      participantId: _participantId,
      stepId: "notificationStep",
      stepDescription:
          "Step where participants indicate whether they accept to receive notifications.",
      lastUpdatedDateTime: completionTime,
      status: Status.completed,
    );
    await studyProgressService.save(progressStep: notificationStep);

    final NotificationsPermissionRepositoryService
        notificationsPermissionService =
        NotificationsPermissionRepositoryService.init(
            participantId: _participantId);
    await notificationsPermissionService.save(
        areAccepted:
            await notificationsManagerService.areNotificationsEnabled());

    final NavigatorService navigatorService = Get.find();
    final String nextScreen = await navigatorService.determineNextScreen();
    Get.offAndToNamed(nextScreen);
  }
}
