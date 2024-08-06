import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/baseline/rp_to_survey_data_converter.dart';
import 'package:research_package/research_package.dart';

void main() {
  late RPToSurveyDataConverter converter;
  setUp(() {
    converter = RPToSurveyDataConverter();
  });
  group("formatSurveyItemsData", () {
    test(
      """Given a valid RP results object formatted as a json,
      returns a list of maps with the data for each item.""",
      () {
        final RPStepResult colorStep = RPStepResult(
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
        colorStep.setResult(RPChoice(
          text: 'Black',
          value: 0,
          isFreeText: false,
        ));

        final RPStepResult dateStep = RPStepResult(
          identifier: "today",
          questionTitle: "What date is it?",
          answerFormat: RPDateTimeAnswerFormat(
              dateTimeAnswerStyle: RPDateTimeAnswerStyle.Date),
        );
        dateStep.setResult("2024-04-07 00:00:00.000");

        final Map<String, RPResult> rawItems = {
          colorStep.identifier: colorStep,
          dateStep.identifier: dateStep,
        };

        final List<Map<String, dynamic>> expectedItems = [
          {
            "identifier": colorStep.identifier,
            "startTime": colorStep.startDate,
            "endTime": colorStep.endDate,
            "description": colorStep.questionTitle,
            "type": 'SingleChoice',
            "response": "Black",
            "choices": ["Black", "White"],
          },
          {
            "startTime": dateStep.startDate,
            "endTime": dateStep.endDate,
            "identifier": dateStep.identifier,
            "description": dateStep.questionTitle,
            "type": "Date",
            "response": "2024-04-07 00:00:00.000",
          },
        ];

        final List<Map<String, dynamic>> actualItems =
            converter.formatSurveyItemsData(rawItems);

        /// check color item
        final Map<String, dynamic> actualColorItem = actualItems.first;
        final Map<String, dynamic> expectedColorItem = expectedItems.first;
        expect(actualColorItem['identifier'], expectedColorItem['identifier']);
        expect(
            actualColorItem['description'], expectedColorItem['description']);
        expect(actualColorItem['type'], expectedColorItem['type']);
        expect(actualColorItem['response'], expectedColorItem['response']);
        expect(actualColorItem['choices'], expectedColorItem['choices']);

        /// check date item
        final Map<String, dynamic> actualDateItem = actualItems.last;
        final Map<String, dynamic> expectedDateItem = expectedItems.last;
        expect(actualDateItem['identifier'], expectedDateItem['identifier']);
        expect(actualDateItem['description'], expectedDateItem['description']);
        expect(actualDateItem['type'], expectedDateItem['type']);
        expect(actualDateItem['response'], expectedDateItem['response']);
        expect(actualDateItem['choices'], expectedDateItem['choices']);
      },
    );
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
    test(
      """Given a SingleChoice questionType and answer 'Black', 
      returns 'Black'.""",
      () {
        const String expectedAnswer = 'Black';
        const String questionType = 'SingleChoice';
        final List<Map<String, dynamic>> rawAnswer = [
          {
            "__type": "RPChoice",
            "text": "Black",
            "value": "0",
            "is_free_text": "false"
          },
        ];

        final String actualAnswer = converter.formatAnswer(
            answer: rawAnswer, questionType: questionType);

        expect(actualAnswer, expectedAnswer);
      },
    );
    test(
      "Given an unsupported questionItem, throws a UnImplementedError",
      () {
        expect(
          () => converter.formatAnswer(
            answer: 'answer',
            questionType: 'questionType',
          ),
          throwsUnimplementedError,
        );
      },
    );
  });
  group('extractItemMetadata', () {
    test(
      """Given a valid json [RPResult] for a single choice question, returns its
      metadata including: 
      startTime, endTime, identifier, description, type.""",
      () {
        final Map<String, dynamic> rawItem = {
          "identifier": "color",
          "start_date": "2024-07-04T16:21:59.151739",
          "end_date": "2024-07-04T16:21:59.880927",
          "question_title": "What color do you prefer?",
          "results": {
            "answer": [
              {
                "__type": "RPChoice",
                "text": "Black",
                "value": "0",
                "is_free_text": "false"
              }
            ]
          },
          "answer_format": {
            "__type": "RPChoiceAnswerFormat",
            "question_type": "SingleChoice",
            "choices": [
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
              }
            ],
            "answer_style": "SingleChoice"
          }
        };
        final Map<String, dynamic> expectedMetadata = {
          "startTime": "2024-07-04T16:21:59.151739",
          "endTime": "2024-07-04T16:21:59.880927",
          "identifier": "color",
          "description": "What color do you prefer?",
          "type": "SingleChoice",
        };

        final Map<String, dynamic> actualMetadata =
            converter.extractItemMetadata(rawItem);

        expect(actualMetadata['startTime'], expectedMetadata['startTime']);
        expect(actualMetadata['endTime'], expectedMetadata['endTime']);
        expect(actualMetadata['identifier'], expectedMetadata['identifier']);
        expect(actualMetadata['description'], expectedMetadata['description']);
        expect(actualMetadata['type'], expectedMetadata['type']);
      },
    );
    test(
      """Given a valid json [RPResult] for a date question, returns its
      metadata including: 
      startTime, endTime, identifier, description, type.""",
      () {
        final Map<String, dynamic> rawItem = {
          "identifier": "today",
          "start_date": "2024-07-07T17:02:56.250538",
          "end_date": "2024-07-07T17:03:03.734029",
          "question_title": "What date is it?",
          "results": {"answer": "2024-04-07 00:00:00.000"},
          "answer_format": {
            "__type": "RPDateTimeAnswerFormat",
            "question_type": "Date",
            "date_time_answer_style": "Date"
          }
        };
        final Map<String, dynamic> expectedMetadata = {
          "startTime": "2024-07-07T17:02:56.250538",
          "endTime": "2024-07-07T17:03:03.734029",
          "identifier": "today",
          "description": "What date is it?",
          "type": "Date",
        };

        final Map<String, dynamic> actualMetadata =
            converter.extractItemMetadata(rawItem);

        expect(actualMetadata['startTime'], expectedMetadata['startTime']);
        expect(actualMetadata['endTime'], expectedMetadata['endTime']);
        expect(actualMetadata['identifier'], expectedMetadata['identifier']);
        expect(actualMetadata['description'], expectedMetadata['description']);
        expect(actualMetadata['type'], expectedMetadata['type']);
      },
    );
  });
  group('formatSurveyItemData', () {
    test(
      """Given a valid json for a single choice RPQuestionStep, returns an json 
      item that can be used to build a SurveyItemData.""",
      () {
        final Map<String, dynamic> rawItem = {
          "identifier": "color",
          "start_date": "2024-07-04T16:21:59.151739",
          "end_date": "2024-07-04T16:21:59.880927",
          "question_title": "What color do you prefer?",
          "results": {
            "answer": [
              {
                "__type": "RPChoice",
                "text": "Black",
                "value": "0",
                "is_free_text": "false"
              }
            ]
          },
          "answer_format": {
            "__type": "RPChoiceAnswerFormat",
            "question_type": "SingleChoice",
            "choices": [
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
              }
            ],
            "answer_style": "SingleChoice"
          }
        };
        final Map<String, dynamic> expectedItem = {
          "startTime": "2024-07-04T16:21:59.151739",
          "endTime": "2024-07-04T16:21:59.880927",
          "identifier": "color",
          "description": "What color do you prefer?",
          "type": "SingleChoice",
          "answer": "Black",
          "choices": ["Black", "White"]
        };

        final Map<String, dynamic> actualItem =
            converter.formatSurveyItemData(rawItem);

        expect(actualItem, expectedItem);
      },
    );
    test(
      """Given a valid json for a date RPQuestionStep, returns an json 
      item that can be used to build a SurveyItemData.""",
      () {
        final Map<String, dynamic> rawItem = {
          "identifier": "today",
          "start_date": "2024-07-04T16:21:59.151739",
          "end_date": "2024-07-04T16:21:59.880927",
          "question_title": "What date is it?",
          "results": {"answer": "2024-04-07 00:00:00.000"},
          "answer_format": {
            "__type": "RPDateTimeAnswerFormat",
            "question_type": "Date",
            "date_time_answer_style": "Date"
          }
        };
        final Map<String, dynamic> expectedItem = {
          "startTime": "2024-07-04T16:21:59.151739",
          "endTime": "2024-07-04T16:21:59.880927",
          "identifier": "today",
          "description": "What date is it?",
          "type": "Date",
          "answer": "2024-04-07 00:00:00.000",
        };

        final Map<String, dynamic> actualItem =
            converter.formatSurveyItemData(rawItem);

        expect(actualItem, expectedItem);
      },
    );
  });
}
