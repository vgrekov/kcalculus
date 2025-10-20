// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdiblePreview {
  String get id;
  String get name;
  String get description;
  EdiblePreviewType get type;
  NutritionFactsPreview? get nutritionFactsPreview;
  DateTime? get lastEatenAt;
  DateTime? get touchedAt;

  /// Create a copy of EdiblePreview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EdiblePreviewCopyWith<EdiblePreview> get copyWith =>
      _$EdiblePreviewCopyWithImpl<EdiblePreview>(
          this as EdiblePreview, _$identity);

  /// Serializes this EdiblePreview to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EdiblePreview &&
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
    return 'EdiblePreview(id: $id, name: $name, description: $description, type: $type, nutritionFactsPreview: $nutritionFactsPreview, lastEatenAt: $lastEatenAt, touchedAt: $touchedAt)';
  }
}

/// @nodoc
abstract mixin class $EdiblePreviewCopyWith<$Res> {
  factory $EdiblePreviewCopyWith(
          EdiblePreview value, $Res Function(EdiblePreview) _then) =
      _$EdiblePreviewCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      EdiblePreviewType type,
      NutritionFactsPreview? nutritionFactsPreview,
      DateTime? lastEatenAt,
      DateTime? touchedAt});

  $NutritionFactsPreviewCopyWith<$Res>? get nutritionFactsPreview;
}

/// @nodoc
class _$EdiblePreviewCopyWithImpl<$Res>
    implements $EdiblePreviewCopyWith<$Res> {
  _$EdiblePreviewCopyWithImpl(this._self, this._then);

  final EdiblePreview _self;
  final $Res Function(EdiblePreview) _then;

  /// Create a copy of EdiblePreview
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
              as EdiblePreviewType,
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

  /// Create a copy of EdiblePreview
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
class _EdiblePreview implements EdiblePreview {
  const _EdiblePreview(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      this.nutritionFactsPreview,
      this.lastEatenAt,
      this.touchedAt});
  factory _EdiblePreview.fromJson(Map<String, dynamic> json) =>
      _$EdiblePreviewFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final EdiblePreviewType type;
  @override
  final NutritionFactsPreview? nutritionFactsPreview;
  @override
  final DateTime? lastEatenAt;
  @override
  final DateTime? touchedAt;

  /// Create a copy of EdiblePreview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EdiblePreviewCopyWith<_EdiblePreview> get copyWith =>
      __$EdiblePreviewCopyWithImpl<_EdiblePreview>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EdiblePreviewToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EdiblePreview &&
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
    return 'EdiblePreview(id: $id, name: $name, description: $description, type: $type, nutritionFactsPreview: $nutritionFactsPreview, lastEatenAt: $lastEatenAt, touchedAt: $touchedAt)';
  }
}

/// @nodoc
abstract mixin class _$EdiblePreviewCopyWith<$Res>
    implements $EdiblePreviewCopyWith<$Res> {
  factory _$EdiblePreviewCopyWith(
          _EdiblePreview value, $Res Function(_EdiblePreview) _then) =
      __$EdiblePreviewCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      EdiblePreviewType type,
      NutritionFactsPreview? nutritionFactsPreview,
      DateTime? lastEatenAt,
      DateTime? touchedAt});

  @override
  $NutritionFactsPreviewCopyWith<$Res>? get nutritionFactsPreview;
}

/// @nodoc
class __$EdiblePreviewCopyWithImpl<$Res>
    implements _$EdiblePreviewCopyWith<$Res> {
  __$EdiblePreviewCopyWithImpl(this._self, this._then);

  final _EdiblePreview _self;
  final $Res Function(_EdiblePreview) _then;

  /// Create a copy of EdiblePreview
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
    return _then(_EdiblePreview(
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
              as EdiblePreviewType,
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

  /// Create a copy of EdiblePreview
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
