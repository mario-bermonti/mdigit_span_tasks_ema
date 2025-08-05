import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/continuous_sensor/models/continuous_sensor_model.dart';
import 'package:mdigits/src/core/ema_db/models/ema_model.dart';

part 'grouped_continuous_sensor_model.freezed.dart';
part 'grouped_continuous_sensor_model.g.dart';

/// Groups continuous sensor data for the period [periodStart] and [periodEnd].
@Freezed(fromJson: true, toJson: true)
class GroupedContinuousSensorData extends EMAModel
    with _$GroupedContinuousSensorData {
  /// We ignore the warning below because otherwise embedded
  /// [ContinuousSensorModel]s would not be serialized correctly.
  @JsonSerializable(explicitToJson: true) // ignore: invalid_annotation_target
  const factory GroupedContinuousSensorData({
    required String participantId,

    /// Start of the data collection period.
    required DateTime periodStart,

    /// End of the data collection period.
    required DateTime periodEnd,

    /// Sensor data collected during the period.
    required List<ContinuousSensorModel> sensorData,

    /// Optional data for additional information
    Map<String, dynamic>? extraData,
  }) = _GroupedContinuousSensorData;

  factory GroupedContinuousSensorData.fromJson(Map<String, dynamic> json) =>
      _$GroupedContinuousSensorDataFromJson(json);
}
