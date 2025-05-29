import 'package:get/get.dart';
import 'package:mdigits/src/auth/participant.dart';
import 'package:mdigits/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigits/src/core/ema_db/progress/models/status.dart';
import 'package:mdigits/src/demographics/close_demographics_screen.dart';
import 'package:mdigits/src/demographics/process_demographics_data.dart';
import 'package:mdigits/src/study_progress/study_progress_service.dart';
import 'package:research_package/research_package.dart';

/// Processes the survey data for exporting, marks the demographics survey as
/// completed, and moves to the next screen.
Future<void> endDemographicsSurvey(RPTaskResult results) async {
  processDemographicsData(results);

  final Participant participant = Get.find();
  final StudyProgressStep progressStep = StudyProgressStep(
    participantId: participant.id,
    stepId: 'demographicsStep',
    completionDateTime: DateTime.now(),
    stepDescription: "Demographics survey",
    lastUpdatedDateTime: DateTime.now(),
    status: Status.completed,
  );

  final StudyProgressService studyProgressService = StudyProgressService.init();
  await studyProgressService.save(progressStep: progressStep);

  await closeDemographicsScreen();
}
