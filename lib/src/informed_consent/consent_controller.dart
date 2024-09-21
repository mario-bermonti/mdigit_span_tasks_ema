import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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

  Future<void> completeConsent() async {
    await GetStorage().write('consentCompleted', true);
  }

  void nextScreen() {
    Get.toNamed('/');
  }
}
