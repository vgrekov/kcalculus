// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_goal_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientGoalDbModel {
  String get id;
  String get nutrient;
  String get amount_unit;
  double get amount_value;

  /// Create a copy of NutrientGoalDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutrientGoalDbModelCopyWith<NutrientGoalDbModel> get copyWith =>
      _$NutrientGoalDbModelCopyWithImpl<NutrientGoalDbModel>(
          this as NutrientGoalDbModel, _$identity);

  /// Serializes this NutrientGoalDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutrientGoalDbModel &&
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

  @override
  String toString() {
    return 'NutrientGoalDbModel(id: $id, nutrient: $nutrient, amount_unit: $amount_unit, amount_value: $amount_value)';
  }
}

/// @nodoc
abstract mixin class $NutrientGoalDbModelCopyWith<$Res> {
  factory $NutrientGoalDbModelCopyWith(
          NutrientGoalDbModel value, $Res Function(NutrientGoalDbModel) _then) =
      _$NutrientGoalDbModelCopyWithImpl;
  @useResult
  $Res call(
      {String id, String nutrient, String amount_unit, double amount_value});
}

/// @nodoc
class _$NutrientGoalDbModelCopyWithImpl<$Res>
    implements $NutrientGoalDbModelCopyWith<$Res> {
  _$NutrientGoalDbModelCopyWithImpl(this._self, this._then);

  final NutrientGoalDbModel _self;
  final $Res Function(NutrientGoalDbModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nutrient: null == nutrient
          ? _self.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as String,
      amount_unit: null == amount_unit
          ? _self.amount_unit
          : amount_unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount_value: null == amount_value
          ? _self.amount_value
          : amount_value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NutrientGoalDbModel implements NutrientGoalDbModel {
  const _NutrientGoalDbModel(
      {required this.id,
      required this.nutrient,
      required this.amount_unit,
      required this.amount_value});
  factory _NutrientGoalDbModel.fromJson(Map<String, dynamic> json) =>
      _$NutrientGoalDbModelFromJson(json);

  @override
  final String id;
  @override
  final String nutrient;
  @override
  final String amount_unit;
  @override
  final double amount_value;

  /// Create a copy of NutrientGoalDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutrientGoalDbModelCopyWith<_NutrientGoalDbModel> get copyWith =>
      __$NutrientGoalDbModelCopyWithImpl<_NutrientGoalDbModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NutrientGoalDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutrientGoalDbModel &&
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

  @override
  String toString() {
    return 'NutrientGoalDbModel(id: $id, nutrient: $nutrient, amount_unit: $amount_unit, amount_value: $amount_value)';
  }
}

/// @nodoc
abstract mixin class _$NutrientGoalDbModelCopyWith<$Res>
    implements $NutrientGoalDbModelCopyWith<$Res> {
  factory _$NutrientGoalDbModelCopyWith(_NutrientGoalDbModel value,
          $Res Function(_NutrientGoalDbModel) _then) =
      __$NutrientGoalDbModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id, String nutrient, String amount_unit, double amount_value});
}

/// @nodoc
class __$NutrientGoalDbModelCopyWithImpl<$Res>
    implements _$NutrientGoalDbModelCopyWith<$Res> {
  __$NutrientGoalDbModelCopyWithImpl(this._self, this._then);

  final _NutrientGoalDbModel _self;
  final $Res Function(_NutrientGoalDbModel) _then;

  /// Create a copy of NutrientGoalDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? nutrient = null,
    Object? amount_unit = null,
    Object? amount_value = null,
  }) {
    return _then(_NutrientGoalDbModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      nutrient: null == nutrient
          ? _self.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as String,
      amount_unit: null == amount_unit
          ? _self.amount_unit
          : amount_unit // ignore: cast_nullable_to_non_nullable
              as String,
      amount_value: null == amount_value
          ? _self.amount_value
          : amount_value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
