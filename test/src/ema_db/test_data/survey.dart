import 'package:mdigits/src/core/ema_db/study_task/models/survey/survey_item.dart';

final SurveyItem testSurveyItem = SurveyItem(
  participantID: "101",
  sessionID: "001",
  startTime: DateTime.now(),
  endTime: DateTime.now(),
  identifier: 'item 1 identifier',
  description: "item 1 description",
  type: "SingleChoice",
  response: "item 1 response",
);

final Map<String, dynamic> testSurveyItem1Json = testSurveyItem.toJson();

final SurveyItem testSurveyItem2 = SurveyItem(
  participantID: "102",
  sessionID: "001",
  startTime: DateTime.now(),
  endTime: DateTime.now(),
  identifier: 'item 2 identifier',
  description: "item 2 description",
  type: "SingleChoice",
  response: "item 2 response",
);

final List<SurveyItem> testSurveyItems = [testSurveyItem, testSurveyItem2];

const String testNamedPath = "participants/doc1";
