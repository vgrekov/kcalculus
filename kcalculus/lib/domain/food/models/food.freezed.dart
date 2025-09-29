// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Food {
  String? get id;
  String get name;
  String get description;
  List<NutritionFacts> get nutritionFacts;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FoodCopyWith<Food> get copyWith =>
      _$FoodCopyWithImpl<Food>(this as Food, _$identity);

  /// Serializes this Food to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Food &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other.nutritionFacts, nutritionFacts) &&
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
      const DeepCollectionEquality().hash(nutritionFacts),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Food(id: $id, name: $name, description: $description, nutritionFacts: $nutritionFacts, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) _then) =
      _$FoodCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      List<NutritionFacts> nutritionFacts,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$FoodCopyWithImpl<$Res> implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._self, this._then);

  final Food _self;
  final $Res Function(Food) _then;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? nutritionFacts = null,
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
      nutritionFacts: null == nutritionFacts
          ? _self.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>,
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
@JsonSerializable()
class _Food extends Food {
  const _Food(
      {this.id,
      required this.name,
      required this.description,
      required final List<NutritionFacts> nutritionFacts,
      this.createdAt,
      this.updatedAt})
      : _nutritionFacts = nutritionFacts,
        super._();
  factory _Food.fromJson(Map<String, dynamic> json) => _$FoodFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String description;
  final List<NutritionFacts> _nutritionFacts;
  @override
  List<NutritionFacts> get nutritionFacts {
    if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutritionFacts);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FoodCopyWith<_Food> get copyWith =>
      __$FoodCopyWithImpl<_Food>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FoodToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Food &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._nutritionFacts, _nutritionFacts) &&
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
      const DeepCollectionEquality().hash(_nutritionFacts),
      createdAt,
      updatedAt);

  @override
  String toString() {
    return 'Food(id: $id, name: $name, description: $description, nutritionFacts: $nutritionFacts, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$FoodCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$FoodCopyWith(_Food value, $Res Function(_Food) _then) =
      __$FoodCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      List<NutritionFacts> nutritionFacts,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$FoodCopyWithImpl<$Res> implements _$FoodCopyWith<$Res> {
  __$FoodCopyWithImpl(this._self, this._then);

  final _Food _self;
  final $Res Function(_Food) _then;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = null,
    Object? description = null,
    Object? nutritionFacts = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_Food(
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
      nutritionFacts: null == nutritionFacts
          ? _self._nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>,
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
