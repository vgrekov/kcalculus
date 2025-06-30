// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_amount_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientAmountUiState {
  Nutrient get nutrient;
  Unit get unit;
  double? get value;

  /// Create a copy of NutrientAmountUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutrientAmountUiStateCopyWith<NutrientAmountUiState> get copyWith =>
      _$NutrientAmountUiStateCopyWithImpl<NutrientAmountUiState>(
          this as NutrientAmountUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutrientAmountUiState &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nutrient, unit, value);

  @override
  String toString() {
    return 'NutrientAmountUiState(nutrient: $nutrient, unit: $unit, value: $value)';
  }
}

/// @nodoc
abstract mixin class $NutrientAmountUiStateCopyWith<$Res> {
  factory $NutrientAmountUiStateCopyWith(NutrientAmountUiState value,
          $Res Function(NutrientAmountUiState) _then) =
      _$NutrientAmountUiStateCopyWithImpl;
  @useResult
  $Res call({Nutrient nutrient, Unit unit, double? value});
}

/// @nodoc
class _$NutrientAmountUiStateCopyWithImpl<$Res>
    implements $NutrientAmountUiStateCopyWith<$Res> {
  _$NutrientAmountUiStateCopyWithImpl(this._self, this._then);

  final NutrientAmountUiState _self;
  final $Res Function(NutrientAmountUiState) _then;

  /// Create a copy of NutrientAmountUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutrient = null,
    Object? unit = null,
    Object? value = freezed,
  }) {
    return _then(_self.copyWith(
      nutrient: null == nutrient
          ? _self.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _NutrientAmountUiState extends NutrientAmountUiState {
  const _NutrientAmountUiState(
      {required this.nutrient, required this.unit, this.value})
      : super._();

  @override
  final Nutrient nutrient;
  @override
  final Unit unit;
  @override
  final double? value;

  /// Create a copy of NutrientAmountUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutrientAmountUiStateCopyWith<_NutrientAmountUiState> get copyWith =>
      __$NutrientAmountUiStateCopyWithImpl<_NutrientAmountUiState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutrientAmountUiState &&
            (identical(other.nutrient, nutrient) ||
                other.nutrient == nutrient) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nutrient, unit, value);

  @override
  String toString() {
    return 'NutrientAmountUiState._default(nutrient: $nutrient, unit: $unit, value: $value)';
  }
}

/// @nodoc
abstract mixin class _$NutrientAmountUiStateCopyWith<$Res>
    implements $NutrientAmountUiStateCopyWith<$Res> {
  factory _$NutrientAmountUiStateCopyWith(_NutrientAmountUiState value,
          $Res Function(_NutrientAmountUiState) _then) =
      __$NutrientAmountUiStateCopyWithImpl;
  @override
  @useResult
  $Res call({Nutrient nutrient, Unit unit, double? value});
}

/// @nodoc
class __$NutrientAmountUiStateCopyWithImpl<$Res>
    implements _$NutrientAmountUiStateCopyWith<$Res> {
  __$NutrientAmountUiStateCopyWithImpl(this._self, this._then);

  final _NutrientAmountUiState _self;
  final $Res Function(_NutrientAmountUiState) _then;

  /// Create a copy of NutrientAmountUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nutrient = null,
    Object? unit = null,
    Object? value = freezed,
  }) {
    return _then(_NutrientAmountUiState(
      nutrient: null == nutrient
          ? _self.nutrient
          : nutrient // ignore: cast_nullable_to_non_nullable
              as Nutrient,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      value: freezed == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

// dart format on
