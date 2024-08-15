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
      test(
        """Given a SingleChoice itemType and the values inside a results object 
        of a [RPStepResult] that contains 'Black' in the text field of the 
        [RPChoice] that contains its answer, returns 'Black'""",
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
          const String itemType = "SingleChoice";
          const String expectedAnswer = "Black";

          final String actualAnswer = getAnswer(
            rpAnswer: colorStep.results.values,
            itemType: itemType,
          );

          expect(actualAnswer, expectedAnswer);
        },
      );
      test(
        """Given a MultipleChoice itemType and the values inside a results object 
        of a [RPStepResult] that contains 'Black' in the text field of the 
        [RPChoice] that contains its answer, throws an UnimplementedError.'""",
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
          const String itemType = "MultipleChoice";

          expect(
            () => getAnswer(
              rpAnswer: colorStep.results.values,
              itemType: itemType,
            ),
            throwsUnimplementedError,
          );
        },
      );
    },
  );
  group("getChoices", () {
    test(
      "Given an [RPAnswerFormat] for a Date survey item, returns null",
      () {
        final RPStepResult dateStep = RPStepResult(
          identifier: "today",
          questionTitle: "What date is it?",
          answerFormat: RPDateTimeAnswerFormat(
              dateTimeAnswerStyle: RPDateTimeAnswerStyle.Date),
        );
        dateStep.setResult("2024-04-07 00:00:00.000");

        final List<String>? actualChoices = getChoices(dateStep.answerFormat);

        expect(actualChoices, null);
      },
    );
    test(
      """Given an [RPAnswerFormat] for a SingleChoice survey item, returns 
      a List of Strings with the text (i.e., label) of each choice.""",
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

        final List<String> expectedChoices = ['Black', 'White'];

        final List<String>? actualChoices = getChoices(colorStep.answerFormat);

        expect(actualChoices, expectedChoices);
      },
    );
  });
}
