// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

IngredientDbModel _$IngredientDbModelFromJson(Map<String, dynamic> json) {
  return _IngredientDbModel.fromJson(json);
}

/// @nodoc
mixin _$IngredientDbModel {
  String get dish_id => throw _privateConstructorUsedError;
  String get edible_id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get edible_food_id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get edible_dish_id => throw _privateConstructorUsedError;
  String get amount_unit => throw _privateConstructorUsedError;
  double get amount_value => throw _privateConstructorUsedError;

  /// Serializes this IngredientDbModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IngredientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IngredientDbModelCopyWith<IngredientDbModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientDbModelCopyWith<$Res> {
  factory $IngredientDbModelCopyWith(
          IngredientDbModel value, $Res Function(IngredientDbModel) then) =
      _$IngredientDbModelCopyWithImpl<$Res, IngredientDbModel>;
  @useResult
  $Res call(
      {String dish_id,
      String edible_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? edible_food_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? edible_dish_id,
      String amount_unit,
      double amount_value});
}

/// @nodoc
class _$IngredientDbModelCopyWithImpl<$Res, $Val extends IngredientDbModel>
    implements $IngredientDbModelCopyWith<$Res> {
  _$IngredientDbModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IngredientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dish_id = null,
    Object? edible_id = null,
    Object? edible_food_id = freezed,
    Object? edible_dish_id = freezed,
    Object? amount_unit = null,
    Object? amount_value = null,
  }) {
    return _then(_value.copyWith(
      dish_id: null == dish_id
          ? _value.dish_id
          : dish_id // ignore: cast_nullable_to_non_nullable
              as String,
      edible_id: null == edible_id
          ? _value.edible_id
          : edible_id // ignore: cast_nullable_to_non_nullable
              as String,
      edible_food_id: freezed == edible_food_id
          ? _value.edible_food_id
          : edible_food_id // ignore: cast_nullable_to_non_nullable
              as String?,
      edible_dish_id: freezed == edible_dish_id
          ? _value.edible_dish_id
          : edible_dish_id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount_unit: null == amount_unit
          ? _value.amount_unit
          : amount_unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount_value: null == amount_value
          ? _value.amount_value
          : amount_value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IngredientDbModelImplCopyWith<$Res>
    implements $IngredientDbModelCopyWith<$Res> {
  factory _$$IngredientDbModelImplCopyWith(_$IngredientDbModelImpl value,
          $Res Function(_$IngredientDbModelImpl) then) =
      __$$IngredientDbModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dish_id,
      String edible_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? edible_food_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? edible_dish_id,
      String amount_unit,
      double amount_value});
}

/// @nodoc
class __$$IngredientDbModelImplCopyWithImpl<$Res>
    extends _$IngredientDbModelCopyWithImpl<$Res, _$IngredientDbModelImpl>
    implements _$$IngredientDbModelImplCopyWith<$Res> {
  __$$IngredientDbModelImplCopyWithImpl(_$IngredientDbModelImpl _value,
      $Res Function(_$IngredientDbModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of IngredientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dish_id = null,
    Object? edible_id = null,
    Object? edible_food_id = freezed,
    Object? edible_dish_id = freezed,
    Object? amount_unit = null,
    Object? amount_value = null,
  }) {
    return _then(_$IngredientDbModelImpl(
      dish_id: null == dish_id
          ? _value.dish_id
          : dish_id // ignore: cast_nullable_to_non_nullable
              as String,
      edible_id: null == edible_id
          ? _value.edible_id
          : edible_id // ignore: cast_nullable_to_non_nullable
              as String,
      edible_food_id: freezed == edible_food_id
          ? _value.edible_food_id
          : edible_food_id // ignore: cast_nullable_to_non_nullable
              as String?,
      edible_dish_id: freezed == edible_dish_id
          ? _value.edible_dish_id
          : edible_dish_id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount_unit: null == amount_unit
          ? _value.amount_unit
          : amount_unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount_value: null == amount_value
          ? _value.amount_value
          : amount_value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IngredientDbModelImpl implements _IngredientDbModel {
  _$IngredientDbModelImpl(
      {required this.dish_id,
      required this.edible_id,
      @JsonKey(includeToJson: false, includeFromJson: true) this.edible_food_id,
      @JsonKey(includeToJson: false, includeFromJson: true) this.edible_dish_id,
      required this.amount_unit,
      required this.amount_value});

  factory _$IngredientDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$IngredientDbModelImplFromJson(json);

  @override
  final String dish_id;
  @override
  final String edible_id;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? edible_food_id;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? edible_dish_id;
  @override
  final String amount_unit;
  @override
  final double amount_value;

  @override
  String toString() {
    return 'IngredientDbModel(dish_id: $dish_id, edible_id: $edible_id, edible_food_id: $edible_food_id, edible_dish_id: $edible_dish_id, amount_unit: $amount_unit, amount_value: $amount_value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IngredientDbModelImpl &&
            (identical(other.dish_id, dish_id) || other.dish_id == dish_id) &&
            (identical(other.edible_id, edible_id) ||
                other.edible_id == edible_id) &&
            (identical(other.edible_food_id, edible_food_id) ||
                other.edible_food_id == edible_food_id) &&
            (identical(other.edible_dish_id, edible_dish_id) ||
                other.edible_dish_id == edible_dish_id) &&
            (identical(other.amount_unit, amount_unit) ||
                other.amount_unit == amount_unit) &&
            (identical(other.amount_value, amount_value) ||
                other.amount_value == amount_value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, dish_id, edible_id,
      edible_food_id, edible_dish_id, amount_unit, amount_value);

  /// Create a copy of IngredientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IngredientDbModelImplCopyWith<_$IngredientDbModelImpl> get copyWith =>
      __$$IngredientDbModelImplCopyWithImpl<_$IngredientDbModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IngredientDbModelImplToJson(
      this,
    );
  }
}

abstract class _IngredientDbModel implements IngredientDbModel {
  factory _IngredientDbModel(
      {required final String dish_id,
      required final String edible_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? edible_food_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? edible_dish_id,
      required final String amount_unit,
      required final double amount_value}) = _$IngredientDbModelImpl;

  factory _IngredientDbModel.fromJson(Map<String, dynamic> json) =
      _$IngredientDbModelImpl.fromJson;

  @override
  String get dish_id;
  @override
  String get edible_id;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get edible_food_id;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get edible_dish_id;
  @override
  String get amount_unit;
  @override
  double get amount_value;

  /// Create a copy of IngredientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IngredientDbModelImplCopyWith<_$IngredientDbModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
