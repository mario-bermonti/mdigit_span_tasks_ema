// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SurveyItem _$SurveyItemFromJson(Map<String, dynamic> json) {
  return _SurveyItem.fromJson(json);
}

/// @nodoc
mixin _$SurveyItem {
  /// Unique identifier for the participant.
  String get participantID => throw _privateConstructorUsedError;

  /// Unique identifier for the participant's session.
  String get sessionID => throw _privateConstructorUsedError;

  /// Time at which the item was presented.
  DateTime? get startTime => throw _privateConstructorUsedError;

  /// Time at which the participant responded to the item.
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// Short description for the item.
  String get identifier => throw _privateConstructorUsedError;

  /// Long description for the item.
  String get description => throw _privateConstructorUsedError;

  /// Type of survey item presented. This information is key to  understand
  /// the response scale. Common options are single choice, multiple choice,
  /// free text.
  String get type => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;

  /// Choices from which the participant selected their response.
  /// Does not apply to all survey items.
  List<String>? get choices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyItemCopyWith<SurveyItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyItemCopyWith<$Res> {
  factory $SurveyItemCopyWith(
          SurveyItem value, $Res Function(SurveyItem) then) =
      _$SurveyItemCopyWithImpl<$Res, SurveyItem>;
  @useResult
  $Res call(
      {String participantID,
      String sessionID,
      DateTime? startTime,
      DateTime? endTime,
      String identifier,
      String description,
      String type,
      String? response,
      List<String>? choices});
}

/// @nodoc
class _$SurveyItemCopyWithImpl<$Res, $Val extends SurveyItem>
    implements $SurveyItemCopyWith<$Res> {
  _$SurveyItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantID = null,
    Object? sessionID = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? identifier = null,
    Object? description = null,
    Object? type = null,
    Object? response = freezed,
    Object? choices = freezed,
  }) {
    return _then(_value.copyWith(
      participantID: null == participantID
          ? _value.participantID
          : participantID // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$SurveyItemImplCopyWith<$Res>
    implements $SurveyItemCopyWith<$Res> {
  factory _$$SurveyItemImplCopyWith(
          _$SurveyItemImpl value, $Res Function(_$SurveyItemImpl) then) =
      __$$SurveyItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String participantID,
      String sessionID,
      DateTime? startTime,
      DateTime? endTime,
      String identifier,
      String description,
      String type,
      String? response,
      List<String>? choices});
}

/// @nodoc
class __$$SurveyItemImplCopyWithImpl<$Res>
    extends _$SurveyItemCopyWithImpl<$Res, _$SurveyItemImpl>
    implements _$$SurveyItemImplCopyWith<$Res> {
  __$$SurveyItemImplCopyWithImpl(
      _$SurveyItemImpl _value, $Res Function(_$SurveyItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantID = null,
    Object? sessionID = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? identifier = null,
    Object? description = null,
    Object? type = null,
    Object? response = freezed,
    Object? choices = freezed,
  }) {
    return _then(_$SurveyItemImpl(
      participantID: null == participantID
          ? _value.participantID
          : participantID // ignore: cast_nullable_to_non_nullable
              as String,
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$SurveyItemImpl with DiagnosticableTreeMixin implements _SurveyItem {
  const _$SurveyItemImpl(
      {required this.participantID,
      required this.sessionID,
      this.startTime,
      this.endTime,
      required this.identifier,
      required this.description,
      required this.type,
      required this.response,
      final List<String>? choices})
      : _choices = choices;

  factory _$SurveyItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyItemImplFromJson(json);

  /// Unique identifier for the participant.
  @override
  final String participantID;

  /// Unique identifier for the participant's session.
  @override
  final String sessionID;

  /// Time at which the item was presented.
  @override
  final DateTime? startTime;

  /// Time at which the participant responded to the item.
  @override
  final DateTime? endTime;

  /// Short description for the item.
  @override
  final String identifier;

  /// Long description for the item.
  @override
  final String description;

  /// Type of survey item presented. This information is key to  understand
  /// the response scale. Common options are single choice, multiple choice,
  /// free text.
  @override
  final String type;
  @override
  final String? response;

  /// Choices from which the participant selected their response.
  /// Does not apply to all survey items.
  final List<String>? _choices;

  /// Choices from which the participant selected their response.
  /// Does not apply to all survey items.
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
    return 'SurveyItem(participantID: $participantID, sessionID: $sessionID, startTime: $startTime, endTime: $endTime, identifier: $identifier, description: $description, type: $type, response: $response, choices: $choices)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SurveyItem'))
      ..add(DiagnosticsProperty('participantID', participantID))
      ..add(DiagnosticsProperty('sessionID', sessionID))
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
            other is _$SurveyItemImpl &&
            (identical(other.participantID, participantID) ||
                other.participantID == participantID) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
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
      participantID,
      sessionID,
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
  _$$SurveyItemImplCopyWith<_$SurveyItemImpl> get copyWith =>
      __$$SurveyItemImplCopyWithImpl<_$SurveyItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyItemImplToJson(
      this,
    );
  }
}

abstract class _SurveyItem implements SurveyItem {
  const factory _SurveyItem(
      {required final String participantID,
      required final String sessionID,
      final DateTime? startTime,
      final DateTime? endTime,
      required final String identifier,
      required final String description,
      required final String type,
      required final String? response,
      final List<String>? choices}) = _$SurveyItemImpl;

  factory _SurveyItem.fromJson(Map<String, dynamic> json) =
      _$SurveyItemImpl.fromJson;

  @override

  /// Unique identifier for the participant.
  String get participantID;
  @override

  /// Unique identifier for the participant's session.
  String get sessionID;
  @override

  /// Time at which the item was presented.
  DateTime? get startTime;
  @override

  /// Time at which the participant responded to the item.
  DateTime? get endTime;
  @override

  /// Short description for the item.
  String get identifier;
  @override

  /// Long description for the item.
  String get description;
  @override

  /// Type of survey item presented. This information is key to  understand
  /// the response scale. Common options are single choice, multiple choice,
  /// free text.
  String get type;
  @override
  String? get response;
  @override

  /// Choices from which the participant selected their response.
  /// Does not apply to all survey items.
  List<String>? get choices;
  @override
  @JsonKey(ignore: true)
  _$$SurveyItemImplCopyWith<_$SurveyItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
