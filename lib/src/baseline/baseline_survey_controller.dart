import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:research_package/research_package.dart';

class BaselineSurveyController extends GetxController {
  final String basePath = 'assets/baseline_questions';
  final List<String> questionFilenames = <String>[];
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
}
