import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/task_item.dart';

part 'survey_item.freezed.dart';
part 'survey_item.g.dart';

/// Model that represents the data for a single survey item.
@freezed
class SurveyItem extends TaskItem with _$SurveyItem {
  const factory SurveyItem({
    /// Unique identifier for the participant.
    required String participantID,

    /// Unique identifier for the participant's session.
    required String sessionID,

    /// Time at which the item was presented.
    required DateTime startTime,

    /// Time at which the participant responded to the item.
    required DateTime endTime,

    /// Short description for the item.
    required String identifier,

    /// Long description for the item.
    required String description,

    /// Type of survey item presented. This information is key to  understand
    /// the response scale. Common options are single choice, multiple choice,
    /// free text.
    required String type,
    required String? response,

    /// Choices from which the participant selected their response.
    /// Does not apply to all survey items.
    List<String>? choices,
  }) = _SurveyItem;

  factory SurveyItem.fromJson(Map<String, dynamic> json) =>
      _$SurveyItemFromJson(json);
}
