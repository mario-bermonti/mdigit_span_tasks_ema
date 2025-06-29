// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pedestrian_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PedestrianStatusModelImpl _$$PedestrianStatusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PedestrianStatusModelImpl(
      participantId: json['participantId'] as String,
      status: $enumDecode(_$PedestrianStatusEnumMap, json['status']),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$PedestrianStatusModelImplToJson(
        _$PedestrianStatusModelImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'status': _$PedestrianStatusEnumMap[instance.status]!,
      'timestamp': instance.timestamp.toIso8601String(),
    };

const _$PedestrianStatusEnumMap = {
  PedestrianStatus.walking: 'walking',
  PedestrianStatus.stopped: 'stopped',
  PedestrianStatus.unknown: 'unknown',
};
