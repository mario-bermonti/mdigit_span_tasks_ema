import 'package:mdigit_span_tasks_ema/src/core/ema_db/study_task/models/survey/survey_item.dart';

final SurveyItem expectedSurveyItem = SurveyItem(
  participantID: "101",
  sessionID: "001",
  startTime: DateTime.now(),
  endTime: DateTime.now(),
  identifier: 'item 1 identifier',
  description: "item 1 description",
  type: "SingleChoice",
  response: "item 1 response",
);

final Map<String, dynamic> expectedSurveyItem1Json =
    expectedSurveyItem.toJson();

final SurveyItem expectedSurveyItem2 = SurveyItem(
  participantID: "102",
  sessionID: "001",
  startTime: DateTime.now(),
  endTime: DateTime.now(),
  identifier: 'item 2 identifier',
  description: "item 2 description",
  type: "SingleChoice",
  response: "item 2 response",
);

final List<SurveyItem> expectedSurveyItems = [
  expectedSurveyItem,
  expectedSurveyItem2
];

const String testNamedPath = "participants/doc1";
