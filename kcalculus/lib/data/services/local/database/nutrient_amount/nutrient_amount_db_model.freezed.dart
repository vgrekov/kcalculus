// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_amount_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutrientAmountDbModel _$NutrientAmountDbModelFromJson(
    Map<String, dynamic> json) {
  return _NutrientAmountDbModel.fromJson(json);
}

/// @nodoc
mixin _$NutrientAmountDbModel {
  String get nutrition_facts_id => throw _privateConstructorUsedError;
  String get nutrient => throw _privateConstructorUsedError;
  String get amount_unit => throw _privateConstructorUsedError;
  double get amount_value => throw _privateConstructorUsedError;
  int get position => throw _privateConstructorUsedError;

  /// Serializes this NutrientAmountDbModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutrientAmountDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutrientAmountDbModelCopyWith<NutrientAmountDbModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientAmountDbModelCopyWith<$Res> {
  factory $NutrientAmountDbModelCopyWith(NutrientAmountDbModel value,
          $Res Function(NutrientAmountDbModel) then) =
      _$NutrientAmountDbModelCopyWithImpl<$Res, NutrientAmountDbModel>;
  @useResult
  $Res call(
      {String nutrition_facts_id,
      String nutrient,
      String amount_unit,
      double amount_value,
      int position});
}

/// @nodoc
class _$NutrientAmountDbModelCopyWithImpl<$Res,
        $Val extends NutrientAmountDbModel>
    implements $NutrientAmountDbModelCopyWith<$Res> {
  _$NutrientAmountDbModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutrientAmountDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrition_facts_id = null,
    Object? nutrient = null,
    Object? amount_unit = null,
    Object? amount_value = null,
    Object? position = null,
  }) {
    return _then(_value.copyWith(
      nutrition_facts_id: null == nutrition_facts_id
          ? _value.nutrition_facts_id
          : nutrition_facts_id // ignore: cast_nullable_to_non_nullable
              as String,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as String,
      amount_unit: null == amount_unit
          ? _value.amount_unit
          : amount_unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount_value: null == amount_value
          ? _value.amount_value
          : amount_value // ignore: cast_nullable_to_non_nullable
              as double,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutrientAmountDbModelImplCopyWith<$Res>
    implements $NutrientAmountDbModelCopyWith<$Res> {
  factory _$$NutrientAmountDbModelImplCopyWith(
          _$NutrientAmountDbModelImpl value,
          $Res Function(_$NutrientAmountDbModelImpl) then) =
      __$$NutrientAmountDbModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nutrition_facts_id,
      String nutrient,
      String amount_unit,
      double amount_value,
      int position});
}

/// @nodoc
class __$$NutrientAmountDbModelImplCopyWithImpl<$Res>
    extends _$NutrientAmountDbModelCopyWithImpl<$Res,
        _$NutrientAmountDbModelImpl>
    implements _$$NutrientAmountDbModelImplCopyWith<$Res> {
  __$$NutrientAmountDbModelImplCopyWithImpl(_$NutrientAmountDbModelImpl _value,
      $Res Function(_$NutrientAmountDbModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutrientAmountDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrition_facts_id = null,
    Object? nutrient = null,
    Object? amount_unit = null,
    Object? amount_value = null,
    Object? position = null,
  }) {
    return _then(_$NutrientAmountDbModelImpl(
      nutrition_facts_id: null == nutrition_facts_id
          ? _value.nutrition_facts_id
          : nutrition_facts_id // ignore: cast_nullable_to_non_nullable
              as String,
      nutrient: null == nutrient
          ? _value.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as String,
      amount_unit: null == amount_unit
          ? _value.amount_unit
          : amount_unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount_value: null == amount_value
          ? _value.amount_value
          : amount_value // ignore: cast_nullable_to_non_nullable
              as double,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutrientAmountDbModelImpl implements _NutrientAmountDbModel {
  _$NutrientAmountDbModelImpl(
      {required this.nutrition_facts_id,
      required this.nutrient,
      required this.amount_unit,
      required this.amount_value,
      required this.position});

  factory _$NutrientAmountDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutrientAmountDbModelImplFromJson(json);

  @override
  final String nutrition_facts_id;
  @override
  final String nutrient;
  @override
  final String amount_unit;
  @override
  final double amount_value;
  @override
  final int position;

  @override
  String toString() {
    return 'NutrientAmountDbModel(nutrition_facts_id: $nutrition_facts_id, nutrient: $nutrient, amount_unit: $amount_unit, amount_value: $amount_value, position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientAmountDbModelImpl &&
            (identical(other.nutrition_facts_id, nutrition_facts_id) ||
                other.nutrition_facts_id == nutrition_facts_id) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            (identical(other.amount_unit, amount_unit) ||
                other.amount_unit == amount_unit) &&
            (identical(other.amount_value, amount_value) ||
                other.amount_value == amount_value) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nutrition_facts_id, nutrient,
      amount_unit, amount_value, position);

  /// Create a copy of NutrientAmountDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutrientAmountDbModelImplCopyWith<_$NutrientAmountDbModelImpl>
      get copyWith => __$$NutrientAmountDbModelImplCopyWithImpl<
          _$NutrientAmountDbModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutrientAmountDbModelImplToJson(
      this,
    );
  }
}

abstract class _NutrientAmountDbModel implements NutrientAmountDbModel {
  factory _NutrientAmountDbModel(
      {required final String nutrition_facts_id,
      required final String nutrient,
      required final String amount_unit,
      required final double amount_value,
      required final int position}) = _$NutrientAmountDbModelImpl;

  factory _NutrientAmountDbModel.fromJson(Map<String, dynamic> json) =
      _$NutrientAmountDbModelImpl.fromJson;

  @override
  String get nutrition_facts_id;
  @override
  String get nutrient;
  @override
  String get amount_unit;
  @override
  double get amount_value;
  @override
  int get position;

  /// Create a copy of NutrientAmountDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientAmountDbModelImplCopyWith<_$NutrientAmountDbModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
