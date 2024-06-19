import 'package:research_package/model.dart';

import 'question_builders.dart';

const String basePath = '../questions';
final RPQuestionStep sexQuestion =
    buildSingleChoiceQuestionFromJson('lib/src/baseline/questions/sex.json');
final List<RPQuestionStep> questions = <RPQuestionStep>[sexQuestion];

final RPOrderedTask survey = RPOrderedTask(
  identifier: 'baseline',
  steps: questions,
  closeAfterFinished: false,
);
