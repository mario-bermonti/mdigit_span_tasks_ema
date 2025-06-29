// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StepCountModelImpl _$$StepCountModelImplFromJson(Map<String, dynamic> json) =>
    _$StepCountModelImpl(
      participantId: json['participantId'] as String,
      count: (json['count'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$StepCountModelImplToJson(
        _$StepCountModelImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'count': instance.count,
      'timestamp': instance.timestamp.toIso8601String(),
    };
