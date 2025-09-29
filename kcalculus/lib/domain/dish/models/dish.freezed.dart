// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Dish {
  String? get id;
  String get name;
  String get description;
  List<Ingredient> get ingredients;
  Map<Measure, NutritionRatio> get nutritionRatios;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of Dish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DishCopyWith<Dish> get copyWith =>
      _$DishCopyWithImpl<Dish>(this as Dish, _$identity);

  /// Serializes this Dish to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Dish &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.ingredients, ingredients) &&
            const DeepCollectionEquality()
                .equals(other.nutritionRatios, nutritionRatios) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(ingredients),
      const DeepCollectionEquality().hash(nutritionRatios),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Dish(id: $id, name: $name, description: $description, ingredients: $ingredients, nutritionRatios: $nutritionRatios, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $DishCopyWith<$Res> {
  factory $DishCopyWith(Dish value, $Res Function(Dish) _then) =
      _$DishCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      List<Ingredient> ingredients,
      Map<Measure, NutritionRatio> nutritionRatios,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$DishCopyWithImpl<$Res> implements $DishCopyWith<$Res> {
  _$DishCopyWithImpl(this._self, this._then);

  final Dish _self;
  final $Res Function(Dish) _then;

  /// Create a copy of Dish
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? ingredients = null,
    Object? nutritionRatios = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _self.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      nutritionRatios: null == nutritionRatios
          ? _self.nutritionRatios
          : nutritionRatios // ignore: cast_nullable_to_non_nullable
              as Map<Measure, NutritionRatio>,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _Dish extends Dish {
  const _Dish(
      {this.id,
      required this.name,
      required this.description,
      required final List<Ingredient> ingredients,
      required final Map<Measure, NutritionRatio> nutritionRatios,
      this.createdAt,
      this.updatedAt})
      : _ingredients = ingredients,
        _nutritionRatios = nutritionRatios,
        super._();

  @override
  final String? id;
  @override
  final String name;
  @override
  final String description;
  final List<Ingredient> _ingredients;
  @override
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  final Map<Measure, NutritionRatio> _nutritionRatios;
  @override
  Map<Measure, NutritionRatio> get nutritionRatios {
    if (_nutritionRatios is EqualUnmodifiableMapView) return _nutritionRatios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_nutritionRatios);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of Dish
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DishCopyWith<_Dish> get copyWith =>
      __$DishCopyWithImpl<_Dish>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DishToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Dish &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            const DeepCollectionEquality()
                .equals(other._nutritionRatios, _nutritionRatios) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      const DeepCollectionEquality().hash(_ingredients),
      const DeepCollectionEquality().hash(_nutritionRatios),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Dish(id: $id, name: $name, description: $description, ingredients: $ingredients, nutritionRatios: $nutritionRatios, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$DishCopyWith<$Res> implements $DishCopyWith<$Res> {
  factory _$DishCopyWith(_Dish value, $Res Function(_Dish) _then) =
      __$DishCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      List<Ingredient> ingredients,
      Map<Measure, NutritionRatio> nutritionRatios,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$DishCopyWithImpl<$Res> implements _$DishCopyWith<$Res> {
  __$DishCopyWithImpl(this._self, this._then);

  final _Dish _self;
  final $Res Function(_Dish) _then;

  /// Create a copy of Dish
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? ingredients = null,
    Object? nutritionRatios = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Dish(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _self._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      nutritionRatios: null == nutritionRatios
          ? _self._nutritionRatios
          : nutritionRatios // ignore: cast_nullable_to_non_nullable
              as Map<Measure, NutritionRatio>,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
