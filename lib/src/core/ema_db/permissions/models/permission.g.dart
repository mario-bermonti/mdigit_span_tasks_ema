// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionImpl _$$PermissionImplFromJson(Map<String, dynamic> json) =>
    _$PermissionImpl(
      participantId: json['participantId'] as String,
      permissionId: json['permissionId'] as String,
      dateTimeChanged: DateTime.parse(json['dateTimeChanged'] as String),
      status: $enumDecode(_$StatusEnumMap, json['status']),
      permissionDescription: json['permissionDescription'] as String?,
    );

Map<String, dynamic> _$$PermissionImplToJson(_$PermissionImpl instance) =>
    <String, dynamic>{
      'participantId': instance.participantId,
      'permissionId': instance.permissionId,
      'dateTimeChanged': instance.dateTimeChanged.toIso8601String(),
      'status': _$StatusEnumMap[instance.status]!,
      'permissionDescription': instance.permissionDescription,
    };

const _$StatusEnumMap = {
  Status.denied: 'denied',
  Status.accepted: 'accepted',
};
