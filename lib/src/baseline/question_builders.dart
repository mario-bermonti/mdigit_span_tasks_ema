import 'package:research_package/research_package.dart';

/// Build a [reserach_package] single choice question from a json object.
/// Build a [research_package] single choice question from a json object.
/// The question build is of type [RPChoiceAnswerStyle.SingleChoice] from the
/// research package.
RPQuestionStep buildSingleChoiceQuestion({
  required Map<String, dynamic> config,
}) {
  final List<RPChoice> choices = buildChoices(choices: config['choices']);
  final RPChoiceAnswerFormat answerFormat = RPChoiceAnswerFormat(
    answerStyle: RPChoiceAnswerStyle.SingleChoice,
    choices: choices,
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
