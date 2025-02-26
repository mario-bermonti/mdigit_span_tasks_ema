// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'study_progress_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProgressStepImpl _$$ProgressStepImplFromJson(Map<String, dynamic> json) =>
    _$ProgressStepImpl(
      participantId: json['participantId'] as String,
      stepId: json['stepId'] as String,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      lastUpdatedDateTime:
          DateTime.parse(json['lastUpdatedDateTime'] as String),
      stepDescription: json['stepDescription'] as String?,
      startDateTime: json['startDateTime'] == null
          ? null
          : DateTime.parse(json['startDateTime'] as String),
      completionDateTime: json['completionDateTime'] == null
          ? null
          : DateTime.parse(json['completionDateTime'] as String),
    );

Map<String, dynamic> _$$ProgressStepImplToJson(_$ProgressStepImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'stepId': instance.stepId,
      'status': _$StatusEnumMap[instance.status]!,
      'lastUpdatedDateTime': instance.lastUpdatedDateTime.toIso8601String(),
      'stepDescription': instance.stepDescription,
      'startDateTime': instance.startDateTime?.toIso8601String(),
      'completionDateTime': instance.completionDateTime?.toIso8601String(),
    };

const _$StatusEnumMap = {
  Status.inProgress: 'inProgress',
  Status.completed: 'completed',
};
