import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:research_package/research_package.dart';

class BaselineSurveyController extends GetxController {
  final String basePath = 'assets/baseline_questions';
  final List<String> questionFilenames = <String>[
    'sex.json',
    'gender.json',
    'marital_status.json',
    'educational_level.json',
    'income.json',
  ];
  final List<RPQuestionStep> questions = <RPQuestionStep>[].obs;
  RxBool isLoading = true.obs;
  RxBool hasError = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    loadSurveyQuestions();
  }

  /// Load all survey questions from json files and convert them RP question
  /// objects.
  Future<void> loadSurveyQuestions() async {
    isLoading(true);
    for (String questionFilename in questionFilenames) {
      RPQuestionStep question = await buildSingleChoiceQuestionFromJson(
          '$basePath/$questionFilename');
      questions.add(question);
    }
    isLoading(false);
  }

  /// Build a [research_package] single choice question from a json file.
  Future<RPQuestionStep> buildSingleChoiceQuestionFromJson(String path) async {
    final Map<String, dynamic> questionJson =
        await readSurveyQuestionFromJson(path);
    final RPQuestionStep questionFormatted =
        buildSingleChoiceQuestion(config: questionJson);
    return questionFormatted;
  }

  /// Reads a survey question from a json file in the specified [path].
  Future<Map<String, dynamic>> readSurveyQuestionFromJson(String path) async {
    final String questionString = await rootBundle.loadString(path);
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
}
