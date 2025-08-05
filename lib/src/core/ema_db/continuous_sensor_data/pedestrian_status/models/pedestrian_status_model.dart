import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdigits/src/core/ema_db/models/ema_model.dart';
import 'package:mdigits/src/core/ema_db/continuous_sensor_data/pedestrian_status/models/pedestrian_status.dart';

part 'pedestrian_status_model.freezed.dart';
part 'pedestrian_status_model.g.dart';

/// Represents the pedestrian status at a given moment in time.
@freezed
class PedestrianStatusModel extends EMAModel with _$PedestrianStatusModel {
  const factory PedestrianStatusModel({
    required String participantId,
    required PedestrianStatus status,
    required DateTime timestamp,
  }) = _PedestrianStatusModel;

  factory PedestrianStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PedestrianStatusModelFromJson(json);
}
