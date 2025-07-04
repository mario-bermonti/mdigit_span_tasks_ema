import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdigits/src/core/ema_db/models/ema_model.dart';

part 'continuous_sensor_model.freezed.dart';
part 'continuous_sensor_model.g.dart';

/// Represents continuous sensor data at a given moment in time.
@freezed
class ContinuousSensorModel extends EMAModel with _$ContinuousSensorModel {
  const factory ContinuousSensorModel({
    required String participantId,
    required dynamic value,
    required DateTime timestamp,
  }) = _ContinuousSensorData;

  factory ContinuousSensorModel.fromJson(Map<String, dynamic> json) =>
      _$ContinuousSensorModelFromJson(json);
}
