// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Metadata _$MetadataFromJson(Map<String, dynamic> json) {
  return _Metadata.fromJson(json);
}

/// @nodoc
mixin _$Metadata {
  /// Unique identifier for the participant
  String get participantID => throw _privateConstructorUsedError;

  /// Unique identifier for the participant's session.
  String get sessionID => throw _privateConstructorUsedError;

  /// Time at which the session started.
  DateTime? get startTime => throw _privateConstructorUsedError;

  /// Time at which the session ended.
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// Short description of the metadata.
  String get identifier => throw _privateConstructorUsedError;

  /// Long description of the metadata
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MetadataCopyWith<Metadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MetadataCopyWith<$Res> {
  factory $MetadataCopyWith(Metadata value, $Res Function(Metadata) then) =
      _$MetadataCopyWithImpl<$Res, Metadata>;
  @useResult
  $Res call(
      {String participantID,
      String sessionID,
      DateTime? startTime,
      DateTime? endTime,
      String identifier,
      String description});
}

/// @nodoc
class _$MetadataCopyWithImpl<$Res, $Val extends Metadata>
    implements $MetadataCopyWith<$Res> {
  _$MetadataCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MetadataImplCopyWith<$Res>
    implements $MetadataCopyWith<$Res> {
  factory _$$MetadataImplCopyWith(
          _$MetadataImpl value, $Res Function(_$MetadataImpl) then) =
      __$$MetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String participantID,
      String sessionID,
      DateTime? startTime,
      DateTime? endTime,
      String identifier,
      String description});
}

/// @nodoc
class __$$MetadataImplCopyWithImpl<$Res>
    extends _$MetadataCopyWithImpl<$Res, _$MetadataImpl>
    implements _$$MetadataImplCopyWith<$Res> {
  __$$MetadataImplCopyWithImpl(
      _$MetadataImpl _value, $Res Function(_$MetadataImpl) _then)
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
  }) {
    return _then(_$MetadataImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MetadataImpl implements _Metadata {
  const _$MetadataImpl(
      {required this.participantID,
      required this.sessionID,
      this.startTime,
      this.endTime,
      required this.identifier,
      required this.description});

  factory _$MetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$MetadataImplFromJson(json);

  /// Unique identifier for the participant
  @override
  final String participantID;

  /// Unique identifier for the participant's session.
  @override
  final String sessionID;

  /// Time at which the session started.
  @override
  final DateTime? startTime;

  /// Time at which the session ended.
  @override
  final DateTime? endTime;

  /// Short description of the metadata.
  @override
  final String identifier;

  /// Long description of the metadata
  @override
  final String description;

  @override
  String toString() {
    return 'Metadata(participantID: $participantID, sessionID: $sessionID, startTime: $startTime, endTime: $endTime, identifier: $identifier, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MetadataImpl &&
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
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, participantID, sessionID,
      startTime, endTime, identifier, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MetadataImplCopyWith<_$MetadataImpl> get copyWith =>
      __$$MetadataImplCopyWithImpl<_$MetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MetadataImplToJson(
      this,
    );
  }
}

abstract class _Metadata implements Metadata {
  const factory _Metadata(
      {required final String participantID,
      required final String sessionID,
      final DateTime? startTime,
      final DateTime? endTime,
      required final String identifier,
      required final String description}) = _$MetadataImpl;

  factory _Metadata.fromJson(Map<String, dynamic> json) =
      _$MetadataImpl.fromJson;

  @override

  /// Unique identifier for the participant
  String get participantID;
  @override

  /// Unique identifier for the participant's session.
  String get sessionID;
  @override

  /// Time at which the session started.
  DateTime? get startTime;
  @override

  /// Time at which the session ended.
  DateTime? get endTime;
  @override

  /// Short description of the metadata.
  String get identifier;
  @override

  /// Long description of the metadata
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$MetadataImplCopyWith<_$MetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
