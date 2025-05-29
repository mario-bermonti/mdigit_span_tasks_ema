import 'package:flutter_test/flutter_test.dart';
import 'package:mdigits/src/surveys/data/survey_item_data.dart';
import 'package:research_package/research_package.dart';

void main() {
  group("SurveyItemData.fromRPStepResult", () {
    test(
      """Given a valid [RPStepResult] for a Date survey item,
      returns a valid SurveyItemData.""",
      () {
        final RPStepResult rawItem = RPStepResult(
          identifier: "today",
          questionTitle: "What date is it?",
          answerFormat: RPDateTimeAnswerFormat(
            dateTimeAnswerStyle: RPDateTimeAnswerStyle.Date,
          ),
        );
        rawItem.setResult("2024-04-07 00:00:00.000");

        final SurveyItemData expectedItem = SurveyItemData(
          startTime: rawItem.startDate!,
          endTime: rawItem.endDate!,
          identifier: "today",
          description: "What date is it?",
          type: "Date",
          response: "2024-04-07 00:00:00.000",
        );

        final SurveyItemData actualItem =
            SurveyItemData.fromRPStepResult(rawItem);

        expect(actualItem, expectedItem);
      },
    );
    test(
      """Given a valid [RPStepResult] for a SingleChoice survey item,
      returns a valid SurveyItemData.""",
      () {
        final RPStepResult rawItem = RPStepResult(
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
        rawItem.setResult([
          RPChoice(
            text: 'Black',
            value: 0,
            isFreeText: false,
          )
        ]);

        final SurveyItemData expectedItem = SurveyItemData(
          startTime: rawItem.startDate!,
          endTime: rawItem.endDate!,
          identifier: "color",
          description: "What color do you prefer?",
          type: "SingleChoice",
          response: "Black",
          choices: ["Black", "White"],
        );

        final SurveyItemData actualItem =
            SurveyItemData.fromRPStepResult(rawItem);

        expect(actualItem, expectedItem);
      },
    );
  });
}
