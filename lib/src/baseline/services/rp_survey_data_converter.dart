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
  final SurveyItemData item = SurveyItemData(
    startTime: DateTime.parse(jsonItem['start_date']),
    endTime: DateTime.parse(jsonItem['end_date']),
    identifier: jsonItem['identifier'],
    description: jsonItem['question_title'],
    type: jsonItem['answer_format']['answer_style'],
    response: jsonItem['results']['answer'].first['text'],
    choices: getChoicesText(jsonChoices: jsonItem['answer_format']['choices']),
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
