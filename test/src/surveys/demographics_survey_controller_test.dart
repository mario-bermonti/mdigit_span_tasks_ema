import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mdigits/src/surveys/demographics_survey_controller.dart';
import 'package:research_package/model.dart';

void main() {
  late DemographicsSurveyController controller;

  setUp(() {
    controller = Get.put(DemographicsSurveyController());
  });

  test(
    "Given a map with identifier, title, and choices, buildSingleChoiceQuestion returns an RPQuestionStep",
    () async {
      final List<RPChoice> choicesExpected = <RPChoice>[
        RPChoice(text: 'black', value: 0),
        RPChoice(text: 'white', value: 1),
      ];

      final RPChoiceAnswerFormat answerFormat = RPChoiceAnswerFormat(
        answerStyle: RPChoiceAnswerStyle.SingleChoice,
        choices: choicesExpected,
      );

      final RPQuestionStep questionExpected = RPQuestionStep(
        identifier: 'color',
        title: 'color?',
        answerFormat: answerFormat,
      );

      final Map<String, dynamic> questionJson = {
        'identifier': questionExpected.identifier,
        'title': questionExpected.title,
        'choices': [
          {
            'text': choicesExpected.first.text,
            'value': choicesExpected.first.value,
          },
          {
            'text': choicesExpected.last.text,
            'value': choicesExpected.last.value,
          }
        ]
      };

      final RPQuestionStep questionActual =
          controller.buildSingleChoiceQuestion(config: questionJson);

      expect(questionActual.identifier, questionExpected.identifier);
      expect(questionActual.title, questionExpected.title);
      final List<Map<String, dynamic>> choicesActual =
          questionActual.answerFormat.toJson()['choices'];
      expect(
        choicesActual.first,
        choicesExpected.first.toJson(),
      );
      expect(
        choicesActual.last,
        choicesExpected.last.toJson(),
      );
    },
  );
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

      final List<RPChoice> choicesActual =
          controller.buildChoices(choices: choicesRaw);

      expect(choicesActual.first.toJson(), choicesExpected.first.toJson());
      expect(choicesActual.last.toJson(), choicesExpected.last.toJson());
    },
  );
}
