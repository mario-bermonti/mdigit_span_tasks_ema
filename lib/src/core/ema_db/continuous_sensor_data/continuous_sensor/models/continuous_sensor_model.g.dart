// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continuous_sensor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContinuousSensorDataImpl _$$ContinuousSensorDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ContinuousSensorDataImpl(
      participantId: json['participantId'] as String,
      value: json['value'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      extraData: json['extraData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ContinuousSensorDataImplToJson(
        _$ContinuousSensorDataImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'value': instance.value,
      'timestamp': instance.timestamp.toIso8601String(),
      'extraData': instance.extraData,
    };
