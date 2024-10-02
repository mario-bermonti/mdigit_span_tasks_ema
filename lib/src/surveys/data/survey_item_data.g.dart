// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_item_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyItemDataImpl _$$SurveyItemDataImplFromJson(Map<String, dynamic> json) =>
    _$SurveyItemDataImpl(
      startTime: json['startTime'] == null
          ? null
          : DateTime.parse(json['startTime'] as String),
      endTime: json['endTime'] == null
          ? null
          : DateTime.parse(json['endTime'] as String),
      identifier: json['identifier'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      response: json['response'] as String?,
      choices:
          (json['choices'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$SurveyItemDataImplToJson(
        _$SurveyItemDataImpl instance) =>
    <String, dynamic>{
      'startTime': instance.startTime?.toIso8601String(),
      'endTime': instance.endTime?.toIso8601String(),
      'identifier': instance.identifier,
      'description': instance.description,
      'type': instance.type,
      'response': instance.response,
      'choices': instance.choices,
    };
