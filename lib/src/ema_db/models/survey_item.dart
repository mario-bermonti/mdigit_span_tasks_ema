import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'survey_item.freezed.dart';
part 'survey_item.g.dart';

/// Model that represents the data for a single survey item.
@freezed
class SurveyItemData with _$SurveyItemData {
  const factory SurveyItemData({
    /// Unique identifier for the participant
    required String participantID,

    /// Unique identifier for the current session of the  current participant.
    required String sessionID,

    /// Time at which the session started.
    required DateTime startTime,

    /// Time at which the session ended.
    required DateTime endTime,

    /// Short description of the data.
    required String identifier,

    /// Long description of the data
    required String description,

    /// Type of survey item present to understand the response scale.
    /// Common options are single choice, multiple choice, free text.
    required String type,
    required String? response,

    /// Possible choices the participant selects from.
    List<String>? choices,
  }) = _SurveyItemData;

  factory SurveyItemData.fromJson(Map<String, dynamic> json) =>
      _$SurveyItemDataFromJson(json);
}
