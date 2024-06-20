import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/baseline/question_builders.dart';
import 'package:research_package/model.dart';

void main() {
  test(
    "Given a list of maps that identify a label and value, buildChoices returns a list of [RPChoice]s",
    () {
      final List<RPChoice> choicesExpected = <RPChoice>[
        RPChoice(text: 'black', value: 0),
        RPChoice(text: 'white', value: 1),
      ];

      final List<Map<String, dynamic>> choicesRaw = <Map<String, dynamic>>[
        {
          'text': choicesExpected.first.text,
          'value': choicesExpected.first.value
        },
        {
          'text': choicesExpected.last.text,
          'value': choicesExpected.last.value
        },
      ];

      final List<RPChoice> choicesActual = buildChoices(choices: choicesRaw);

      expect(choicesActual.first.toJson(), choicesExpected.first.toJson());
      expect(choicesActual.last.toJson(), choicesExpected.last.toJson());
    },
  );
}
