import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/models/metadata/metadata.dart';
import 'package:mdigit_span_tasks_ema/src/ema_db/models/survey/survey_item/survey_item.dart';

part 'survey.freezed.dart';
part 'survey.g.dart';

/// Model that represents the data for a survey.
@freezed
class Survey with _$Survey {
  const factory Survey({
    required Metadata metadata,
    required List<SurveyItem> items,
  }) = _Survey;

  factory Survey.fromJson(Map<String, dynamic> json) => _$SurveyFromJson(json);
}
