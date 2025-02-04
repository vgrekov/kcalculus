// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Food {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<NutritionFacts> get nutritionFacts => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Food to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res, Food>;
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
class _$FoodCopyWithImpl<$Res, $Val extends Food>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
      nutritionFacts: null == nutritionFacts
          ? _value.nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>,
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
abstract class _$$FoodImplCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$$FoodImplCopyWith(
          _$FoodImpl value, $Res Function(_$FoodImpl) then) =
      __$$FoodImplCopyWithImpl<$Res>;
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
class __$$FoodImplCopyWithImpl<$Res>
    extends _$FoodCopyWithImpl<$Res, _$FoodImpl>
    implements _$$FoodImplCopyWith<$Res> {
  __$$FoodImplCopyWithImpl(_$FoodImpl _value, $Res Function(_$FoodImpl) _then)
      : super(_value, _then);

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
    return _then(_$FoodImpl(
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
      nutritionFacts: null == nutritionFacts
          ? _value._nutritionFacts
          : nutritionFacts // ignore: cast_nullable_to_non_nullable
              as List<NutritionFacts>,
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
class _$FoodImpl extends _Food {
  const _$FoodImpl(
      {this.id,
      required this.name,
      required this.description,
      required final List<NutritionFacts> nutritionFacts,
      this.createdAt,
      this.updatedAt})
      : _nutritionFacts = nutritionFacts,
        super._();

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

  @override
  String toString() {
    return 'Food(id: $id, name: $name, description: $description, nutritionFacts: $nutritionFacts, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodImpl &&
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

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodImplCopyWith<_$FoodImpl> get copyWith =>
      __$$FoodImplCopyWithImpl<_$FoodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodImplToJson(
      this,
    );
  }
}

abstract class _Food extends Food {
  const factory _Food(
      {final String? id,
      required final String name,
      required final String description,
      required final List<NutritionFacts> nutritionFacts,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$FoodImpl;
  const _Food._() : super._();

  @override
  String? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<NutritionFacts> get nutritionFacts;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of Food
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodImplCopyWith<_$FoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
