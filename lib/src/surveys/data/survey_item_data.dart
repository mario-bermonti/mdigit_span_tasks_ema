import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mdigit_span_tasks_ema/src/surveys/services/rp_converters.dart';
import 'package:research_package/research_package.dart';

part 'survey_item_data.freezed.dart';
part 'survey_item_data.g.dart';

/// Model that represents the data for a single survey item.
@freezed
class SurveyItemData with _$SurveyItemData {
  const factory SurveyItemData({
    required DateTime? startTime,
    required DateTime? endTime,

    /// Short description of the item
    required String identifier,

    /// Longer description than the [identifier].
    /// It's usually the text presented to the participant or
    /// a long description.
    required String description,

    /// Type of survey item present to understand the response scale.
    /// Common options are single choice, multiple choice, free text.
    required String type,
    required String response,

    /// Possible choices the participant select from.
    List<String>? choices,
  }) = _SurveyItemData;

  factory SurveyItemData.fromRPStepResult(RPStepResult rpItem) {
    final String itemType = rpItem.answerFormat.questionType.name;
    final String response = getAnswer(
      rpAnswer: rpItem.results.values,
      itemType: itemType,
    );
    final List<String>? choices = getChoices(rpItem.answerFormat);

    final SurveyItemData item = SurveyItemData(
      startTime: rpItem.startDate,
      endTime: rpItem.endDate,
      identifier: rpItem.identifier,
      description: rpItem.questionTitle,
      type: itemType,
      response: response,
      choices: choices,
    );
    return item;
  }

  factory SurveyItemData.fromJson(Map<String, dynamic> json) =>
      _$SurveyItemDataFromJson(json);
}
