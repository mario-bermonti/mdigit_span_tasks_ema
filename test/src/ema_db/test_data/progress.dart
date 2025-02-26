import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/study_progress_step.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';

final testProgressStep = StudyProgressStep(
  participantId: '101',
  stepId: 'testStep',
  completionDateTime: DateTime.now(),
  stepDescription: 'testDescription',
  startDateTime: DateTime.now(),
  lastUpdatedDateTime: DateTime.now(),
  status: Status.completed,
);

Map<String, dynamic> testProgressStepJson = testProgressStep.toJson();

final testProgressStepIncomplete = StudyProgressStep(
  participantId: '101',
  stepId: 'testStep',
  completionDateTime: DateTime.now(),
  status: Status.completed,
  lastUpdatedDateTime: DateTime.now(),
);

final String testPathRemoteDB =
    'progress/${testProgressStep.participantId}/steps/${testProgressStep.stepId}';
const String testPathLocalDB = 'progress';
