import 'dart:convert';

import 'package:research_package/model.dart';
import 'package:research_package/research_package.dart';

/// Converts an [RPTaskResult] from the [research_package] object into a
/// [SurveyData] object by extracting the relevant data and formatting it
/// appropriately.
class RPToSurveyDataConverter {
  /// Format the data of all survey items.
  List<Map<String, dynamic>> formatSurveyItemsData(
      Map<String, RPResult> items) {
    /// define formatted list to store formatted items
    final List<Map<String, dynamic>> formattedItems = <Map<String, dynamic>>[];

    /// results map: key = id, value = data
    /// iterates over results and passes value to item formatting fun
    for (RPResult item in items.values) {
      final Map<String, dynamic> jsonItem = rpStepResultToJson(item);
      final Map<String, dynamic> formattedItem = formatSurveyItemData(jsonItem);
    }
    return [{}];
  }

  /// Converts an [RPStepResult] from the [research_package] to a json object.
  /// This makes available all the data inside the [RPStepResult] and makes
  /// it easier to handle.
  Map<String, dynamic> rpStepResultToJson(RPResult item) {
    final String stringItem = jsonEncode(item.toJson());
    final Map<String, dynamic> jsonItem = jsonDecode(stringItem);
    return jsonItem;
  }

  /// Format all the data from a single json RPQuestionStep
  Map<String, dynamic> formatSurveyItemData(Map<String, dynamic> item) {
    final Map<String, dynamic> formattedItem = {};

    final Map<String, dynamic> metadata = extractItemMetadata(item);
    formattedItem.addAll(metadata);

    if (item["answer_format"].containsKey("choices")) {
      final List<String> choices =
          formatChoices(item["answer_format"]["choices"]);
      formattedItem["choices"] = choices;
    }

    final dynamic formattedAnswer = formatAnswer(
      answer: item["results"]["answer"],
      questionType: metadata['type'],
    );
    formattedItem["answer"] = formattedAnswer;
    return formattedItem;
  }

  /// Extract the metadata for a single RPQuestionStep (e.g., start time)
  Map<String, dynamic> extractItemMetadata(Map<String, dynamic> item) {
    final Map<String, dynamic> metadata = {};

    metadata['startTime'] = item['start_date'];
    metadata['endTime'] = item['end_date'];
    metadata['identifier'] = item['identifier'];
    metadata['description'] = item['question_title'];
    metadata['type'] = item['answer_format']['question_type'];

    return metadata;
  }

  /// Format json [RPChoice]s so they can be used by [SurveyData].
  List<String> formatChoices(List<Map<String, dynamic>> choices) {
    List<String> formattedChoices = extractLabelChoices(choices);
    return formattedChoices;
  }

  /// Format the answer to a json formatted [RPQuestion].
  /// Currently supports Date and SingleChoice questions.
  dynamic formatAnswer({
    required dynamic answer,
    required String questionType,
  }) {
    if (questionType == 'Date') {
      return answer as String;
    } else if (questionType == 'SingleChoice') {
      final String formattedAnswer = extractSingleChoiceAnswer(answer);
      return formattedAnswer;
    } else {
      throw UnimplementedError(
          'Support for $questionType has not been implemented');
    }
  }

  /// Format the answer to a single choice question
  String extractSingleChoiceAnswer(List<Map<String, dynamic>> answer) {
    final String stringAnswer = answer.first['text'];
    return stringAnswer;
  }

  /// Get the label (text field) from [RPChoice]s that are formatted as json.
  List<String> extractLabelChoices(List<Map<String, dynamic>> choices) {
    final List<String> labels = choices
        .map((Map<String, dynamic> choice) => choice['text'] as String)
        .toList();
    return labels;
  }
}
