import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/models/survey/survey_item/survey_item.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

/// Model that represents the data for a survey.
@freezed
class Survey with _$Survey {
  const factory Survey({
    required DateTime? startTime,
    required DateTime? endTime,

    /// Short description of the item
    required String identifier,

    /// Longer description than the [identifier].
    /// It's usually the text presented to the participant or
    /// a long description.
    required String description,

    /// List of survey items that include meta about the item and
    /// the participant's response.
    required List<SurveyItem> items,
  }) = _Survey;

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
}
