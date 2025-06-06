// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_v1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodV1 _$FoodV1FromJson(Map<String, dynamic> json) {
  return _FoodV1.fromJson(json);
}

/// @nodoc
mixin _$FoodV1 {
  String? get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<NutritionFactsV1> get nutritionFacts =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this FoodV1 to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodV1
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodV1CopyWith<FoodV1> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodV1CopyWith<$Res> {
  factory $FoodV1CopyWith(FoodV1 value, $Res Function(FoodV1) then) =
      _$FoodV1CopyWithImpl<$Res, FoodV1>;
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      List<NutritionFactsV1> nutritionFacts,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class _$FoodV1CopyWithImpl<$Res, $Val extends FoodV1>
    implements $FoodV1CopyWith<$Res> {
  _$FoodV1CopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodV1
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
              as List<NutritionFactsV1>,
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
abstract class _$$FoodV1ImplCopyWith<$Res> implements $FoodV1CopyWith<$Res> {
  factory _$$FoodV1ImplCopyWith(
          _$FoodV1Impl value, $Res Function(_$FoodV1Impl) then) =
      __$$FoodV1ImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String name,
      String description,
      List<NutritionFactsV1> nutritionFacts,
      DateTime? createdAt,
      DateTime? updatedAt});
}

/// @nodoc
class __$$FoodV1ImplCopyWithImpl<$Res>
    extends _$FoodV1CopyWithImpl<$Res, _$FoodV1Impl>
    implements _$$FoodV1ImplCopyWith<$Res> {
  __$$FoodV1ImplCopyWithImpl(
      _$FoodV1Impl _value, $Res Function(_$FoodV1Impl) _then)
      : super(_value, _then);

  /// Create a copy of FoodV1
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
    return _then(_$FoodV1Impl(
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
              as List<NutritionFactsV1>,
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
@JsonSerializable()
class _$FoodV1Impl extends _FoodV1 {
  const _$FoodV1Impl(
      {this.id,
      required this.name,
      required this.description,
      required final List<NutritionFactsV1> nutritionFacts,
      this.createdAt,
      this.updatedAt})
      : _nutritionFacts = nutritionFacts,
        super._();

  factory _$FoodV1Impl.fromJson(Map<String, dynamic> json) =>
      _$$FoodV1ImplFromJson(json);

  @override
  final String? id;
  @override
  final String name;
  @override
  final String description;
  final List<NutritionFactsV1> _nutritionFacts;
  @override
  List<NutritionFactsV1> get nutritionFacts {
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
    return 'FoodV1(id: $id, name: $name, description: $description, nutritionFacts: $nutritionFacts, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodV1Impl &&
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

  /// Create a copy of FoodV1
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodV1ImplCopyWith<_$FoodV1Impl> get copyWith =>
      __$$FoodV1ImplCopyWithImpl<_$FoodV1Impl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodV1ImplToJson(
      this,
    );
  }
}

abstract class _FoodV1 extends FoodV1 {
  const factory _FoodV1(
      {final String? id,
      required final String name,
      required final String description,
      required final List<NutritionFactsV1> nutritionFacts,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$FoodV1Impl;
  const _FoodV1._() : super._();

  factory _FoodV1.fromJson(Map<String, dynamic> json) = _$FoodV1Impl.fromJson;

  @override
  String? get id;
  @override
  String get name;
  @override
  String get description;
  @override
  List<NutritionFactsV1> get nutritionFacts;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of FoodV1
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodV1ImplCopyWith<_$FoodV1Impl> get copyWith =>
      throw _privateConstructorUsedError;
}
