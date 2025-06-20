// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientDbModel {
  String get dish_id;
  String get edible_id;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get edible_food_id;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get edible_dish_id;
  String get amount_unit;
  double get amount_value;
  @JsonKey(includeToJson: true, includeFromJson: false)
  int? get sequence_number;

  /// Create a copy of IngredientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $IngredientDbModelCopyWith<IngredientDbModel> get copyWith =>
      _$IngredientDbModelCopyWithImpl<IngredientDbModel>(
          this as IngredientDbModel, _$identity);

  /// Serializes this IngredientDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is IngredientDbModel &&
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
                other.amount_value == amount_value) &&
            (identical(other.sequence_number, sequence_number) ||
                other.sequence_number == sequence_number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dish_id,
      edible_id,
      edible_food_id,
      edible_dish_id,
      amount_unit,
      amount_value,
      sequence_number);

  @override
  String toString() {
    return 'IngredientDbModel(dish_id: $dish_id, edible_id: $edible_id, edible_food_id: $edible_food_id, edible_dish_id: $edible_dish_id, amount_unit: $amount_unit, amount_value: $amount_value, sequence_number: $sequence_number)';
  }
}

/// @nodoc
abstract mixin class $IngredientDbModelCopyWith<$Res> {
  factory $IngredientDbModelCopyWith(
          IngredientDbModel value, $Res Function(IngredientDbModel) _then) =
      _$IngredientDbModelCopyWithImpl;
  @useResult
  $Res call(
      {String dish_id,
      String edible_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? edible_food_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? edible_dish_id,
      String amount_unit,
      double amount_value,
      @JsonKey(includeToJson: true, includeFromJson: false)
      int? sequence_number});
}

/// @nodoc
class _$IngredientDbModelCopyWithImpl<$Res>
    implements $IngredientDbModelCopyWith<$Res> {
  _$IngredientDbModelCopyWithImpl(this._self, this._then);

  final IngredientDbModel _self;
  final $Res Function(IngredientDbModel) _then;

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
    Object? sequence_number = freezed,
  }) {
    return _then(_self.copyWith(
      dish_id: null == dish_id
          ? _self.dish_id
          : dish_id // ignore: cast_nullable_to_non_nullable
              as String,
      edible_id: null == edible_id
          ? _self.edible_id
          : edible_id // ignore: cast_nullable_to_non_nullable
              as String,
      edible_food_id: freezed == edible_food_id
          ? _self.edible_food_id
          : edible_food_id // ignore: cast_nullable_to_non_nullable
              as String?,
      edible_dish_id: freezed == edible_dish_id
          ? _self.edible_dish_id
          : edible_dish_id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount_unit: null == amount_unit
          ? _self.amount_unit
          : amount_unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount_value: null == amount_value
          ? _self.amount_value
          : amount_value // ignore: cast_nullable_to_non_nullable
              as double,
      sequence_number: freezed == sequence_number
          ? _self.sequence_number
          : sequence_number // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _IngredientDbModel implements IngredientDbModel {
  _IngredientDbModel(
      {required this.dish_id,
      required this.edible_id,
      @JsonKey(includeToJson: false, includeFromJson: true) this.edible_food_id,
      @JsonKey(includeToJson: false, includeFromJson: true) this.edible_dish_id,
      required this.amount_unit,
      required this.amount_value,
      @JsonKey(includeToJson: true, includeFromJson: false)
      this.sequence_number});
  factory _IngredientDbModel.fromJson(Map<String, dynamic> json) =>
      _$IngredientDbModelFromJson(json);

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
  @JsonKey(includeToJson: true, includeFromJson: false)
  final int? sequence_number;

  /// Create a copy of IngredientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$IngredientDbModelCopyWith<_IngredientDbModel> get copyWith =>
      __$IngredientDbModelCopyWithImpl<_IngredientDbModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$IngredientDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _IngredientDbModel &&
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
                other.amount_value == amount_value) &&
            (identical(other.sequence_number, sequence_number) ||
                other.sequence_number == sequence_number));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      dish_id,
      edible_id,
      edible_food_id,
      edible_dish_id,
      amount_unit,
      amount_value,
      sequence_number);

  @override
  String toString() {
    return 'IngredientDbModel(dish_id: $dish_id, edible_id: $edible_id, edible_food_id: $edible_food_id, edible_dish_id: $edible_dish_id, amount_unit: $amount_unit, amount_value: $amount_value, sequence_number: $sequence_number)';
  }
}

/// @nodoc
abstract mixin class _$IngredientDbModelCopyWith<$Res>
    implements $IngredientDbModelCopyWith<$Res> {
  factory _$IngredientDbModelCopyWith(
          _IngredientDbModel value, $Res Function(_IngredientDbModel) _then) =
      __$IngredientDbModelCopyWithImpl;
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
      double amount_value,
      @JsonKey(includeToJson: true, includeFromJson: false)
      int? sequence_number});
}

/// @nodoc
class __$IngredientDbModelCopyWithImpl<$Res>
    implements _$IngredientDbModelCopyWith<$Res> {
  __$IngredientDbModelCopyWithImpl(this._self, this._then);

  final _IngredientDbModel _self;
  final $Res Function(_IngredientDbModel) _then;

  /// Create a copy of IngredientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? dish_id = null,
    Object? edible_id = null,
    Object? edible_food_id = freezed,
    Object? edible_dish_id = freezed,
    Object? amount_unit = null,
    Object? amount_value = null,
    Object? sequence_number = freezed,
  }) {
    return _then(_IngredientDbModel(
      dish_id: null == dish_id
          ? _self.dish_id
          : dish_id // ignore: cast_nullable_to_non_nullable
              as String,
      edible_id: null == edible_id
          ? _self.edible_id
          : edible_id // ignore: cast_nullable_to_non_nullable
              as String,
      edible_food_id: freezed == edible_food_id
          ? _self.edible_food_id
          : edible_food_id // ignore: cast_nullable_to_non_nullable
              as String?,
      edible_dish_id: freezed == edible_dish_id
          ? _self.edible_dish_id
          : edible_dish_id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount_unit: null == amount_unit
          ? _self.amount_unit
          : amount_unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount_value: null == amount_value
          ? _self.amount_value
          : amount_value // ignore: cast_nullable_to_non_nullable
              as double,
      sequence_number: freezed == sequence_number
          ? _self.sequence_number
          : sequence_number // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

// dart format on
