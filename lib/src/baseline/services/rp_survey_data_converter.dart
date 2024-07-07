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

List<SurveyItemData> buildSurveyItemData({
  required Map<String, dynamic> jsonItem,
}) {}
