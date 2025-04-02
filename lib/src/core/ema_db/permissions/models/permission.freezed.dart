// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return _Permission.fromJson(json);
}

/// @nodoc
mixin _$Permission {
  String get participantId => throw _privateConstructorUsedError;
  String get permissionId => throw _privateConstructorUsedError;
  DateTime get dateTimeChanged => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  String? get permissionDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PermissionCopyWith<Permission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionCopyWith<$Res> {
  factory $PermissionCopyWith(
          Permission value, $Res Function(Permission) then) =
      _$PermissionCopyWithImpl<$Res, Permission>;
  @useResult
  $Res call(
      {String participantId,
      String permissionId,
      DateTime dateTimeChanged,
      Status status,
      String? permissionDescription});
}

/// @nodoc
class _$PermissionCopyWithImpl<$Res, $Val extends Permission>
    implements $PermissionCopyWith<$Res> {
  _$PermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? permissionId = null,
    Object? dateTimeChanged = null,
    Object? status = null,
    Object? permissionDescription = freezed,
  }) {
    return _then(_value.copyWith(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      permissionId: null == permissionId
          ? _value.permissionId
          : permissionId // ignore: cast_nullable_to_non_nullable
              as String,
      dateTimeChanged: null == dateTimeChanged
          ? _value.dateTimeChanged
          : dateTimeChanged // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      permissionDescription: freezed == permissionDescription
          ? _value.permissionDescription
          : permissionDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionImplCopyWith<$Res>
    implements $PermissionCopyWith<$Res> {
  factory _$$PermissionImplCopyWith(
          _$PermissionImpl value, $Res Function(_$PermissionImpl) then) =
      __$$PermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String participantId,
      String permissionId,
      DateTime dateTimeChanged,
      Status status,
      String? permissionDescription});
}

/// @nodoc
class __$$PermissionImplCopyWithImpl<$Res>
    extends _$PermissionCopyWithImpl<$Res, _$PermissionImpl>
    implements _$$PermissionImplCopyWith<$Res> {
  __$$PermissionImplCopyWithImpl(
      _$PermissionImpl _value, $Res Function(_$PermissionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? permissionId = null,
    Object? dateTimeChanged = null,
    Object? status = null,
    Object? permissionDescription = freezed,
  }) {
    return _then(_$PermissionImpl(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      permissionId: null == permissionId
          ? _value.permissionId
          : permissionId // ignore: cast_nullable_to_non_nullable
              as String,
      dateTimeChanged: null == dateTimeChanged
          ? _value.dateTimeChanged
          : dateTimeChanged // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      permissionDescription: freezed == permissionDescription
          ? _value.permissionDescription
          : permissionDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionImpl implements _Permission {
  const _$PermissionImpl(
      {required this.participantId,
      required this.permissionId,
      required this.dateTimeChanged,
      required this.status,
      this.permissionDescription});

  factory _$PermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionImplFromJson(json);

  @override
  final String participantId;
  @override
  final String permissionId;
  @override
  final DateTime dateTimeChanged;
  @override
  final Status status;
  @override
  final String? permissionDescription;

  @override
  String toString() {
    return 'Permission(participantId: $participantId, permissionId: $permissionId, dateTimeChanged: $dateTimeChanged, status: $status, permissionDescription: $permissionDescription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.permissionId, permissionId) ||
                other.permissionId == permissionId) &&
            (identical(other.dateTimeChanged, dateTimeChanged) ||
                other.dateTimeChanged == dateTimeChanged) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.permissionDescription, permissionDescription) ||
                other.permissionDescription == permissionDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, participantId, permissionId,
      dateTimeChanged, status, permissionDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionImplCopyWith<_$PermissionImpl> get copyWith =>
      __$$PermissionImplCopyWithImpl<_$PermissionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionImplToJson(
      this,
    );
  }
}

abstract class _Permission implements Permission {
  const factory _Permission(
      {required final String participantId,
      required final String permissionId,
      required final DateTime dateTimeChanged,
      required final Status status,
      final String? permissionDescription}) = _$PermissionImpl;

  factory _Permission.fromJson(Map<String, dynamic> json) =
      _$PermissionImpl.fromJson;

  @override
  String get participantId;
  @override
  String get permissionId;
  @override
  DateTime get dateTimeChanged;
  @override
  Status get status;
  @override
  String? get permissionDescription;
  @override
  @JsonKey(ignore: true)
  _$$PermissionImplCopyWith<_$PermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
