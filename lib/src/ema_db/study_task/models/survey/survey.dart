import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/metadata/metadata.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/study_task.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/study_task/models/survey/survey_item.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

/// Model that represents the data for a survey.
///
/// Contains metadata about the survey's data collection session (e.g., time)
/// and the participants' responses to the survey items and
/// metadata (e.g., time) about each survey item.
@freezed
class Survey extends StudyTask with _$Survey {
  const factory Survey({
    /// Metadata about the data collection session.
    required Metadata metadata,

    /// Data for each survey item, including each item's metadata (e.g., time).
    required List<SurveyItem> items,
  }) = _Survey;

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
}
