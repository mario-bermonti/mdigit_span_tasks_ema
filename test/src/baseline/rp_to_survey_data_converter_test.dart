import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/baseline/rp_to_survey_data_converter.dart';
import 'package:research_package/research_package.dart';

void main() {
  late RPToSurveyDataConverter converter;
  ;
  setUp(() {
    converter = RPToSurveyDataConverter();
  });
  group(
    "singleRPResultToJson",
    () {
      test(
        """Given an RPResult, RPResultToJson() returns a Map<String, dynamic>
        that contains the following keys that map to the specified values types: 
        `identifier` -> String, `start_date` -> String,
        `end_date` -> String, `results` -> Map.""",
        () {
          final RPStepResult stepResult = RPStepResult(
            identifier: 'color',
            questionTitle: 'What color do you prefer?',
            answerFormat: RPChoiceAnswerFormat(
              choices: [
                RPChoice(
                  text: 'Black',
                  value: 0,
                  isFreeText: false,
                ),
                RPChoice(
                  text: 'White',
                  value: 1,
                  isFreeText: false,
                ),
              ],
              answerStyle: RPChoiceAnswerStyle.SingleChoice,
            ),
          );

          stepResult.setResult(RPChoice(
            text: 'Black',
            value: 0,
            isFreeText: false,
          ));

          Map<String, dynamic> actualData =
              converter.rpStepResultToJson(stepResult);

          expect(actualData['identifier'], 'color');
          expect(actualData['question_title'], 'What color do you prefer?');
          expect(actualData.containsKey('start_date'), isTrue);
          expect(actualData.containsKey('end_date'), isTrue);
          expect(actualData['results'], isA<Map>());
          expect(actualData['results']['answer']['text'], 'Black');
          expect(actualData.containsKey('answer_format'), isTrue);
        },
      );
    },
  );
  group('extractLabelChoices', () {
    test(
      """Given a list of json [RPChoice]s, extract the 
      text label from each one and return them as a list.""",
      () {
        final List<Map<String, dynamic>> jsonChoices = [
          {
            "__type": "RPChoice",
            "text": "Black",
            "value": "0",
            "is_free_text": "false"
          },
          {
            "__type": "RPChoice",
            "text": "White",
            "value": "1",
            "is_free_text": "false"
          },
        ];

        final List<String> expectedChoices = ['Black', 'White'];

        final List<String> actualChoices =
            converter.extractLabelChoices(jsonChoices);

        expect(actualChoices, equals(expectedChoices));
      },
    );
  });
  group('formatChoices', () {
    test(
      """Given a list of RPchoices formatted as a maps, returns a list containing
    only the labels in their text fields.""",
      () {
        final List<Map<String, dynamic>> jsonChoices = [
          {
            "__type": "RPChoice",
            "text": "Black",
            "value": "0",
            "is_free_text": "false"
          },
          {
            "__type": "RPChoice",
            "text": "White",
            "value": "1",
            "is_free_text": "false"
          },
        ];

        final List<String> expectedChoices = ['Black', 'White'];

        final List<String> actualChoices = converter.formatChoices(jsonChoices);

        expect(actualChoices, equals(expectedChoices));
      },
    );
  });
  group(
    "formatSingleChoiceAnswer",
    () {
      test(
        "Given a list of map RPchoices, returns a string with the answer",
        () {
          final List<Map<String, dynamic>> jsonAnswer = [
            {
              "__type": "RPChoice",
              "text": "Black",
              "value": "0",
              "is_free_text": "false"
            },
          ];

          final String actualAnswer =
              converter.extractSingleChoiceAnswer(jsonAnswer);

          expect(actualAnswer, 'Black');
        },
      );
    },
  );
  group('formatAnswer', () {
    test(
      """Given a Date questionType and answer '2024-07-04T16:04:08.889902,' 
      returns '2024-07-04T16:04:08.889902'""",
      () {
        const String expectedAnswer = "2024-07-04T16:04:08.889902";
        const String questionType = "Date";

        final String actualAnswer = converter.formatAnswer(
            answer: expectedAnswer, questionType: questionType);

        expect(actualAnswer, expectedAnswer);
      },
    );

        expect(actualAnswer, expectedAnswer);
      },
    );
  });
}
