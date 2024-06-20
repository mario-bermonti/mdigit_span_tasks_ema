import 'package:research_package/research_package.dart';

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
