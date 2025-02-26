import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';

part 'study_progress_step.freezed.dart';
part 'study_progress_step.g.dart';

/// Represents a single study step.
///
/// It is used as the basic unit to track participant's progress in the study.
@freezed
class StudyProgressStep extends EMAModel with _$StudyProgressStep {
  const factory StudyProgressStep({
    required String participantId,

    /// Unique identifier of the study step
    required String stepId,

    /// Status of the step. The steps are defined by [Status].
    required Status? status,
    required DateTime? lastUpdatedDateTime,
    String? stepDescription,
    DateTime? startDateTime,
    DateTime? completionDateTime,
  }) = _ProgressStep;

  factory StudyProgressStep.fromJson(Map<String, dynamic> json) =>
      _$StudyProgressStepFromJson(json);
}
