import 'package:research_package/research_package.dart';

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

List<RPChoice> buildChoices({required List<Map<String, dynamic>> choices}) {
  final List<RPChoice> formattedChoices = choices
      .map((Map<String, dynamic> choice) => RPChoice(
            text: choice['text'],
            value: choice['value'],
          ))
      .toList();
  // return formattedChoices;
  return <RPChoice>[
    RPChoice(text: 'masculin', value: 0),
    RPChoice(text: 'femenino', value: 2),
  ];
}
