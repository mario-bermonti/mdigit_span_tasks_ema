import 'package:research_package/model.dart';

/// Format the answer to an [RPQuestion].
/// Currently supports Date and SingleChoice questions.
String? getAnswer({
  required Iterable<dynamic>? rpAnswer,
  required String itemType,
}) {
  if (rpAnswer == null) {
    return null;
  } else if (itemType == 'Date') {
    /// we assume response can only be null if the item was skipped
    return rpAnswer.first ?? "Prefiero no contestar";
  } else if (itemType == 'SingleChoice') {
    return rpAnswer.first.first.text as String;
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
        getLabelFromChoices(choiceAnswerFormat.choices);
    return choicesLabels;
  }
}

/// Extracts the label (i.e., text field) from each [RPChoice] in [choices].
List<String> getLabelFromChoices(List<RPChoice> choices) {
  final List<String> labels =
      choices.map((RPChoice choice) => choice.text).toList();
  return labels;
}
