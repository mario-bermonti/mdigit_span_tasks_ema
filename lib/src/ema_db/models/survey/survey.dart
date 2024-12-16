import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/models/survey/survey_item/survey_item.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

/// Model that represents the data for a survey.
@freezed
class Survey with _$Survey {
  const factory Survey({
    /// Unique identifier for the participant
    required String participantID,

    /// Unique identifier for the participant's session.
    required String sessionID,

    /// Time at which the session started.
    required DateTime startTime,

    /// Time at which the session ended.
    required DateTime endTime,

    /// Short description for the survey.
    required String identifier,

    /// Long description for the survey.
    required String description,

    /// List of items in the survey.
    required List<SurveyItem> items,
  }) = _Survey;

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
}
