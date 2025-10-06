// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdibleFirestoreModel {
  @JsonKey(includeToJson: false)
  String? get id;
  EdibleType get type;
  String get name;
  String get name_lower;
  String get description;
  String get description_lower;
  String get ownerId;
  NutritionFactsPreviewFirestoreModel? get nutritionFactsPreview;
  List<NutritionFactsFirestoreModel>? get nutritionFacts;
  Map<Measure, NutritionRatioFirestoreModel>? get nutritionRatios;
  List<IngredientFirestoreModel>? get ingredients;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get createdAt;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get updatedAt;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get eatenAt;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get touchedAt;
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  DateTime? get deletedAt;

  /// Create a copy of EdibleFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EdibleFirestoreModelCopyWith<EdibleFirestoreModel> get copyWith =>
      _$EdibleFirestoreModelCopyWithImpl<EdibleFirestoreModel>(
          this as EdibleFirestoreModel, _$identity);

  /// Serializes this EdibleFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EdibleFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.name_lower, name_lower) ||
                other.name_lower == name_lower) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.description_lower, description_lower) ||
                other.description_lower == description_lower) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.nutritionFactsPreview, nutritionFactsPreview) ||
                other.nutritionFactsPreview == nutritionFactsPreview) &&
            const DeepCollectionEquality()
                .equals(other.nutritionFacts, nutritionFacts) &&
            const DeepCollectionEquality()
                .equals(other.nutritionRatios, nutritionRatios) &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt) &&
            (identical(other.touchedAt, touchedAt) ||
                other.touchedAt == touchedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      name_lower,
      description,
      description_lower,
      ownerId,
      nutritionFactsPreview,
      const DeepCollectionEquality().hash(nutritionFacts),
      const DeepCollectionEquality().hash(nutritionRatios),
      const DeepCollectionEquality().hash(ingredients),
      createdAt,
      updatedAt,
      eatenAt,
      touchedAt,
      deletedAt);

  @override
  String toString() {
    return 'EdibleFirestoreModel(id: $id, type: $type, name: $name, name_lower: $name_lower, description: $description, description_lower: $description_lower, ownerId: $ownerId, nutritionFactsPreview: $nutritionFactsPreview, nutritionFacts: $nutritionFacts, nutritionRatios: $nutritionRatios, ingredients: $ingredients, createdAt: $createdAt, updatedAt: $updatedAt, eatenAt: $eatenAt, touchedAt: $touchedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class $EdibleFirestoreModelCopyWith<$Res> {
  factory $EdibleFirestoreModelCopyWith(EdibleFirestoreModel value,
          $Res Function(EdibleFirestoreModel) _then) =
      _$EdibleFirestoreModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      EdibleType type,
      String name,
      String name_lower,
      String description,
      String description_lower,
      String ownerId,
      NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,
      List<NutritionFactsFirestoreModel>? nutritionFacts,
      Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios,
      List<IngredientFirestoreModel>? ingredients,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? updatedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? eatenAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? touchedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? deletedAt});

  $NutritionFactsPreviewFirestoreModelCopyWith<$Res>? get nutritionFactsPreview;
}

/// @nodoc
class _$EdibleFirestoreModelCopyWithImpl<$Res>
    implements $EdibleFirestoreModelCopyWith<$Res> {
  _$EdibleFirestoreModelCopyWithImpl(this._self, this._then);

  final EdibleFirestoreModel _self;
  final $Res Function(EdibleFirestoreModel) _then;

  /// Create a copy of EdibleFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? name = null,
    Object? name_lower = null,
    Object? description = null,
    Object? description_lower = null,
    Object? ownerId = null,
    Object? nutritionFactsPreview = freezed,
    Object? nutritionFacts = freezed,
    Object? nutritionRatios = freezed,
    Object? ingredients = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? eatenAt = freezed,
    Object? touchedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EdibleType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      name_lower: null == name_lower
          ? _self.name_lower
          : name_lower // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      description_lower: null == description_lower
          ? _self.description_lower
          : description_lower // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      nutritionFactsPreview: freezed == nutritionFactsPreview
          ? _self.nutritionFactsPreview
          : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
              as NutritionFactsPreviewFirestoreModel?,
      nutritionFacts: freezed == nutritionFacts
          ? _self.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFactsFirestoreModel>?,
      nutritionRatios: freezed == nutritionRatios
          ? _self.nutritionRatios
          : nutritionRatios // ignore: cast_nullable_to_non_nullable
              as Map<Measure, NutritionRatioFirestoreModel>?,
      ingredients: freezed == ingredients
          ? _self.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientFirestoreModel>?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eatenAt: freezed == eatenAt
          ? _self.eatenAt
          : eatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      touchedAt: freezed == touchedAt
          ? _self.touchedAt
          : touchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of EdibleFirestoreModel
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
class _EdibleFirestoreModel extends EdibleFirestoreModel {
  const _EdibleFirestoreModel(
      {@JsonKey(includeToJson: false) this.id,
      required this.type,
      required this.name,
      required this.name_lower,
      required this.description,
      required this.description_lower,
      required this.ownerId,
      this.nutritionFactsPreview,
      final List<NutritionFactsFirestoreModel>? nutritionFacts,
      final Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios,
      final List<IngredientFirestoreModel>? ingredients,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.updatedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.eatenAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.touchedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate) this.deletedAt})
      : _nutritionFacts = nutritionFacts,
        _nutritionRatios = nutritionRatios,
        _ingredients = ingredients,
        super._();
  factory _EdibleFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$EdibleFirestoreModelFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String? id;
  @override
  final EdibleType type;
  @override
  final String name;
  @override
  final String name_lower;
  @override
  final String description;
  @override
  final String description_lower;
  @override
  final String ownerId;
  @override
  final NutritionFactsPreviewFirestoreModel? nutritionFactsPreview;
  final List<NutritionFactsFirestoreModel>? _nutritionFacts;
  @override
  List<NutritionFactsFirestoreModel>? get nutritionFacts {
    final value = _nutritionFacts;
    if (value == null) return null;
    if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final Map<Measure, NutritionRatioFirestoreModel>? _nutritionRatios;
  @override
  Map<Measure, NutritionRatioFirestoreModel>? get nutritionRatios {
    final value = _nutritionRatios;
    if (value == null) return null;
    if (_nutritionRatios is EqualUnmodifiableMapView) return _nutritionRatios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<IngredientFirestoreModel>? _ingredients;
  @override
  List<IngredientFirestoreModel>? get ingredients {
    final value = _ingredients;
    if (value == null) return null;
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? createdAt;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? updatedAt;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? eatenAt;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? touchedAt;
  @override
  @JsonKey(includeToJson: false, fromJson: timestampToDate)
  final DateTime? deletedAt;

  /// Create a copy of EdibleFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$EdibleFirestoreModelCopyWith<_EdibleFirestoreModel> get copyWith =>
      __$EdibleFirestoreModelCopyWithImpl<_EdibleFirestoreModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$EdibleFirestoreModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _EdibleFirestoreModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.name_lower, name_lower) ||
                other.name_lower == name_lower) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.description_lower, description_lower) ||
                other.description_lower == description_lower) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.nutritionFactsPreview, nutritionFactsPreview) ||
                other.nutritionFactsPreview == nutritionFactsPreview) &&
            const DeepCollectionEquality()
                .equals(other._nutritionFacts, _nutritionFacts) &&
            const DeepCollectionEquality()
                .equals(other._nutritionRatios, _nutritionRatios) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt) &&
            (identical(other.touchedAt, touchedAt) ||
                other.touchedAt == touchedAt) &&
            (identical(other.deletedAt, deletedAt) ||
                other.deletedAt == deletedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      name,
      name_lower,
      description,
      description_lower,
      ownerId,
      nutritionFactsPreview,
      const DeepCollectionEquality().hash(_nutritionFacts),
      const DeepCollectionEquality().hash(_nutritionRatios),
      const DeepCollectionEquality().hash(_ingredients),
      createdAt,
      updatedAt,
      eatenAt,
      touchedAt,
      deletedAt);

  @override
  String toString() {
    return 'EdibleFirestoreModel._default(id: $id, type: $type, name: $name, name_lower: $name_lower, description: $description, description_lower: $description_lower, ownerId: $ownerId, nutritionFactsPreview: $nutritionFactsPreview, nutritionFacts: $nutritionFacts, nutritionRatios: $nutritionRatios, ingredients: $ingredients, createdAt: $createdAt, updatedAt: $updatedAt, eatenAt: $eatenAt, touchedAt: $touchedAt, deletedAt: $deletedAt)';
  }
}

/// @nodoc
abstract mixin class _$EdibleFirestoreModelCopyWith<$Res>
    implements $EdibleFirestoreModelCopyWith<$Res> {
  factory _$EdibleFirestoreModelCopyWith(_EdibleFirestoreModel value,
          $Res Function(_EdibleFirestoreModel) _then) =
      __$EdibleFirestoreModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String? id,
      EdibleType type,
      String name,
      String name_lower,
      String description,
      String description_lower,
      String ownerId,
      NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,
      List<NutritionFactsFirestoreModel>? nutritionFacts,
      Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios,
      List<IngredientFirestoreModel>? ingredients,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? createdAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? updatedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? eatenAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? touchedAt,
      @JsonKey(includeToJson: false, fromJson: timestampToDate)
      DateTime? deletedAt});

  @override
  $NutritionFactsPreviewFirestoreModelCopyWith<$Res>? get nutritionFactsPreview;
}

/// @nodoc
class __$EdibleFirestoreModelCopyWithImpl<$Res>
    implements _$EdibleFirestoreModelCopyWith<$Res> {
  __$EdibleFirestoreModelCopyWithImpl(this._self, this._then);

  final _EdibleFirestoreModel _self;
  final $Res Function(_EdibleFirestoreModel) _then;

  /// Create a copy of EdibleFirestoreModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? type = null,
    Object? name = null,
    Object? name_lower = null,
    Object? description = null,
    Object? description_lower = null,
    Object? ownerId = null,
    Object? nutritionFactsPreview = freezed,
    Object? nutritionFacts = freezed,
    Object? nutritionRatios = freezed,
    Object? ingredients = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? eatenAt = freezed,
    Object? touchedAt = freezed,
    Object? deletedAt = freezed,
  }) {
    return _then(_EdibleFirestoreModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as EdibleType,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      name_lower: null == name_lower
          ? _self.name_lower
          : name_lower // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      description_lower: null == description_lower
          ? _self.description_lower
          : description_lower // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _self.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      nutritionFactsPreview: freezed == nutritionFactsPreview
          ? _self.nutritionFactsPreview
          : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
              as NutritionFactsPreviewFirestoreModel?,
      nutritionFacts: freezed == nutritionFacts
          ? _self._nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFactsFirestoreModel>?,
      nutritionRatios: freezed == nutritionRatios
          ? _self._nutritionRatios
          : nutritionRatios // ignore: cast_nullable_to_non_nullable
              as Map<Measure, NutritionRatioFirestoreModel>?,
      ingredients: freezed == ingredients
          ? _self._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<IngredientFirestoreModel>?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eatenAt: freezed == eatenAt
          ? _self.eatenAt
          : eatenAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      touchedAt: freezed == touchedAt
          ? _self.touchedAt
          : touchedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deletedAt: freezed == deletedAt
          ? _self.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of EdibleFirestoreModel
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
