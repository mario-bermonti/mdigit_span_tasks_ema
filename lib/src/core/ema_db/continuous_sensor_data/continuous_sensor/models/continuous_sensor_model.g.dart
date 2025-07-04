// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continuous_sensor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContinuousSensorDataImpl _$$ContinuousSensorDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ContinuousSensorDataImpl(
      participantId: json['participantId'] as String,
      value: json['value'],
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$ContinuousSensorDataImplToJson(
        _$ContinuousSensorDataImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'value': instance.value,
      'timestamp': instance.timestamp.toIso8601String(),
    };
