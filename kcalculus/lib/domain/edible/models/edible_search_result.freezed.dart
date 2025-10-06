// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdibleSearchResult {
  String get id;
  String get name;
  String get description;
  EdibleSearchResultType get type;
  NutritionFactsPreview? get nutritionFactsPreview;
  DateTime? get lastEatenAt;
  DateTime? get touchedAt;

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EdibleSearchResultCopyWith<EdibleSearchResult> get copyWith =>
      _$EdibleSearchResultCopyWithImpl<EdibleSearchResult>(
          this as EdibleSearchResult, _$identity);

  /// Serializes this EdibleSearchResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EdibleSearchResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.nutritionFactsPreview, nutritionFactsPreview) ||
                other.nutritionFactsPreview == nutritionFactsPreview) &&
            (identical(other.lastEatenAt, lastEatenAt) ||
                other.lastEatenAt == lastEatenAt) &&
            (identical(other.touchedAt, touchedAt) ||
                other.touchedAt == touchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, type,
      nutritionFactsPreview, lastEatenAt, touchedAt);

  @override
  String toString() {
    return 'EdibleSearchResult(id: $id, name: $name, description: $description, type: $type, nutritionFactsPreview: $nutritionFactsPreview, lastEatenAt: $lastEatenAt, touchedAt: $touchedAt)';
  }
}

/// @nodoc
abstract mixin class $EdibleSearchResultCopyWith<$Res> {
  factory $EdibleSearchResultCopyWith(
          EdibleSearchResult value, $Res Function(EdibleSearchResult) _then) =
      _$EdibleSearchResultCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      EdibleSearchResultType type,
      NutritionFactsPreview? nutritionFactsPreview,
      DateTime? lastEatenAt,
      DateTime? touchedAt});

  $NutritionFactsPreviewCopyWith<$Res>? get nutritionFactsPreview;
}

/// @nodoc
class _$EdibleSearchResultCopyWithImpl<$Res>
    implements $EdibleSearchResultCopyWith<$Res> {
  _$EdibleSearchResultCopyWithImpl(this._self, this._then);

  final EdibleSearchResult _self;
  final $Res Function(EdibleSearchResult) _then;

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? nutritionFactsPreview = freezed,
    Object? lastEatenAt = freezed,
    Object? touchedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EdibleSearchResultType,
      nutritionFactsPreview: freezed == nutritionFactsPreview
          ? _self.nutritionFactsPreview
          : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
              as NutritionFactsPreview?,
      lastEatenAt: freezed == lastEatenAt
          ? _self.lastEatenAt
          : lastEatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      touchedAt: freezed == touchedAt
          ? _self.touchedAt
          : touchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionFactsPreviewCopyWith<$Res>? get nutritionFactsPreview {
    if (_self.nutritionFactsPreview == null) {
      return null;
    }

    return $NutritionFactsPreviewCopyWith<$Res>(_self.nutritionFactsPreview!,
        (value) {
      return _then(_self.copyWith(nutritionFactsPreview: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _EdibleSearchResult implements EdibleSearchResult {
  const _EdibleSearchResult(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      this.nutritionFactsPreview,
      this.lastEatenAt,
      this.touchedAt});
  factory _EdibleSearchResult.fromJson(Map<String, dynamic> json) =>
      _$EdibleSearchResultFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final EdibleSearchResultType type;
  @override
  final NutritionFactsPreview? nutritionFactsPreview;
  @override
  final DateTime? lastEatenAt;
  @override
  final DateTime? touchedAt;

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EdibleSearchResultCopyWith<_EdibleSearchResult> get copyWith =>
      __$EdibleSearchResultCopyWithImpl<_EdibleSearchResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EdibleSearchResultToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EdibleSearchResult &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.nutritionFactsPreview, nutritionFactsPreview) ||
                other.nutritionFactsPreview == nutritionFactsPreview) &&
            (identical(other.lastEatenAt, lastEatenAt) ||
                other.lastEatenAt == lastEatenAt) &&
            (identical(other.touchedAt, touchedAt) ||
                other.touchedAt == touchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, type,
      nutritionFactsPreview, lastEatenAt, touchedAt);

  @override
  String toString() {
    return 'EdibleSearchResult(id: $id, name: $name, description: $description, type: $type, nutritionFactsPreview: $nutritionFactsPreview, lastEatenAt: $lastEatenAt, touchedAt: $touchedAt)';
  }
}

/// @nodoc
abstract mixin class _$EdibleSearchResultCopyWith<$Res>
    implements $EdibleSearchResultCopyWith<$Res> {
  factory _$EdibleSearchResultCopyWith(
          _EdibleSearchResult value, $Res Function(_EdibleSearchResult) _then) =
      __$EdibleSearchResultCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      EdibleSearchResultType type,
      NutritionFactsPreview? nutritionFactsPreview,
      DateTime? lastEatenAt,
      DateTime? touchedAt});

  @override
  $NutritionFactsPreviewCopyWith<$Res>? get nutritionFactsPreview;
}

/// @nodoc
class __$EdibleSearchResultCopyWithImpl<$Res>
    implements _$EdibleSearchResultCopyWith<$Res> {
  __$EdibleSearchResultCopyWithImpl(this._self, this._then);

  final _EdibleSearchResult _self;
  final $Res Function(_EdibleSearchResult) _then;

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? nutritionFactsPreview = freezed,
    Object? lastEatenAt = freezed,
    Object? touchedAt = freezed,
  }) {
    return _then(_EdibleSearchResult(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EdibleSearchResultType,
      nutritionFactsPreview: freezed == nutritionFactsPreview
          ? _self.nutritionFactsPreview
          : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
              as NutritionFactsPreview?,
      lastEatenAt: freezed == lastEatenAt
          ? _self.lastEatenAt
          : lastEatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      touchedAt: freezed == touchedAt
          ? _self.touchedAt
          : touchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of EdibleSearchResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionFactsPreviewCopyWith<$Res>? get nutritionFactsPreview {
    if (_self.nutritionFactsPreview == null) {
      return null;
    }

    return $NutritionFactsPreviewCopyWith<$Res>(_self.nutritionFactsPreview!,
        (value) {
      return _then(_self.copyWith(nutritionFactsPreview: value));
    });
  }
}

// dart format on
