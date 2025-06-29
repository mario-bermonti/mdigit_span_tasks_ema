// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'step_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StepCountModel _$StepCountModelFromJson(Map<String, dynamic> json) {
  return _StepCountModel.fromJson(json);
}

/// @nodoc
mixin _$StepCountModel {
  String get participantId => throw _privateConstructorUsedError;
  int get count => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StepCountModelCopyWith<StepCountModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StepCountModelCopyWith<$Res> {
  factory $StepCountModelCopyWith(
          StepCountModel value, $Res Function(StepCountModel) then) =
      _$StepCountModelCopyWithImpl<$Res, StepCountModel>;
  @useResult
  $Res call({String participantId, int count, DateTime timestamp});
}

/// @nodoc
class _$StepCountModelCopyWithImpl<$Res, $Val extends StepCountModel>
    implements $StepCountModelCopyWith<$Res> {
  _$StepCountModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? count = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StepCountModelImplCopyWith<$Res>
    implements $StepCountModelCopyWith<$Res> {
  factory _$$StepCountModelImplCopyWith(_$StepCountModelImpl value,
          $Res Function(_$StepCountModelImpl) then) =
      __$$StepCountModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String participantId, int count, DateTime timestamp});
}

/// @nodoc
class __$$StepCountModelImplCopyWithImpl<$Res>
    extends _$StepCountModelCopyWithImpl<$Res, _$StepCountModelImpl>
    implements _$$StepCountModelImplCopyWith<$Res> {
  __$$StepCountModelImplCopyWithImpl(
      _$StepCountModelImpl _value, $Res Function(_$StepCountModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? count = null,
    Object? timestamp = null,
  }) {
    return _then(_$StepCountModelImpl(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StepCountModelImpl implements _StepCountModel {
  const _$StepCountModelImpl(
      {required this.participantId,
      required this.count,
      required this.timestamp});

  factory _$StepCountModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StepCountModelImplFromJson(json);

  @override
  final String participantId;
  @override
  final int count;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'StepCountModel(participantId: $participantId, count: $count, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StepCountModelImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, participantId, count, timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StepCountModelImplCopyWith<_$StepCountModelImpl> get copyWith =>
      __$$StepCountModelImplCopyWithImpl<_$StepCountModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StepCountModelImplToJson(
      this,
    );
  }
}

abstract class _StepCountModel implements StepCountModel {
  const factory _StepCountModel(
      {required final String participantId,
      required final int count,
      required final DateTime timestamp}) = _$StepCountModelImpl;

  factory _StepCountModel.fromJson(Map<String, dynamic> json) =
      _$StepCountModelImpl.fromJson;

  @override
  String get participantId;
  @override
  int get count;
  @override
  DateTime get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$StepCountModelImplCopyWith<_$StepCountModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
