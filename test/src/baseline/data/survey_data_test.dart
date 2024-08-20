import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/baseline/data/survey_data.dart';
import 'package:mdigit_span_tasks_ema/src/baseline/data/survey_item_data.dart';
import 'package:research_package/research_package.dart';

void main() {
  test(
    """Given a valid [RPTaskResult] and a description, 
    SurveyData.fromRPTaskResult returns a valid [SurveyData]""",
    () {
      /// survey items
      final RPStepResult rawDateItem = RPStepResult(
        identifier: "today",
        questionTitle: "What date is it?",
        answerFormat: RPDateTimeAnswerFormat(
          dateTimeAnswerStyle: RPDateTimeAnswerStyle.Date,
        ),
      );
      rawDateItem.setResult("2024-04-07 00:00:00.000");
      final SurveyItemData formattedDateItem = SurveyItemData(
        startTime: rawDateItem.startDate,
        endTime: rawDateItem.endDate,
        identifier: "today",
        description: "What date is it?",
        type: "Date",
        response: "2024-04-07 00:00:00.000",
      );

      final RPStepResult rawColorItem = RPStepResult(
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
      rawColorItem.setResult(RPChoice(
        text: 'Black',
        value: 0,
        isFreeText: false,
      ));
      final SurveyItemData formattedColorItem = SurveyItemData(
        startTime: rawColorItem.startDate,
        endTime: rawColorItem.endDate,
        identifier: "color",
        description: "What color do you prefer?",
        type: "SingleChoice",
        response: "Black",
        choices: ["Black", "White"],
      );

      /// Survey data
      final RPTaskResult rawSurveyData = RPTaskResult(
        identifier: 'test_survey',
      );
      rawSurveyData.setStepResultForIdentifier('today', rawDateItem);
      rawSurveyData.setStepResultForIdentifier('color', rawColorItem);
      const String description = "Test survey for unittesting";

      final SurveyData expectedSurveyData = SurveyData(
        startTime: rawSurveyData.startDate,
        endTime: rawSurveyData.endDate,
        identifier: rawSurveyData.identifier,
        description: description,
        items: [formattedDateItem, formattedColorItem],
      );

      final SurveyData actualSurveyData = SurveyData.fromRPTaskResult(
        rpSurveyData: rawSurveyData,
        description: description,
      );

      expect(actualSurveyData, expectedSurveyData);
    },
  );
}
