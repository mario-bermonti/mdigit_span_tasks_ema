// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_item_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SurveyItemData _$SurveyItemDataFromJson(Map<String, dynamic> json) {
  return _SurveyItemData.fromJson(json);
}

/// @nodoc
mixin _$SurveyItemData {
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// Short description of the item
  String get identifier => throw _privateConstructorUsedError;

  /// Longer description than the [identifier].
  /// It's usually the text presented to the participant or
  /// a long description.
  String get description => throw _privateConstructorUsedError;

  /// Type of survey item present to understand the response scale.
  /// Common options are single choice, multiple choice, free text.
  String get type => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;

  /// Possible choices the participant select from.
  List<String>? get choices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyItemDataCopyWith<SurveyItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyItemDataCopyWith<$Res> {
  factory $SurveyItemDataCopyWith(
          SurveyItemData value, $Res Function(SurveyItemData) then) =
      _$SurveyItemDataCopyWithImpl<$Res, SurveyItemData>;
  @useResult
  $Res call(
      {DateTime? startTime,
      DateTime? endTime,
      String identifier,
      String description,
      String type,
      String? response,
      List<String>? choices});
}

/// @nodoc
class _$SurveyItemDataCopyWithImpl<$Res, $Val extends SurveyItemData>
    implements $SurveyItemDataCopyWith<$Res> {
  _$SurveyItemDataCopyWithImpl(this._value, this._then);

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
    Object? type = null,
    Object? response = freezed,
    Object? choices = freezed,
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      choices: freezed == choices
          ? _value.choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SurveyItemDataImplCopyWith<$Res>
    implements $SurveyItemDataCopyWith<$Res> {
  factory _$$SurveyItemDataImplCopyWith(_$SurveyItemDataImpl value,
          $Res Function(_$SurveyItemDataImpl) then) =
      __$$SurveyItemDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? startTime,
      DateTime? endTime,
      String identifier,
      String description,
      String type,
      String? response,
      List<String>? choices});
}

/// @nodoc
class __$$SurveyItemDataImplCopyWithImpl<$Res>
    extends _$SurveyItemDataCopyWithImpl<$Res, _$SurveyItemDataImpl>
    implements _$$SurveyItemDataImplCopyWith<$Res> {
  __$$SurveyItemDataImplCopyWithImpl(
      _$SurveyItemDataImpl _value, $Res Function(_$SurveyItemDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? identifier = null,
    Object? description = null,
    Object? type = null,
    Object? response = freezed,
    Object? choices = freezed,
  }) {
    return _then(_$SurveyItemDataImpl(
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
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      choices: freezed == choices
          ? _value._choices
          : choices // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyItemDataImpl
    with DiagnosticableTreeMixin
    implements _SurveyItemData {
  const _$SurveyItemDataImpl(
      {required this.startTime,
      required this.endTime,
      required this.identifier,
      required this.description,
      required this.type,
      required this.response,
      final List<String>? choices})
      : _choices = choices;

  factory _$SurveyItemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyItemDataImplFromJson(json);

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

  /// Type of survey item present to understand the response scale.
  /// Common options are single choice, multiple choice, free text.
  @override
  final String type;
  @override
  final String? response;

  /// Possible choices the participant select from.
  final List<String>? _choices;

  /// Possible choices the participant select from.
  @override
  List<String>? get choices {
    final value = _choices;
    if (value == null) return null;
    if (_choices is EqualUnmodifiableListView) return _choices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SurveyItemData(startTime: $startTime, endTime: $endTime, identifier: $identifier, description: $description, type: $type, response: $response, choices: $choices)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SurveyItemData'))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('identifier', identifier))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('response', response))
      ..add(DiagnosticsProperty('choices', choices));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyItemDataImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.response, response) ||
                other.response == response) &&
            const DeepCollectionEquality().equals(other._choices, _choices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      startTime,
      endTime,
      identifier,
      description,
      type,
      response,
      const DeepCollectionEquality().hash(_choices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyItemDataImplCopyWith<_$SurveyItemDataImpl> get copyWith =>
      __$$SurveyItemDataImplCopyWithImpl<_$SurveyItemDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyItemDataImplToJson(
      this,
    );
  }
}

abstract class _SurveyItemData implements SurveyItemData {
  const factory _SurveyItemData(
      {required final DateTime? startTime,
      required final DateTime? endTime,
      required final String identifier,
      required final String description,
      required final String type,
      required final String? response,
      final List<String>? choices}) = _$SurveyItemDataImpl;

  factory _SurveyItemData.fromJson(Map<String, dynamic> json) =
      _$SurveyItemDataImpl.fromJson;

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

  /// Type of survey item present to understand the response scale.
  /// Common options are single choice, multiple choice, free text.
  String get type;
  @override
  String? get response;
  @override

  /// Possible choices the participant select from.
  List<String>? get choices;
  @override
  @JsonKey(ignore: true)
  _$$SurveyItemDataImplCopyWith<_$SurveyItemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
