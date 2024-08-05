import 'package:flutter/material.dart';
import 'package:research_package/model.dart';

/// models
class SurveyData {
  fromJson() {}
  toJson() {}
}

class SurveyItemData {
  fromJson() {}
  toJson() {}
}

/// service

/// high level function used by package
SurveyData buildSurveyData(RPTaskResult rpTaskResult) {
  /// format survey metadata
  /// format survey items data - fun
  /// Build SurveyData object
}

// Converter object
/// helper functions

Map<String, dynamic> formatSurveyMetadata(RPTaskResult rpTaskResult) {
  /// extract data and convert it into map
}
List<Map<String, dynamic>> formatSurveyItemsData(Map<String, RPResult> items) {
  /// define formatted list to store formatted items
  /// results map: key = id, value = data
  /// iterates over results and passes value to item formatting fun
  return [{}];
}

Map<String, dynamic> formatSurveyItemData(Map<String, dynamic> item) {
  /// extract metadata into formatted json object
  /// format choices
  /// format answer
}

Map<String, dynamic> rpResultsToJson(RPResult item) {
  /// extract data and make it available
  // debugging
  // print('single item');
  // print(jsonDecode(jsonEncode(results.results.values.first.toJson())));
}

Map<String, dynamic> extractItemMetadata(Map<String, dynamic> item) {
  /// extract item metadata
}

/// formatSurveyItemData helper
dynamic formatAnswer(dynamic answer, ItemType itemType) {
  /// if string, return it
  /// if list, format it
}

/// formatAnswer helper
String formatSingleChoiceAnswer(List<Map<String, dynamic>> answer) {
  /// extract label from answer
}

List<String>? formatChoices(dynamic choices) {
  /// if null, return null?
  /// if list, extract labels from subitems
}

List<String> extractLabelsSubitems(List<Map<String, dynamic>> subitems) {
  /// iterate over subitems and extract label
}
