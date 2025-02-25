// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'study_progress_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StudyProgressStep _$StudyProgressStepFromJson(Map<String, dynamic> json) {
  return _ProgressStep.fromJson(json);
}

/// @nodoc
mixin _$StudyProgressStep {
  String get participantId => throw _privateConstructorUsedError;
  String get stepId => throw _privateConstructorUsedError;
  Status? get status => throw _privateConstructorUsedError;
  DateTime? get lastUpdatedDateTime => throw _privateConstructorUsedError;
  String? get stepDescription => throw _privateConstructorUsedError;
  DateTime? get startDateTime => throw _privateConstructorUsedError;
  DateTime? get completionDateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StudyProgressStepCopyWith<StudyProgressStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudyProgressStepCopyWith<$Res> {
  factory $StudyProgressStepCopyWith(
          StudyProgressStep value, $Res Function(StudyProgressStep) then) =
      _$StudyProgressStepCopyWithImpl<$Res, StudyProgressStep>;
  @useResult
  $Res call(
      {String participantId,
      String stepId,
      Status? status,
      DateTime? lastUpdatedDateTime,
      String? stepDescription,
      DateTime? startDateTime,
      DateTime? completionDateTime});
}

/// @nodoc
class _$StudyProgressStepCopyWithImpl<$Res, $Val extends StudyProgressStep>
    implements $StudyProgressStepCopyWith<$Res> {
  _$StudyProgressStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? stepId = null,
    Object? status = freezed,
    Object? lastUpdatedDateTime = freezed,
    Object? stepDescription = freezed,
    Object? startDateTime = freezed,
    Object? completionDateTime = freezed,
  }) {
    return _then(_value.copyWith(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      lastUpdatedDateTime: freezed == lastUpdatedDateTime
          ? _value.lastUpdatedDateTime
          : lastUpdatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stepDescription: freezed == stepDescription
          ? _value.stepDescription
          : stepDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      startDateTime: freezed == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completionDateTime: freezed == completionDateTime
          ? _value.completionDateTime
          : completionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProgressStepImplCopyWith<$Res>
    implements $StudyProgressStepCopyWith<$Res> {
  factory _$$ProgressStepImplCopyWith(
          _$ProgressStepImpl value, $Res Function(_$ProgressStepImpl) then) =
      __$$ProgressStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String participantId,
      String stepId,
      Status? status,
      DateTime? lastUpdatedDateTime,
      String? stepDescription,
      DateTime? startDateTime,
      DateTime? completionDateTime});
}

/// @nodoc
class __$$ProgressStepImplCopyWithImpl<$Res>
    extends _$StudyProgressStepCopyWithImpl<$Res, _$ProgressStepImpl>
    implements _$$ProgressStepImplCopyWith<$Res> {
  __$$ProgressStepImplCopyWithImpl(
      _$ProgressStepImpl _value, $Res Function(_$ProgressStepImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? participantId = null,
    Object? stepId = null,
    Object? status = freezed,
    Object? lastUpdatedDateTime = freezed,
    Object? stepDescription = freezed,
    Object? startDateTime = freezed,
    Object? completionDateTime = freezed,
  }) {
    return _then(_$ProgressStepImpl(
      participantId: null == participantId
          ? _value.participantId
          : participantId // ignore: cast_nullable_to_non_nullable
              as String,
      stepId: null == stepId
          ? _value.stepId
          : stepId // ignore: cast_nullable_to_non_nullable
              as String,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status?,
      lastUpdatedDateTime: freezed == lastUpdatedDateTime
          ? _value.lastUpdatedDateTime
          : lastUpdatedDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      stepDescription: freezed == stepDescription
          ? _value.stepDescription
          : stepDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      startDateTime: freezed == startDateTime
          ? _value.startDateTime
          : startDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completionDateTime: freezed == completionDateTime
          ? _value.completionDateTime
          : completionDateTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProgressStepImpl implements _ProgressStep {
  const _$ProgressStepImpl(
      {required this.participantId,
      required this.stepId,
      required this.status,
      required this.lastUpdatedDateTime,
      this.stepDescription,
      this.startDateTime,
      this.completionDateTime});

  factory _$ProgressStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProgressStepImplFromJson(json);

  @override
  final String participantId;
  @override
  final String stepId;
  @override
  final Status? status;
  @override
  final DateTime? lastUpdatedDateTime;
  @override
  final String? stepDescription;
  @override
  final DateTime? startDateTime;
  @override
  final DateTime? completionDateTime;

  @override
  String toString() {
    return 'StudyProgressStep(participantId: $participantId, stepId: $stepId, status: $status, lastUpdatedDateTime: $lastUpdatedDateTime, stepDescription: $stepDescription, startDateTime: $startDateTime, completionDateTime: $completionDateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProgressStepImpl &&
            (identical(other.participantId, participantId) ||
                other.participantId == participantId) &&
            (identical(other.stepId, stepId) || other.stepId == stepId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastUpdatedDateTime, lastUpdatedDateTime) ||
                other.lastUpdatedDateTime == lastUpdatedDateTime) &&
            (identical(other.stepDescription, stepDescription) ||
                other.stepDescription == stepDescription) &&
            (identical(other.startDateTime, startDateTime) ||
                other.startDateTime == startDateTime) &&
            (identical(other.completionDateTime, completionDateTime) ||
                other.completionDateTime == completionDateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, participantId, stepId, status,
      lastUpdatedDateTime, stepDescription, startDateTime, completionDateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProgressStepImplCopyWith<_$ProgressStepImpl> get copyWith =>
      __$$ProgressStepImplCopyWithImpl<_$ProgressStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProgressStepImplToJson(
      this,
    );
  }
}

abstract class _ProgressStep implements StudyProgressStep {
  const factory _ProgressStep(
      {required final String participantId,
      required final String stepId,
      required final Status? status,
      required final DateTime? lastUpdatedDateTime,
      final String? stepDescription,
      final DateTime? startDateTime,
      final DateTime? completionDateTime}) = _$ProgressStepImpl;

  factory _ProgressStep.fromJson(Map<String, dynamic> json) =
      _$ProgressStepImpl.fromJson;

  @override
  String get participantId;
  @override
  String get stepId;
  @override
  Status? get status;
  @override
  DateTime? get lastUpdatedDateTime;
  @override
  String? get stepDescription;
  @override
  DateTime? get startDateTime;
  @override
  DateTime? get completionDateTime;
  @override
  @JsonKey(ignore: true)
  _$$ProgressStepImplCopyWith<_$ProgressStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
