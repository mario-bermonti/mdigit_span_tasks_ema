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
  return SurveyItemData(
    startTime: DateTime.parse('2024-07-04T16:21:59.151739'),
    endTime: DateTime.parse('2024-07-04T16:21:59.880927'),
    identifier: 'color',
    description: 'What color do you prefer?',
    type: 'singleChoice',
    response: 'Black',
    choices: ["Black", "White"],
  );
}
