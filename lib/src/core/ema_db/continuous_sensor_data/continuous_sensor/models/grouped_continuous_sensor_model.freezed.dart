// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grouped_continuous_sensor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GroupedContinuousSensorData _$GroupedContinuousSensorDataFromJson(
    Map<String, dynamic> json) {
  return _GroupedContinuousSensorData.fromJson(json);
}

/// @nodoc
mixin _$GroupedContinuousSensorData {
  String get participantId => throw _privateConstructorUsedError;

  /// Start of the data collection period.
  DateTime get periodStart => throw _privateConstructorUsedError;

  /// End of the data collection period.
  DateTime get periodEnd => throw _privateConstructorUsedError;

  /// Sensor data collected during the period.
  List<ContinuousSensorModel> get sensorData =>
      throw _privateConstructorUsedError;

  /// Optional data for additional information
  Map<String, dynamic>? get extraData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupedContinuousSensorDataCopyWith<GroupedContinuousSensorData>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupedContinuousSensorDataCopyWith<$Res> {
  factory $GroupedContinuousSensorDataCopyWith(
          GroupedContinuousSensorData value,
          $Res Function(GroupedContinuousSensorData) then) =
      _$GroupedContinuousSensorDataCopyWithImpl<$Res,
          GroupedContinuousSensorData>;
  @useResult
  $Res call(
      {String participantId,
      DateTime periodStart,
      DateTime periodEnd,
      List<ContinuousSensorModel> sensorData,
      Map<String, dynamic>? extraData});
}

/// @nodoc
class _$GroupedContinuousSensorDataCopyWithImpl<$Res,
        $Val extends GroupedContinuousSensorData>
    implements $GroupedContinuousSensorDataCopyWith<$Res> {
  _$GroupedContinuousSensorDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? sensorData = null,
    Object? extraData = freezed,
  }) {
    return _then(_value.copyWith(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sensorData: null == sensorData
          ? _value.sensorData
          : sensorData // ignore: cast_nullable_to_non_nullable
              as List<ContinuousSensorModel>,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GroupedContinuousSensorDataImplCopyWith<$Res>
    implements $GroupedContinuousSensorDataCopyWith<$Res> {
  factory _$$GroupedContinuousSensorDataImplCopyWith(
          _$GroupedContinuousSensorDataImpl value,
          $Res Function(_$GroupedContinuousSensorDataImpl) then) =
      __$$GroupedContinuousSensorDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String participantId,
      DateTime periodStart,
      DateTime periodEnd,
      List<ContinuousSensorModel> sensorData,
      Map<String, dynamic>? extraData});
}

/// @nodoc
class __$$GroupedContinuousSensorDataImplCopyWithImpl<$Res>
    extends _$GroupedContinuousSensorDataCopyWithImpl<$Res,
        _$GroupedContinuousSensorDataImpl>
    implements _$$GroupedContinuousSensorDataImplCopyWith<$Res> {
  __$$GroupedContinuousSensorDataImplCopyWithImpl(
      _$GroupedContinuousSensorDataImpl _value,
      $Res Function(_$GroupedContinuousSensorDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? sensorData = null,
    Object? extraData = freezed,
  }) {
    return _then(_$GroupedContinuousSensorDataImpl(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sensorData: null == sensorData
          ? _value._sensorData
          : sensorData // ignore: cast_nullable_to_non_nullable
              as List<ContinuousSensorModel>,
      extraData: freezed == extraData
          ? _value._extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$GroupedContinuousSensorDataImpl
    implements _GroupedContinuousSensorData {
  const _$GroupedContinuousSensorDataImpl(
      {required this.participantId,
      required this.periodStart,
      required this.periodEnd,
      required final List<ContinuousSensorModel> sensorData,
      final Map<String, dynamic>? extraData})
      : _sensorData = sensorData,
        _extraData = extraData;

  factory _$GroupedContinuousSensorDataImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GroupedContinuousSensorDataImplFromJson(json);

  @override
  final String participantId;

  /// Start of the data collection period.
  @override
  final DateTime periodStart;

  /// End of the data collection period.
  @override
  final DateTime periodEnd;

  /// Sensor data collected during the period.
  final List<ContinuousSensorModel> _sensorData;

  /// Sensor data collected during the period.
  @override
  List<ContinuousSensorModel> get sensorData {
    if (_sensorData is EqualUnmodifiableListView) return _sensorData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sensorData);
  }

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
    return 'GroupedContinuousSensorData(participantId: $participantId, periodStart: $periodStart, periodEnd: $periodEnd, sensorData: $sensorData, extraData: $extraData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupedContinuousSensorDataImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            const DeepCollectionEquality()
                .equals(other._sensorData, _sensorData) &&
            const DeepCollectionEquality()
                .equals(other._extraData, _extraData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      participantId,
      periodStart,
      periodEnd,
      const DeepCollectionEquality().hash(_sensorData),
      const DeepCollectionEquality().hash(_extraData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupedContinuousSensorDataImplCopyWith<_$GroupedContinuousSensorDataImpl>
      get copyWith => __$$GroupedContinuousSensorDataImplCopyWithImpl<
          _$GroupedContinuousSensorDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GroupedContinuousSensorDataImplToJson(
      this,
    );
  }
}

abstract class _GroupedContinuousSensorData
    implements GroupedContinuousSensorData {
  const factory _GroupedContinuousSensorData(
          {required final String participantId,
          required final DateTime periodStart,
          required final DateTime periodEnd,
          required final List<ContinuousSensorModel> sensorData,
          final Map<String, dynamic>? extraData}) =
      _$GroupedContinuousSensorDataImpl;

  factory _GroupedContinuousSensorData.fromJson(Map<String, dynamic> json) =
      _$GroupedContinuousSensorDataImpl.fromJson;

  @override
  String get participantId;
  @override

  /// Start of the data collection period.
  DateTime get periodStart;
  @override

  /// End of the data collection period.
  DateTime get periodEnd;
  @override

  /// Sensor data collected during the period.
  List<ContinuousSensorModel> get sensorData;
  @override

  /// Optional data for additional information
  Map<String, dynamic>? get extraData;
  @override
  @JsonKey(ignore: true)
  _$$GroupedContinuousSensorDataImplCopyWith<_$GroupedContinuousSensorDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
