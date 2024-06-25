import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:research_package/research_package.dart';

/// Build a [research_package] single choice question from a json file.
Future<RPQuestionStep> buildSingleChoiceQuestionFromJson(String path) async {
  final Map<String, dynamic> questionJson =
      await readSurveyQuestionFromJson(path);
  final RPQuestionStep questionFormatted =
      buildSingleChoiceQuestion(config: questionJson);
  return questionFormatted;
}

/// Reads a survey question from a json file in the specified [filename].
Future<Map<String, dynamic>> readSurveyQuestionFromJson(String filename) async {
  final String questionString = await rootBundle.loadString(filename);
  final Map<String, dynamic> questionJson = jsonDecode(questionString);
  return questionJson;
}

/// Build a [research_package] single choice question from a json object.
/// The question build is of type [RPChoiceAnswerStyle.SingleChoice] from the
/// research package.
RPQuestionStep buildSingleChoiceQuestion({
  required Map<String, dynamic> config,
}) {
  final List<Map<String, dynamic>> choicesJson =
      List<Map<String, dynamic>>.from(config['choices']);
  final List<RPChoice> choicesRP = buildChoices(choices: choicesJson);
  final RPChoiceAnswerFormat answerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.SingleChoice,
    choices: choicesRP,
  );
  final RPQuestionStep question = RPQuestionStep(
    identifier: config['identifier'],
    title: config['title'],
    answerFormat: answerFormat,
  );
  return question;
}

/// Build [RPChoice] objects from a json object.
List<RPChoice> buildChoices({required List<Map<String, dynamic>> choices}) {
  final List<RPChoice> formattedChoices = choices
      .map((Map<String, dynamic> choice) => _buildRPChoice(choice))
      .toList();
  return formattedChoices;
}

RPChoice _buildRPChoice(Map<String, dynamic> choice) {
  return RPChoice(
    text: choice['text'],
    value: choice['value'],
  );
}
