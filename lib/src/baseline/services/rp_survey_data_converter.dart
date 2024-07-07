import 'dart:convert';

import 'package:research_package/model.dart';

import '../data/survey_item_data.dart';

/// Convert a [research_package]'s [RPTaskResult] to a json object.
Map<String, dynamic> rpSurveyDataToJson(RPTaskResult results) {
  /// convert to string first to get the nested objects.
  final String stringResults = jsonEncode(results.toJson());
  final Map<String, dynamic> jsonResults = jsonDecode(stringResults);
  return jsonResults;
}

SurveyItemData buildSurveyItemData({
  required Map<String, dynamic> jsonItem,
}) {
  final String startTime = jsonItem['start_date'];
  final String endTime = jsonItem['end_date'];
  final Map<String, dynamic> answerFormat = jsonItem['answer_format'];
  final String answer = jsonItem['results']['answer'].first['text'];
  final SurveyItemData item = SurveyItemData(
    startTime: DateTime.parse(startTime),
    endTime: DateTime.parse(endTime),
    identifier: jsonItem['identifier'],
    description: jsonItem['question_title'],
    type: answerFormat['answer_style'],
    response: answer,
    choices: getChoicesText(jsonChoices: answerFormat['choices']),
  );
  return item;
}

/// Get the text field from [RPChoice]s that are formatted as json.
List<String> getChoicesText({required List<Map<String, dynamic>> jsonChoices}) {
  final List<String> choices = jsonChoices
      .map((Map<String, dynamic> choice) => choice['text'] as String)
      .toList();
  return choices;
}
