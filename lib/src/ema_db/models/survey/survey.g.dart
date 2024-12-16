// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyImpl _$$SurveyImplFromJson(Map<String, dynamic> json) => _$SurveyImpl(
      participantID: json['participantID'] as String,
      sessionID: json['sessionID'] as String,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      identifier: json['identifier'] as String,
      description: json['description'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => SurveyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SurveyImplToJson(_$SurveyImpl instance) =>
    <String, dynamic>{
      'participantID': instance.participantID,
      'sessionID': instance.sessionID,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'identifier': instance.identifier,
      'description': instance.description,
      'items': instance.items,
    };
