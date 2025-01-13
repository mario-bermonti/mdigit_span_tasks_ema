// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'participant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      id: json['id'] as String,
      notificationTokens: (json['notificationTokens'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      nickname: json['nickname'] as String?,
      location: json['location'] as String?,
      timezone: json['timezone'] as String?,
      locale: json['locale'] as String?,
      appVersion: json['appVersion'] as String?,
      appBuildNumber: json['appBuildNumber'] as String?,
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'notificationTokens': instance.notificationTokens,
      'nickname': instance.nickname,
      'location': instance.location,
      'timezone': instance.timezone,
      'locale': instance.locale,
      'appVersion': instance.appVersion,
      'appBuildNumber': instance.appBuildNumber,
    };
