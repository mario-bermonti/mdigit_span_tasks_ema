// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyDataImpl _$$SurveyDataImplFromJson(Map<String, dynamic> json) =>
    _$SurveyDataImpl(
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      identifier: json['identifier'] as String,
      description: json['description'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => SurveyItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SurveyDataImplToJson(_$SurveyDataImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'identifier': instance.identifier,
      'description': instance.description,
      'items': instance.items,
    };
