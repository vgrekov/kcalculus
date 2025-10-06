// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_search_result_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdibleSearchResultFirestoreModel {
  @JsonKey(includeToJson: false)
  String get id;
  EdibleType get type;
  String get name;
  String get description;
  String get ownerId;
  NutritionFactsPreviewFirestoreModel? get nutritionFactsPreview;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get eatenAt;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get touchedAt;

  /// Create a copy of EdibleSearchResultFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EdibleSearchResultFirestoreModelCopyWith<EdibleSearchResultFirestoreModel>
      get copyWith => _$EdibleSearchResultFirestoreModelCopyWithImpl<
              EdibleSearchResultFirestoreModel>(
          this as EdibleSearchResultFirestoreModel, _$identity);

  /// Serializes this EdibleSearchResultFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EdibleSearchResultFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.nutritionFactsPreview, nutritionFactsPreview) ||
                other.nutritionFactsPreview == nutritionFactsPreview) &&
            (identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt) &&
            (identical(other.touchedAt, touchedAt) ||
                other.touchedAt == touchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name, description,
      ownerId, nutritionFactsPreview, eatenAt, touchedAt);

  @override
  String toString() {
    return 'EdibleSearchResultFirestoreModel(id: $id, type: $type, name: $name, description: $description, ownerId: $ownerId, nutritionFactsPreview: $nutritionFactsPreview, eatenAt: $eatenAt, touchedAt: $touchedAt)';
  }
}

/// @nodoc
abstract mixin class $EdibleSearchResultFirestoreModelCopyWith<$Res> {
  factory $EdibleSearchResultFirestoreModelCopyWith(
          EdibleSearchResultFirestoreModel value,
          $Res Function(EdibleSearchResultFirestoreModel) _then) =
      _$EdibleSearchResultFirestoreModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      EdibleType type,
      String name,
      String description,
      String ownerId,
      NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? eatenAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? touchedAt});

  $NutritionFactsPreviewFirestoreModelCopyWith<$Res>? get nutritionFactsPreview;
}

/// @nodoc
class _$EdibleSearchResultFirestoreModelCopyWithImpl<$Res>
    implements $EdibleSearchResultFirestoreModelCopyWith<$Res> {
  _$EdibleSearchResultFirestoreModelCopyWithImpl(this._self, this._then);

  final EdibleSearchResultFirestoreModel _self;
  final $Res Function(EdibleSearchResultFirestoreModel) _then;

  /// Create a copy of EdibleSearchResultFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? description = null,
    Object? ownerId = null,
    Object? nutritionFactsPreview = freezed,
    Object? eatenAt = freezed,
    Object? touchedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EdibleType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      nutritionFactsPreview: freezed == nutritionFactsPreview
          ? _self.nutritionFactsPreview
          : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
              as NutritionFactsPreviewFirestoreModel?,
      eatenAt: freezed == eatenAt
          ? _self.eatenAt
          : eatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      touchedAt: freezed == touchedAt
          ? _self.touchedAt
          : touchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of EdibleSearchResultFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionFactsPreviewFirestoreModelCopyWith<$Res>?
      get nutritionFactsPreview {
    if (_self.nutritionFactsPreview == null) {
      return null;
    }

    return $NutritionFactsPreviewFirestoreModelCopyWith<$Res>(
        _self.nutritionFactsPreview!, (value) {
      return _then(_self.copyWith(nutritionFactsPreview: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _EdibleSearchResultFirestoreModel
    extends EdibleSearchResultFirestoreModel {
  const _EdibleSearchResultFirestoreModel(
      {@JsonKey(includeToJson: false) required this.id,
      required this.type,
      required this.name,
      required this.description,
      required this.ownerId,
      this.nutritionFactsPreview,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.eatenAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.touchedAt})
      : super._();
  factory _EdibleSearchResultFirestoreModel.fromJson(
          Map<String, dynamic> json) =>
      _$EdibleSearchResultFirestoreModelFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String id;
  @override
  final EdibleType type;
  @override
  final String name;
  @override
  final String description;
  @override
  final String ownerId;
  @override
  final NutritionFactsPreviewFirestoreModel? nutritionFactsPreview;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? eatenAt;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? touchedAt;

  /// Create a copy of EdibleSearchResultFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EdibleSearchResultFirestoreModelCopyWith<_EdibleSearchResultFirestoreModel>
      get copyWith => __$EdibleSearchResultFirestoreModelCopyWithImpl<
          _EdibleSearchResultFirestoreModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EdibleSearchResultFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EdibleSearchResultFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.nutritionFactsPreview, nutritionFactsPreview) ||
                other.nutritionFactsPreview == nutritionFactsPreview) &&
            (identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt) &&
            (identical(other.touchedAt, touchedAt) ||
                other.touchedAt == touchedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, name, description,
      ownerId, nutritionFactsPreview, eatenAt, touchedAt);

  @override
  String toString() {
    return 'EdibleSearchResultFirestoreModel(id: $id, type: $type, name: $name, description: $description, ownerId: $ownerId, nutritionFactsPreview: $nutritionFactsPreview, eatenAt: $eatenAt, touchedAt: $touchedAt)';
  }
}

/// @nodoc
abstract mixin class _$EdibleSearchResultFirestoreModelCopyWith<$Res>
    implements $EdibleSearchResultFirestoreModelCopyWith<$Res> {
  factory _$EdibleSearchResultFirestoreModelCopyWith(
          _EdibleSearchResultFirestoreModel value,
          $Res Function(_EdibleSearchResultFirestoreModel) _then) =
      __$EdibleSearchResultFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String id,
      EdibleType type,
      String name,
      String description,
      String ownerId,
      NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? eatenAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? touchedAt});

  @override
  $NutritionFactsPreviewFirestoreModelCopyWith<$Res>? get nutritionFactsPreview;
}

/// @nodoc
class __$EdibleSearchResultFirestoreModelCopyWithImpl<$Res>
    implements _$EdibleSearchResultFirestoreModelCopyWith<$Res> {
  __$EdibleSearchResultFirestoreModelCopyWithImpl(this._self, this._then);

  final _EdibleSearchResultFirestoreModel _self;
  final $Res Function(_EdibleSearchResultFirestoreModel) _then;

  /// Create a copy of EdibleSearchResultFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = null,
    Object? description = null,
    Object? ownerId = null,
    Object? nutritionFactsPreview = freezed,
    Object? eatenAt = freezed,
    Object? touchedAt = freezed,
  }) {
    return _then(_EdibleSearchResultFirestoreModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EdibleType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      nutritionFactsPreview: freezed == nutritionFactsPreview
          ? _self.nutritionFactsPreview
          : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
              as NutritionFactsPreviewFirestoreModel?,
      eatenAt: freezed == eatenAt
          ? _self.eatenAt
          : eatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      touchedAt: freezed == touchedAt
          ? _self.touchedAt
          : touchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of EdibleSearchResultFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NutritionFactsPreviewFirestoreModelCopyWith<$Res>?
      get nutritionFactsPreview {
    if (_self.nutritionFactsPreview == null) {
      return null;
    }

    return $NutritionFactsPreviewFirestoreModelCopyWith<$Res>(
        _self.nutritionFactsPreview!, (value) {
      return _then(_self.copyWith(nutritionFactsPreview: value));
    });
  }
}

// dart format on
