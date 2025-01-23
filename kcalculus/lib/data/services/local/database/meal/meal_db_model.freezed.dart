// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MealDbModel _$MealDbModelFromJson(Map<String, dynamic> json) {
  return _MealDbModel.fromJson(json);
}

/// @nodoc
mixin _$MealDbModel {
  String get id => throw _privateConstructorUsedError;
  String get edible_id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get edible_food_id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get edible_dish_id => throw _privateConstructorUsedError;
  String get amount_unit => throw _privateConstructorUsedError;
  double get amount_value => throw _privateConstructorUsedError;
  String get eaten_at => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get deleted_at => throw _privateConstructorUsedError;

  /// Serializes this MealDbModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MealDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MealDbModelCopyWith<MealDbModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealDbModelCopyWith<$Res> {
  factory $MealDbModelCopyWith(
          MealDbModel value, $Res Function(MealDbModel) then) =
      _$MealDbModelCopyWithImpl<$Res, MealDbModel>;
  @useResult
  $Res call(
      {String id,
      String edible_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? edible_food_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? edible_dish_id,
      String amount_unit,
      double amount_value,
      String eaten_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class _$MealDbModelCopyWithImpl<$Res, $Val extends MealDbModel>
    implements $MealDbModelCopyWith<$Res> {
  _$MealDbModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MealDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? edible_id = null,
    Object? edible_food_id = freezed,
    Object? edible_dish_id = freezed,
    Object? amount_unit = null,
    Object? amount_value = null,
    Object? eaten_at = null,
    Object? deleted_at = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      eaten_at: null == eaten_at
          ? _value.eaten_at
          : eaten_at // ignore: cast_nullable_to_non_nullable
              as String,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MealDbModelImplCopyWith<$Res>
    implements $MealDbModelCopyWith<$Res> {
  factory _$$MealDbModelImplCopyWith(
          _$MealDbModelImpl value, $Res Function(_$MealDbModelImpl) then) =
      __$$MealDbModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String edible_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? edible_food_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? edible_dish_id,
      String amount_unit,
      double amount_value,
      String eaten_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      String? deleted_at});
}

/// @nodoc
class __$$MealDbModelImplCopyWithImpl<$Res>
    extends _$MealDbModelCopyWithImpl<$Res, _$MealDbModelImpl>
    implements _$$MealDbModelImplCopyWith<$Res> {
  __$$MealDbModelImplCopyWithImpl(
      _$MealDbModelImpl _value, $Res Function(_$MealDbModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MealDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? edible_id = null,
    Object? edible_food_id = freezed,
    Object? edible_dish_id = freezed,
    Object? amount_unit = null,
    Object? amount_value = null,
    Object? eaten_at = null,
    Object? deleted_at = freezed,
  }) {
    return _then(_$MealDbModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
      eaten_at: null == eaten_at
          ? _value.eaten_at
          : eaten_at // ignore: cast_nullable_to_non_nullable
              as String,
      deleted_at: freezed == deleted_at
          ? _value.deleted_at
          : deleted_at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MealDbModelImpl implements _MealDbModel {
  _$MealDbModelImpl(
      {required this.id,
      required this.edible_id,
      @JsonKey(includeToJson: false, includeFromJson: true) this.edible_food_id,
      @JsonKey(includeToJson: false, includeFromJson: true) this.edible_dish_id,
      required this.amount_unit,
      required this.amount_value,
      required this.eaten_at,
      @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at});

  factory _$MealDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MealDbModelImplFromJson(json);

  @override
  final String id;
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
  final String eaten_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  final String? deleted_at;

  @override
  String toString() {
    return 'MealDbModel(id: $id, edible_id: $edible_id, edible_food_id: $edible_food_id, edible_dish_id: $edible_dish_id, amount_unit: $amount_unit, amount_value: $amount_value, eaten_at: $eaten_at, deleted_at: $deleted_at)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MealDbModelImpl &&
            (identical(other.id, id) || other.id == id) &&
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
            (identical(other.eaten_at, eaten_at) ||
                other.eaten_at == eaten_at) &&
            (identical(other.deleted_at, deleted_at) ||
                other.deleted_at == deleted_at));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, edible_id, edible_food_id,
      edible_dish_id, amount_unit, amount_value, eaten_at, deleted_at);

  /// Create a copy of MealDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MealDbModelImplCopyWith<_$MealDbModelImpl> get copyWith =>
      __$$MealDbModelImplCopyWithImpl<_$MealDbModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MealDbModelImplToJson(
      this,
    );
  }
}

abstract class _MealDbModel implements MealDbModel {
  factory _MealDbModel(
      {required final String id,
      required final String edible_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? edible_food_id,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? edible_dish_id,
      required final String amount_unit,
      required final double amount_value,
      required final String eaten_at,
      @JsonKey(includeToJson: false, includeFromJson: true)
      final String? deleted_at}) = _$MealDbModelImpl;

  factory _MealDbModel.fromJson(Map<String, dynamic> json) =
      _$MealDbModelImpl.fromJson;

  @override
  String get id;
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
  @override
  String get eaten_at;
  @override
  @JsonKey(includeToJson: false, includeFromJson: true)
  String? get deleted_at;

  /// Create a copy of MealDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MealDbModelImplCopyWith<_$MealDbModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
