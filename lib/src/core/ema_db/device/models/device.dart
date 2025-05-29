import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mdigits/src/core/ema_db/models/ema_model.dart';

part 'device.freezed.dart';
part 'device.g.dart';

@freezed
class Device extends EMAModel with _$Device {
  const factory Device({
    required String participantId,
    required String deviceId,
    required String? deviceModel,
    required String? os,
    required String? osVersion,
    required String? height,
    required String? width,
    required String? aspectRatio,
  }) = _Device;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);
}
