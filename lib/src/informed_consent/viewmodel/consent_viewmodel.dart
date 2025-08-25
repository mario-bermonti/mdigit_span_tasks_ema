import 'package:get/get.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigits/src/core/ema_db/progress/models/status.dart';
import 'package:mdigits/src/core/navigator_service/navigator_service.dart';
import 'package:mdigits/src/core/setup/app_setup_service.dart';
import 'package:mdigits/src/study_progress/study_progress_service.dart';
import 'package:research_package/research_package.dart';

import '../model/consent_steps.dart';

class ConsentViewModel extends GetxController {
  final Participant _participant = Get.find<Participant>();
  late final DateTime _completionTime;
  final AppSetupService _appSetupService = AppSetupService();

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
    /// TODO don't use as field
    _completionTime = DateTime.now();
    await saveProgress();
    _appSetupService.initOnConsent(completionDate: _completionTime);
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
