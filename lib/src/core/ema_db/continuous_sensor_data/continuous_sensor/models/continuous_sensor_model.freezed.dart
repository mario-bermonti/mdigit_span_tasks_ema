// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'continuous_sensor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContinuousSensorModel _$ContinuousSensorModelFromJson(
    Map<String, dynamic> json) {
  return _ContinuousSensorData.fromJson(json);
}

/// @nodoc
mixin _$ContinuousSensorModel {
  String get participantId => throw _privateConstructorUsedError;

  /// Sensor value at the time of data collection
  String get value => throw _privateConstructorUsedError;

  /// Timestamp of the sensor data
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Optional data for additional information
  Map<String, dynamic>? get extraData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContinuousSensorModelCopyWith<ContinuousSensorModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContinuousSensorModelCopyWith<$Res> {
  factory $ContinuousSensorModelCopyWith(ContinuousSensorModel value,
          $Res Function(ContinuousSensorModel) then) =
      _$ContinuousSensorModelCopyWithImpl<$Res, ContinuousSensorModel>;
  @useResult
  $Res call(
      {String participantId,
      String value,
      DateTime timestamp,
      Map<String, dynamic>? extraData});
}

/// @nodoc
class _$ContinuousSensorModelCopyWithImpl<$Res,
        $Val extends ContinuousSensorModel>
    implements $ContinuousSensorModelCopyWith<$Res> {
  _$ContinuousSensorModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? value = null,
    Object? timestamp = null,
    Object? extraData = freezed,
  }) {
    return _then(_value.copyWith(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContinuousSensorDataImplCopyWith<$Res>
    implements $ContinuousSensorModelCopyWith<$Res> {
  factory _$$ContinuousSensorDataImplCopyWith(_$ContinuousSensorDataImpl value,
          $Res Function(_$ContinuousSensorDataImpl) then) =
      __$$ContinuousSensorDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String participantId,
      String value,
      DateTime timestamp,
      Map<String, dynamic>? extraData});
}

/// @nodoc
class __$$ContinuousSensorDataImplCopyWithImpl<$Res>
    extends _$ContinuousSensorModelCopyWithImpl<$Res,
        _$ContinuousSensorDataImpl>
    implements _$$ContinuousSensorDataImplCopyWith<$Res> {
  __$$ContinuousSensorDataImplCopyWithImpl(_$ContinuousSensorDataImpl _value,
      $Res Function(_$ContinuousSensorDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? value = null,
    Object? timestamp = null,
    Object? extraData = freezed,
  }) {
    return _then(_$ContinuousSensorDataImpl(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      extraData: freezed == extraData
          ? _value._extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContinuousSensorDataImpl implements _ContinuousSensorData {
  const _$ContinuousSensorDataImpl(
      {required this.participantId,
      required this.value,
      required this.timestamp,
      final Map<String, dynamic>? extraData})
      : _extraData = extraData;

  factory _$ContinuousSensorDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContinuousSensorDataImplFromJson(json);

  @override
  final String participantId;

  /// Sensor value at the time of data collection
  @override
  final String value;

  /// Timestamp of the sensor data
  @override
  final DateTime timestamp;

  /// Optional data for additional information
  final Map<String, dynamic>? _extraData;

  /// Optional data for additional information
  @override
  Map<String, dynamic>? get extraData {
    final value = _extraData;
    if (value == null) return null;
    if (_extraData is EqualUnmodifiableMapView) return _extraData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ContinuousSensorModel(participantId: $participantId, value: $value, timestamp: $timestamp, extraData: $extraData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContinuousSensorDataImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            const DeepCollectionEquality()
                .equals(other._extraData, _extraData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, participantId, value, timestamp,
      const DeepCollectionEquality().hash(_extraData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ContinuousSensorDataImplCopyWith<_$ContinuousSensorDataImpl>
      get copyWith =>
          __$$ContinuousSensorDataImplCopyWithImpl<_$ContinuousSensorDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContinuousSensorDataImplToJson(
      this,
    );
  }
}

abstract class _ContinuousSensorData implements ContinuousSensorModel {
  const factory _ContinuousSensorData(
      {required final String participantId,
      required final String value,
      required final DateTime timestamp,
      final Map<String, dynamic>? extraData}) = _$ContinuousSensorDataImpl;

  factory _ContinuousSensorData.fromJson(Map<String, dynamic> json) =
      _$ContinuousSensorDataImpl.fromJson;

  @override
  String get participantId;
  @override

  /// Sensor value at the time of data collection
  String get value;
  @override

  /// Timestamp of the sensor data
  DateTime get timestamp;
  @override

  /// Optional data for additional information
  Map<String, dynamic>? get extraData;
  @override
  @JsonKey(ignore: true)
  _$$ContinuousSensorDataImplCopyWith<_$ContinuousSensorDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
