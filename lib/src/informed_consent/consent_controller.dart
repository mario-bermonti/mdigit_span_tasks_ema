import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdigit_span_tasks_ema/src/notifications/notifications_manager.dart';
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
  }

  void nextScreen() {
    Get.offAndToNamed('/');
  }
}
