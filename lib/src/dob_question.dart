import 'package:research_package/research_package.dart';

RPQuestionStep dobQuestion = RPQuestionStep(
  identifier: 'dob',
  title: '¿Cuál es tu fecha de nacimiento?',
  answerFormat:
      RPDateTimeAnswerFormat(dateTimeAnswerStyle: RPDateTimeAnswerStyle.Date),
);
