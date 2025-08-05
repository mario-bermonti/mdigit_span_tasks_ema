// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pedestrian_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PedestrianStatusModel _$PedestrianStatusModelFromJson(
    Map<String, dynamic> json) {
  return _PedestrianStatusModel.fromJson(json);
}

/// @nodoc
mixin _$PedestrianStatusModel {
  String get participantId => throw _privateConstructorUsedError;
  PedestrianStatus get status => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PedestrianStatusModelCopyWith<PedestrianStatusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PedestrianStatusModelCopyWith<$Res> {
  factory $PedestrianStatusModelCopyWith(PedestrianStatusModel value,
          $Res Function(PedestrianStatusModel) then) =
      _$PedestrianStatusModelCopyWithImpl<$Res, PedestrianStatusModel>;
  @useResult
  $Res call(
      {String participantId, PedestrianStatus status, DateTime timestamp});
}

/// @nodoc
class _$PedestrianStatusModelCopyWithImpl<$Res,
        $Val extends PedestrianStatusModel>
    implements $PedestrianStatusModelCopyWith<$Res> {
  _$PedestrianStatusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? status = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PedestrianStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PedestrianStatusModelImplCopyWith<$Res>
    implements $PedestrianStatusModelCopyWith<$Res> {
  factory _$$PedestrianStatusModelImplCopyWith(
          _$PedestrianStatusModelImpl value,
          $Res Function(_$PedestrianStatusModelImpl) then) =
      __$$PedestrianStatusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String participantId, PedestrianStatus status, DateTime timestamp});
}

/// @nodoc
class __$$PedestrianStatusModelImplCopyWithImpl<$Res>
    extends _$PedestrianStatusModelCopyWithImpl<$Res,
        _$PedestrianStatusModelImpl>
    implements _$$PedestrianStatusModelImplCopyWith<$Res> {
  __$$PedestrianStatusModelImplCopyWithImpl(_$PedestrianStatusModelImpl _value,
      $Res Function(_$PedestrianStatusModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? status = null,
    Object? timestamp = null,
  }) {
    return _then(_$PedestrianStatusModelImpl(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PedestrianStatus,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PedestrianStatusModelImpl implements _PedestrianStatusModel {
  const _$PedestrianStatusModelImpl(
      {required this.participantId,
      required this.status,
      required this.timestamp});

  factory _$PedestrianStatusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PedestrianStatusModelImplFromJson(json);

  @override
  final String participantId;
  @override
  final PedestrianStatus status;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'PedestrianStatusModel(participantId: $participantId, status: $status, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PedestrianStatusModelImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, participantId, status, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PedestrianStatusModelImplCopyWith<_$PedestrianStatusModelImpl>
      get copyWith => __$$PedestrianStatusModelImplCopyWithImpl<
          _$PedestrianStatusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PedestrianStatusModelImplToJson(
      this,
    );
  }
}

abstract class _PedestrianStatusModel implements PedestrianStatusModel {
  const factory _PedestrianStatusModel(
      {required final String participantId,
      required final PedestrianStatus status,
      required final DateTime timestamp}) = _$PedestrianStatusModelImpl;

  factory _PedestrianStatusModel.fromJson(Map<String, dynamic> json) =
      _$PedestrianStatusModelImpl.fromJson;

  @override
  String get participantId;
  @override
  PedestrianStatus get status;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$PedestrianStatusModelImplCopyWith<_$PedestrianStatusModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
