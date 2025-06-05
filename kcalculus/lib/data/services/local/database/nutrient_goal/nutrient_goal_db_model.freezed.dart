// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_goal_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NutrientGoalDbModel _$NutrientGoalDbModelFromJson(Map<String, dynamic> json) {
  return _NutrientGoalDbModel.fromJson(json);
}

/// @nodoc
mixin _$NutrientGoalDbModel {
  String get id => throw _privateConstructorUsedError;
  String get nutrient => throw _privateConstructorUsedError;
  String get amount_unit => throw _privateConstructorUsedError;
  double get amount_value => throw _privateConstructorUsedError;

  /// Serializes this NutrientGoalDbModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NutrientGoalDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NutrientGoalDbModelCopyWith<NutrientGoalDbModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NutrientGoalDbModelCopyWith<$Res> {
  factory $NutrientGoalDbModelCopyWith(
          NutrientGoalDbModel value, $Res Function(NutrientGoalDbModel) then) =
      _$NutrientGoalDbModelCopyWithImpl<$Res, NutrientGoalDbModel>;
  @useResult
  $Res call(
      {String id, String nutrient, String amount_unit, double amount_value});
}

/// @nodoc
class _$NutrientGoalDbModelCopyWithImpl<$Res, $Val extends NutrientGoalDbModel>
    implements $NutrientGoalDbModelCopyWith<$Res> {
  _$NutrientGoalDbModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NutrientGoalDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nutrient = null,
    Object? amount_unit = null,
    Object? amount_value = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NutrientGoalDbModelImplCopyWith<$Res>
    implements $NutrientGoalDbModelCopyWith<$Res> {
  factory _$$NutrientGoalDbModelImplCopyWith(_$NutrientGoalDbModelImpl value,
          $Res Function(_$NutrientGoalDbModelImpl) then) =
      __$$NutrientGoalDbModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, String nutrient, String amount_unit, double amount_value});
}

/// @nodoc
class __$$NutrientGoalDbModelImplCopyWithImpl<$Res>
    extends _$NutrientGoalDbModelCopyWithImpl<$Res, _$NutrientGoalDbModelImpl>
    implements _$$NutrientGoalDbModelImplCopyWith<$Res> {
  __$$NutrientGoalDbModelImplCopyWithImpl(_$NutrientGoalDbModelImpl _value,
      $Res Function(_$NutrientGoalDbModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NutrientGoalDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? nutrient = null,
    Object? amount_unit = null,
    Object? amount_value = null,
  }) {
    return _then(_$NutrientGoalDbModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NutrientGoalDbModelImpl implements _NutrientGoalDbModel {
  const _$NutrientGoalDbModelImpl(
      {required this.id,
      required this.nutrient,
      required this.amount_unit,
      required this.amount_value});

  factory _$NutrientGoalDbModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NutrientGoalDbModelImplFromJson(json);

  @override
  final String id;
  @override
  final String nutrient;
  @override
  final String amount_unit;
  @override
  final double amount_value;

  @override
  String toString() {
    return 'NutrientGoalDbModel(id: $id, nutrient: $nutrient, amount_unit: $amount_unit, amount_value: $amount_value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NutrientGoalDbModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            (identical(other.amount_unit, amount_unit) ||
                other.amount_unit == amount_unit) &&
            (identical(other.amount_value, amount_value) ||
                other.amount_value == amount_value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, nutrient, amount_unit, amount_value);

  /// Create a copy of NutrientGoalDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NutrientGoalDbModelImplCopyWith<_$NutrientGoalDbModelImpl> get copyWith =>
      __$$NutrientGoalDbModelImplCopyWithImpl<_$NutrientGoalDbModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NutrientGoalDbModelImplToJson(
      this,
    );
  }
}

abstract class _NutrientGoalDbModel implements NutrientGoalDbModel {
  const factory _NutrientGoalDbModel(
      {required final String id,
      required final String nutrient,
      required final String amount_unit,
      required final double amount_value}) = _$NutrientGoalDbModelImpl;

  factory _NutrientGoalDbModel.fromJson(Map<String, dynamic> json) =
      _$NutrientGoalDbModelImpl.fromJson;

  @override
  String get id;
  @override
  String get nutrient;
  @override
  String get amount_unit;
  @override
  double get amount_value;

  /// Create a copy of NutrientGoalDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NutrientGoalDbModelImplCopyWith<_$NutrientGoalDbModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
