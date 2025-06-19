// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usda_nutrient_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsdaNutrientDbModel {
  int get fdc_id;
  String get number;
  double get amount;
  String get unit_name;

  /// Create a copy of UsdaNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UsdaNutrientDbModelCopyWith<UsdaNutrientDbModel> get copyWith =>
      _$UsdaNutrientDbModelCopyWithImpl<UsdaNutrientDbModel>(
          this as UsdaNutrientDbModel, _$identity);

  /// Serializes this UsdaNutrientDbModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UsdaNutrientDbModel &&
            (identical(other.fdc_id, fdc_id) || other.fdc_id == fdc_id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.unit_name, unit_name) ||
                other.unit_name == unit_name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fdc_id, number, amount, unit_name);

  @override
  String toString() {
    return 'UsdaNutrientDbModel(fdc_id: $fdc_id, number: $number, amount: $amount, unit_name: $unit_name)';
  }
}

/// @nodoc
abstract mixin class $UsdaNutrientDbModelCopyWith<$Res> {
  factory $UsdaNutrientDbModelCopyWith(
          UsdaNutrientDbModel value, $Res Function(UsdaNutrientDbModel) _then) =
      _$UsdaNutrientDbModelCopyWithImpl;
  @useResult
  $Res call({int fdc_id, String number, double amount, String unit_name});
}

/// @nodoc
class _$UsdaNutrientDbModelCopyWithImpl<$Res>
    implements $UsdaNutrientDbModelCopyWith<$Res> {
  _$UsdaNutrientDbModelCopyWithImpl(this._self, this._then);

  final UsdaNutrientDbModel _self;
  final $Res Function(UsdaNutrientDbModel) _then;

  /// Create a copy of UsdaNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fdc_id = null,
    Object? number = null,
    Object? amount = null,
    Object? unit_name = null,
  }) {
    return _then(_self.copyWith(
      fdc_id: null == fdc_id
          ? _self.fdc_id
          : fdc_id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      unit_name: null == unit_name
          ? _self.unit_name
          : unit_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UsdaNutrientDbModel implements UsdaNutrientDbModel {
  const _UsdaNutrientDbModel(
      {required this.fdc_id,
      required this.number,
      required this.amount,
      required this.unit_name});
  factory _UsdaNutrientDbModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaNutrientDbModelFromJson(json);

  @override
  final int fdc_id;
  @override
  final String number;
  @override
  final double amount;
  @override
  final String unit_name;

  /// Create a copy of UsdaNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UsdaNutrientDbModelCopyWith<_UsdaNutrientDbModel> get copyWith =>
      __$UsdaNutrientDbModelCopyWithImpl<_UsdaNutrientDbModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UsdaNutrientDbModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UsdaNutrientDbModel &&
            (identical(other.fdc_id, fdc_id) || other.fdc_id == fdc_id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.unit_name, unit_name) ||
                other.unit_name == unit_name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fdc_id, number, amount, unit_name);

  @override
  String toString() {
    return 'UsdaNutrientDbModel(fdc_id: $fdc_id, number: $number, amount: $amount, unit_name: $unit_name)';
  }
}

/// @nodoc
abstract mixin class _$UsdaNutrientDbModelCopyWith<$Res>
    implements $UsdaNutrientDbModelCopyWith<$Res> {
  factory _$UsdaNutrientDbModelCopyWith(_UsdaNutrientDbModel value,
          $Res Function(_UsdaNutrientDbModel) _then) =
      __$UsdaNutrientDbModelCopyWithImpl;
  @override
  @useResult
  $Res call({int fdc_id, String number, double amount, String unit_name});
}

/// @nodoc
class __$UsdaNutrientDbModelCopyWithImpl<$Res>
    implements _$UsdaNutrientDbModelCopyWith<$Res> {
  __$UsdaNutrientDbModelCopyWithImpl(this._self, this._then);

  final _UsdaNutrientDbModel _self;
  final $Res Function(_UsdaNutrientDbModel) _then;

  /// Create a copy of UsdaNutrientDbModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fdc_id = null,
    Object? number = null,
    Object? amount = null,
    Object? unit_name = null,
  }) {
    return _then(_UsdaNutrientDbModel(
      fdc_id: null == fdc_id
          ? _self.fdc_id
          : fdc_id // ignore: cast_nullable_to_non_nullable
              as int,
      number: null == number
          ? _self.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      unit_name: null == unit_name
          ? _self.unit_name
          : unit_name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
