// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      participantId: json['participantId'] as String,
      notificationId: json['notificationId'] as String,
      notificationType: json['notificationType'] as String?,
      title: json['title'] as String?,
      body: json['body'] as String?,
      timeSent: json['timeSent'] == null
          ? null
          : DateTime.parse(json['timeSent'] as String),
      timeTapped: json['timeTapped'] == null
          ? null
          : DateTime.parse(json['timeTapped'] as String),
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'notificationId': instance.notificationId,
      'notificationType': instance.notificationType,
      'title': instance.title,
      'body': instance.body,
      'timeSent': instance.timeSent?.toIso8601String(),
      'timeTapped': instance.timeTapped?.toIso8601String(),
    };
