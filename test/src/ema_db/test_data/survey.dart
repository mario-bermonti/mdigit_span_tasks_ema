import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/survey/survey_item.dart';

final SurveyItem expectedSurveyItem = SurveyItem(
  participantID: "101",
  sessionID: "001",
  startTime: DateTime.now(),
  endTime: DateTime.now(),
  identifier: 'identifier A',
  description: "description A",
  type: "SingleChoice",
  response: "response A",
);

final SurveyItem expectedSurveyItem2 = SurveyItem(
  participantID: "102",
  sessionID: "001",
  startTime: DateTime.now(),
  endTime: DateTime.now(),
  identifier: 'identifier B',
  description: "description B",
  type: "SingleChoice",
  response: "response B",
);

final List<SurveyItem> expectedSurveyItems = [
  expectedSurveyItem,
  expectedSurveyItem2
];
