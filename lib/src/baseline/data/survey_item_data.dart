import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:research_package/research_package.dart';

part 'survey_item_data.freezed.dart';

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

  SurveyItemData.fromRPTaskResult(RPTaskResult rpItemData) {
    /// extract metadata
    /// extract choices, if applicable - service
    /// extract response - service
  }
}
