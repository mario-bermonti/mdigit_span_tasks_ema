// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SurveyData _$SurveyDataFromJson(Map<String, dynamic> json) {
  return _SurveyData.fromJson(json);
}

/// @nodoc
mixin _$SurveyData {
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// Short description of the item
  String get identifier => throw _privateConstructorUsedError;

  /// Longer description than the [identifier].
  /// It's usually the text presented to the participant or
  /// a long description.
  String get description => throw _privateConstructorUsedError;

  /// List of survey items that include metadata about the item and
  /// the participant's response.
  List<SurveyItemData> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyDataCopyWith<SurveyData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyDataCopyWith<$Res> {
  factory $SurveyDataCopyWith(
          SurveyData value, $Res Function(SurveyData) then) =
      _$SurveyDataCopyWithImpl<$Res, SurveyData>;
  @useResult
  $Res call(
      {DateTime? startTime,
      DateTime? endTime,
      String identifier,
      String description,
      List<SurveyItemData> items});
}

/// @nodoc
class _$SurveyDataCopyWithImpl<$Res, $Val extends SurveyData>
    implements $SurveyDataCopyWith<$Res> {
  _$SurveyDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? identifier = null,
    Object? description = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SurveyItemData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SurveyDataImplCopyWith<$Res>
    implements $SurveyDataCopyWith<$Res> {
  factory _$$SurveyDataImplCopyWith(
          _$SurveyDataImpl value, $Res Function(_$SurveyDataImpl) then) =
      __$$SurveyDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startTime,
      DateTime? endTime,
      String identifier,
      String description,
      List<SurveyItemData> items});
}

/// @nodoc
class __$$SurveyDataImplCopyWithImpl<$Res>
    extends _$SurveyDataCopyWithImpl<$Res, _$SurveyDataImpl>
    implements _$$SurveyDataImplCopyWith<$Res> {
  __$$SurveyDataImplCopyWithImpl(
      _$SurveyDataImpl _value, $Res Function(_$SurveyDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? identifier = null,
    Object? description = null,
    Object? items = null,
  }) {
    return _then(_$SurveyDataImpl(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SurveyItemData>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyDataImpl with DiagnosticableTreeMixin implements _SurveyData {
  const _$SurveyDataImpl(
      {required this.startTime,
      required this.endTime,
      required this.identifier,
      required this.description,
      required final List<SurveyItemData> items})
      : _items = items;

  factory _$SurveyDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyDataImplFromJson(json);

  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;

  /// Short description of the item
  @override
  final String identifier;

  /// Longer description than the [identifier].
  /// It's usually the text presented to the participant or
  /// a long description.
  @override
  final String description;

  /// List of survey items that include metadata about the item and
  /// the participant's response.
  final List<SurveyItemData> _items;

  /// List of survey items that include metadata about the item and
  /// the participant's response.
  @override
  List<SurveyItemData> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SurveyData(startTime: $startTime, endTime: $endTime, identifier: $identifier, description: $description, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SurveyData'))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyDataImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime, identifier,
      description, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyDataImplCopyWith<_$SurveyDataImpl> get copyWith =>
      __$$SurveyDataImplCopyWithImpl<_$SurveyDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyDataImplToJson(
      this,
    );
  }
}

abstract class _SurveyData implements SurveyData {
  const factory _SurveyData(
      {required final DateTime? startTime,
      required final DateTime? endTime,
      required final String identifier,
      required final String description,
      required final List<SurveyItemData> items}) = _$SurveyDataImpl;

  factory _SurveyData.fromJson(Map<String, dynamic> json) =
      _$SurveyDataImpl.fromJson;

  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override

  /// Short description of the item
  String get identifier;
  @override

  /// Longer description than the [identifier].
  /// It's usually the text presented to the participant or
  /// a long description.
  String get description;
  @override

  /// List of survey items that include metadata about the item and
  /// the participant's response.
  List<SurveyItemData> get items;
  @override
  @JsonKey(ignore: true)
  _$$SurveyDataImplCopyWith<_$SurveyDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
