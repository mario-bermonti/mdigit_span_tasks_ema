// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Survey _$SurveyFromJson(Map<String, dynamic> json) {
  return _Survey.fromJson(json);
}

/// @nodoc
mixin _$Survey {
  /// Metadata about the data collection session.
  Metadata get metadata => throw _privateConstructorUsedError;

  /// Data for each survey item, including each item's metadata (e.g., time).
  List<SurveyItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurveyCopyWith<Survey> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurveyCopyWith<$Res> {
  factory $SurveyCopyWith(Survey value, $Res Function(Survey) then) =
      _$SurveyCopyWithImpl<$Res, Survey>;
  @useResult
  $Res call({Metadata metadata, List<SurveyItem> items});

  $MetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$SurveyCopyWithImpl<$Res, $Val extends Survey>
    implements $SurveyCopyWith<$Res> {
  _$SurveyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SurveyItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetadataCopyWith<$Res> get metadata {
    return $MetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SurveyImplCopyWith<$Res> implements $SurveyCopyWith<$Res> {
  factory _$$SurveyImplCopyWith(
          _$SurveyImpl value, $Res Function(_$SurveyImpl) then) =
      __$$SurveyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Metadata metadata, List<SurveyItem> items});

  @override
  $MetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$SurveyImplCopyWithImpl<$Res>
    extends _$SurveyCopyWithImpl<$Res, _$SurveyImpl>
    implements _$$SurveyImplCopyWith<$Res> {
  __$$SurveyImplCopyWithImpl(
      _$SurveyImpl _value, $Res Function(_$SurveyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = null,
    Object? items = null,
  }) {
    return _then(_$SurveyImpl(
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<SurveyItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SurveyImpl with DiagnosticableTreeMixin implements _Survey {
  const _$SurveyImpl(
      {required this.metadata, required final List<SurveyItem> items})
      : _items = items;

  factory _$SurveyImpl.fromJson(Map<String, dynamic> json) =>
      _$$SurveyImplFromJson(json);

  /// Metadata about the data collection session.
  @override
  final Metadata metadata;

  /// Data for each survey item, including each item's metadata (e.g., time).
  final List<SurveyItem> _items;

  /// Data for each survey item, including each item's metadata (e.g., time).
  @override
  List<SurveyItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Survey(metadata: $metadata, items: $items)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Survey'))
      ..add(DiagnosticsProperty('metadata', metadata))
      ..add(DiagnosticsProperty('items', items));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SurveyImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, metadata, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SurveyImplCopyWith<_$SurveyImpl> get copyWith =>
      __$$SurveyImplCopyWithImpl<_$SurveyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SurveyImplToJson(
      this,
    );
  }
}

abstract class _Survey implements Survey {
  const factory _Survey(
      {required final Metadata metadata,
      required final List<SurveyItem> items}) = _$SurveyImpl;

  factory _Survey.fromJson(Map<String, dynamic> json) = _$SurveyImpl.fromJson;

  @override

  /// Metadata about the data collection session.
  Metadata get metadata;
  @override

  /// Data for each survey item, including each item's metadata (e.g., time).
  List<SurveyItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$SurveyImplCopyWith<_$SurveyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
