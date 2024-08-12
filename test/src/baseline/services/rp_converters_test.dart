import 'package:flutter_test/flutter_test.dart';
import 'package:mdigit_span_tasks_ema/src/baseline/services/rp_converters.dart';

void main() {
  group(
    "getAnswer",
    () {
      test(
        """Given a Date itemType and the values inside a results object of a
        [RPStepResult] with the answer '2024-04-07 00:00:00.000' 
      returns '2024-04-07 00:00:00.000'""",
        () {
          final RPStepResult dateStep = RPStepResult(
            identifier: "today",
            questionTitle: "What date is it?",
            answerFormat: RPDateTimeAnswerFormat(
                dateTimeAnswerStyle: RPDateTimeAnswerStyle.Date),
          );
          dateStep.setResult("2024-04-07 00:00:00.000");

          const String itemType = "Date";
          const String expectedAnswer = "2024-04-07 00:00:00.000";

          final String actualAnswer = getAnswer(
            rpAnswer: dateStep.results.values,
            itemType: itemType,
          );

          expect(actualAnswer, expectedAnswer);
        },
      );
    },
  );
}
