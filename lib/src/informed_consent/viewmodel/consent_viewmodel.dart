import 'package:get/get.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigits/src/core/ema_db/progress/models/status.dart';
import 'package:mdigits/src/core/navigator_service/navigator_service.dart';
import 'package:mdigits/src/core/setup/deps_init_service.dart';
import 'package:mdigits/src/core/setup/post_consent_setup_service.dart';
import 'package:mdigits/src/study_progress/study_progress_service.dart';
import 'package:research_package/research_package.dart';

import '../model/consent_steps.dart';

class ConsentViewModel extends GetxController {
  final Participant _participant = Get.find<Participant>();
  late final DateTime _completionTime;

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
    _completionTime = DateTime.now();
    await saveProgress();
    await PostConsentSetupService(completionTime: _completionTime)
        .runAllSetup();
    await DependencyInitService().initAllServices();
  }

  Future<void> saveProgress() async {
    final StudyProgressService studyProgressService =
        StudyProgressService.init();
    final StudyProgressStep consentStep = StudyProgressStep(
      participantId: _participant.id,
      stepId: "consentStep",
      completionDateTime: _completionTime,
      stepDescription: "Consent form to participante in the study",
      lastUpdatedDateTime: _completionTime,
      status: Status.completed,
    );

    await studyProgressService.save(
      progressStep: consentStep,
    );
  }

  Future<void> nextScreen() async {
    final NavigatorService navigatorService = Get.find();
    final String nextScreen = await navigatorService.determineNextScreen();
    Get.offAndToNamed(nextScreen);
  }
}
