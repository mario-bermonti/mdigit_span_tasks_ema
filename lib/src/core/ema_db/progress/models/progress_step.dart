import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/models/ema_model.dart';
import 'package:mdigit_span_tasks_ema/src/core/ema_db/progress/models/status.dart';

part 'progress_step.freezed.dart';
part 'progress_step.g.dart';

@freezed
class ProgressStep extends EMAModel with _$ProgressStep {
  const factory ProgressStep({
    required String participantId,
    required String stepId,
    required DateTime completionDateTime,
    String? stepDescription,
    DateTime? startDateTime,
    DateTime? lastUpdatedDateTime,
    Status? status,
  }) = _ProgressStep;

  factory ProgressStep.fromJson(Map<String, dynamic> json) =>
      _$ProgressStepFromJson(json);
}
