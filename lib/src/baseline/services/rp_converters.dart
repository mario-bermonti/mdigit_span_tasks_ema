import 'package:research_package/model.dart';

/// Format the answer to an [RPQuestion].
/// Currently supports Date and SingleChoice questions.
String getAnswer({
  required Iterable<dynamic> rpAnswer,
  required String itemType,
}) {
  if (itemType == 'Date') {
    return rpAnswer.first;
  } else if (itemType == 'SingleChoice') {
    return rpAnswer.first.text as String;
  } else {
    throw UnimplementedError('Support for $itemType has not been implemented');
  }
}

/// Extracts the labels of choices from the survey items, if applicable.
/// The item's [RPAnswerFormat] is used to determine if this is applicable for
/// the survey item type.
List<String>? getChoices(RPAnswerFormat answerFormat) {
  final String questionType = answerFormat.questionType.name;
  if (questionType == 'Date') {
    return null;
  } else {
    final RPChoiceAnswerFormat choiceAnswerFormat =
        answerFormat as RPChoiceAnswerFormat;
    final List<String> choicesLabels =
        extractLabelFromChoices(choiceAnswerFormat.choices);
    return choicesLabels;
  }
}
