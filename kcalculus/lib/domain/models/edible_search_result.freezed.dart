// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EdibleSearchResult _$EdibleSearchResultFromJson(Map<String, dynamic> json) {
  return _EdibleSearchResult.fromJson(json);
}

/// @nodoc
mixin _$EdibleSearchResult {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  EdibleSearchResultType get type => throw _privateConstructorUsedError;
  DateTime? get lastEatenAt => throw _privateConstructorUsedError;

  /// Serializes this EdibleSearchResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EdibleSearchResultCopyWith<EdibleSearchResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EdibleSearchResultCopyWith<$Res> {
  factory $EdibleSearchResultCopyWith(
          EdibleSearchResult value, $Res Function(EdibleSearchResult) then) =
      _$EdibleSearchResultCopyWithImpl<$Res, EdibleSearchResult>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      EdibleSearchResultType type,
      DateTime? lastEatenAt});
}

/// @nodoc
class _$EdibleSearchResultCopyWithImpl<$Res, $Val extends EdibleSearchResult>
    implements $EdibleSearchResultCopyWith<$Res> {
  _$EdibleSearchResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? lastEatenAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EdibleSearchResultType,
      lastEatenAt: freezed == lastEatenAt
          ? _value.lastEatenAt
          : lastEatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EdibleSearchResultImplCopyWith<$Res>
    implements $EdibleSearchResultCopyWith<$Res> {
  factory _$$EdibleSearchResultImplCopyWith(_$EdibleSearchResultImpl value,
          $Res Function(_$EdibleSearchResultImpl) then) =
      __$$EdibleSearchResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      EdibleSearchResultType type,
      DateTime? lastEatenAt});
}

/// @nodoc
class __$$EdibleSearchResultImplCopyWithImpl<$Res>
    extends _$EdibleSearchResultCopyWithImpl<$Res, _$EdibleSearchResultImpl>
    implements _$$EdibleSearchResultImplCopyWith<$Res> {
  __$$EdibleSearchResultImplCopyWithImpl(_$EdibleSearchResultImpl _value,
      $Res Function(_$EdibleSearchResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? lastEatenAt = freezed,
  }) {
    return _then(_$EdibleSearchResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as EdibleSearchResultType,
      lastEatenAt: freezed == lastEatenAt
          ? _value.lastEatenAt
          : lastEatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EdibleSearchResultImpl implements _EdibleSearchResult {
  const _$EdibleSearchResultImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      this.lastEatenAt});

  factory _$EdibleSearchResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$EdibleSearchResultImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final EdibleSearchResultType type;
  @override
  final DateTime? lastEatenAt;

  @override
  String toString() {
    return 'EdibleSearchResult(id: $id, name: $name, description: $description, type: $type, lastEatenAt: $lastEatenAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EdibleSearchResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lastEatenAt, lastEatenAt) ||
                other.lastEatenAt == lastEatenAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, type, lastEatenAt);

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EdibleSearchResultImplCopyWith<_$EdibleSearchResultImpl> get copyWith =>
      __$$EdibleSearchResultImplCopyWithImpl<_$EdibleSearchResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EdibleSearchResultImplToJson(
      this,
    );
  }
}

abstract class _EdibleSearchResult implements EdibleSearchResult {
  const factory _EdibleSearchResult(
      {required final String id,
      required final String name,
      required final String description,
      required final EdibleSearchResultType type,
      final DateTime? lastEatenAt}) = _$EdibleSearchResultImpl;

  factory _EdibleSearchResult.fromJson(Map<String, dynamic> json) =
      _$EdibleSearchResultImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  EdibleSearchResultType get type;
  @override
  DateTime? get lastEatenAt;

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EdibleSearchResultImplCopyWith<_$EdibleSearchResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
