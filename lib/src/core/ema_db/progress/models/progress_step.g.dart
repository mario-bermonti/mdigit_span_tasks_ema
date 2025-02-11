// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressStepImpl _$$ProgressStepImplFromJson(Map<String, dynamic> json) =>
    _$ProgressStepImpl(
      participantId: json['participantId'] as String,
      stepId: json['stepId'] as String,
      completionDateTime: DateTime.parse(json['completionDateTime'] as String),
      stepDescription: json['stepDescription'] as String?,
      startDateTime: json['startDateTime'] == null
          ? null
          : DateTime.parse(json['startDateTime'] as String),
      lastUpdatedDateTime: json['lastUpdatedDateTime'] == null
          ? null
          : DateTime.parse(json['lastUpdatedDateTime'] as String),
      status: $enumDecodeNullable(_$StatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$ProgressStepImplToJson(_$ProgressStepImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'stepId': instance.stepId,
      'completionDateTime': instance.completionDateTime.toIso8601String(),
      'stepDescription': instance.stepDescription,
      'startDateTime': instance.startDateTime?.toIso8601String(),
      'lastUpdatedDateTime': instance.lastUpdatedDateTime?.toIso8601String(),
      'status': _$StatusEnumMap[instance.status],
    };

const _$StatusEnumMap = {
  Status.inProgress: 'inProgress',
  Status.completed: 'completed',
};
