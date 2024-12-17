// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SurveyImpl _$$SurveyImplFromJson(Map<String, dynamic> json) => _$SurveyImpl(
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>)
          .map((e) => SurveyItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SurveyImplToJson(_$SurveyImpl instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'items': instance.items,
    };
