import 'package:research_package/research_package.dart';

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
