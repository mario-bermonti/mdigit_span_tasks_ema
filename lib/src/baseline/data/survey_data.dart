import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:research_package/model.dart';

import 'survey_item_data.dart';

part 'survey_data.freezed.dart';

/// Model that represents the data for a single survey item.
@freezed
class SurveyData with _$SurveyData {
  const factory SurveyData({
    required DateTime? startTime,
    required DateTime? endTime,

    /// Short description of the item
    required String identifier,

    /// Longer description than the [identifier].
    /// It's usually the text presented to the participant or
    /// a long description.
    required String description,

    /// List of survey items that include metadata about the item and
    /// the participant's response.
    required List<SurveyItemData> items,
  }) = _SurveyData;
}
