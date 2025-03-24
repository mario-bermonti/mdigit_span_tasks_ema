// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceImpl _$$DeviceImplFromJson(Map<String, dynamic> json) => _$DeviceImpl(
      participantId: json['participantId'] as String,
      deviceId: json['deviceId'] as String,
      deviceModel: json['deviceModel'] as String?,
      os: json['os'] as String?,
      osVersion: json['osVersion'] as String?,
      height: json['height'] as String?,
      width: json['width'] as String?,
      aspectRatio: json['aspectRatio'] as String?,
    );

Map<String, dynamic> _$$DeviceImplToJson(_$DeviceImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'deviceId': instance.deviceId,
      'deviceModel': instance.deviceModel,
      'os': instance.os,
      'osVersion': instance.osVersion,
      'height': instance.height,
      'width': instance.width,
      'aspectRatio': instance.aspectRatio,
    };
