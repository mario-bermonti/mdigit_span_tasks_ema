import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdigits/src/core/ema_db/models/ema_model.dart';

part 'continuous_sensor_model.freezed.dart';
part 'continuous_sensor_model.g.dart';

/// Represents continuous sensor data at a given moment in time.
@freezed
class ContinuousSensorModel extends EMAModel with _$ContinuousSensorModel {
  const factory ContinuousSensorModel({
    required String participantId,

    /// Sensor value at the time of data collection
    required String value,

    /// Timestamp of the sensor data
    required DateTime timestamp,

    /// Optional data for additional information
    Map<String, dynamic>? extraData,
  }) = _ContinuousSensorData;

  factory ContinuousSensorModel.fromJson(Map<String, dynamic> json) =>
      _$ContinuousSensorModelFromJson(json);
}
