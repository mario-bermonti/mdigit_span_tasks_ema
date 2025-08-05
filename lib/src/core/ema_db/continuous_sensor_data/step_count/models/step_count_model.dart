import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdigits/src/core/ema_db/models/ema_model.dart';

part 'step_count_model.freezed.dart';
part 'step_count_model.g.dart';

/// Represents the step count at a given moment in time.
@freezed
class StepCountModel extends EMAModel with _$StepCountModel {
  const factory StepCountModel({
    required String participantId,
    required int count,
    required DateTime timestamp,
  }) = _StepCountModel;

  factory StepCountModel.fromJson(Map<String, dynamic> json) =>
      _$StepCountModelFromJson(json);
}
