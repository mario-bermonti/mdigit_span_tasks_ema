// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grouped_continuous_sensor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GroupedContinuousSensorDataImpl _$$GroupedContinuousSensorDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GroupedContinuousSensorDataImpl(
      participantId: json['participantId'] as String,
      periodStart: DateTime.parse(json['periodStart'] as String),
      periodEnd: DateTime.parse(json['periodEnd'] as String),
      sensorData: (json['sensorData'] as List<dynamic>)
          .map((e) => ContinuousSensorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      extraData: json['extraData'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$GroupedContinuousSensorDataImplToJson(
        _$GroupedContinuousSensorDataImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'periodStart': instance.periodStart.toIso8601String(),
      'periodEnd': instance.periodEnd.toIso8601String(),
      'sensorData': instance.sensorData.map((e) => e.toJson()).toList(),
      'extraData': instance.extraData,
    };
