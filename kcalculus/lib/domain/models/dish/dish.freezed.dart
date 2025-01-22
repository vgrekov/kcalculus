// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Dish {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  Map<Measure, NutritionRatio> get nutritionRatios =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Dish to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Dish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DishCopyWith<Dish> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishCopyWith<$Res> {
  factory $DishCopyWith(Dish value, $Res Function(Dish) then) =
      _$DishCopyWithImpl<$Res, Dish>;
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
class _$DishCopyWithImpl<$Res, $Val extends Dish>
    implements $DishCopyWith<$Res> {
  _$DishCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      nutritionRatios: null == nutritionRatios
          ? _value.nutritionRatios
          : nutritionRatios // ignore: cast_nullable_to_non_nullable
              as Map<Measure, NutritionRatio>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishImplCopyWith<$Res> implements $DishCopyWith<$Res> {
  factory _$$DishImplCopyWith(
          _$DishImpl value, $Res Function(_$DishImpl) then) =
      __$$DishImplCopyWithImpl<$Res>;
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
class __$$DishImplCopyWithImpl<$Res>
    extends _$DishCopyWithImpl<$Res, _$DishImpl>
    implements _$$DishImplCopyWith<$Res> {
  __$$DishImplCopyWithImpl(_$DishImpl _value, $Res Function(_$DishImpl) _then)
      : super(_value, _then);

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
    return _then(_$DishImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      nutritionRatios: null == nutritionRatios
          ? _value._nutritionRatios
          : nutritionRatios // ignore: cast_nullable_to_non_nullable
              as Map<Measure, NutritionRatio>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$DishImpl extends _Dish {
  const _$DishImpl(
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

  @override
  String toString() {
    return 'Dish(id: $id, name: $name, description: $description, ingredients: $ingredients, nutritionRatios: $nutritionRatios, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishImpl &&
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

  /// Create a copy of Dish
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DishImplCopyWith<_$DishImpl> get copyWith =>
      __$$DishImplCopyWithImpl<_$DishImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DishImplToJson(
      this,
    );
  }
}

abstract class _Dish extends Dish {
  const factory _Dish(
      {final String? id,
      required final String name,
      required final String description,
      required final List<Ingredient> ingredients,
      required final Map<Measure, NutritionRatio> nutritionRatios,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$DishImpl;
  const _Dish._() : super._();

  @override
  String? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<Ingredient> get ingredients;
  @override
  Map<Measure, NutritionRatio> get nutritionRatios;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Dish
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DishImplCopyWith<_$DishImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
