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
}
