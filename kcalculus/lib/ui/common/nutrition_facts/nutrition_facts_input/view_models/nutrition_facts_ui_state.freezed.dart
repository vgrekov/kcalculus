// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFactsUiState {
  Unit get perAmountUnit;
  double? get perAmountValue;
  List<NutrientAmountUiState> get nutrientAmounts;

  /// Create a copy of NutritionFactsUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NutritionFactsUiStateCopyWith<NutritionFactsUiState> get copyWith =>
      _$NutritionFactsUiStateCopyWithImpl<NutritionFactsUiState>(
          this as NutritionFactsUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NutritionFactsUiState &&
            (identical(other.perAmountUnit, perAmountUnit) ||
                other.perAmountUnit == perAmountUnit) &&
            (identical(other.perAmountValue, perAmountValue) ||
                other.perAmountValue == perAmountValue) &&
            const DeepCollectionEquality()
                .equals(other.nutrientAmounts, nutrientAmounts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, perAmountUnit, perAmountValue,
      const DeepCollectionEquality().hash(nutrientAmounts));

  @override
  String toString() {
    return 'NutritionFactsUiState(perAmountUnit: $perAmountUnit, perAmountValue: $perAmountValue, nutrientAmounts: $nutrientAmounts)';
  }
}

/// @nodoc
abstract mixin class $NutritionFactsUiStateCopyWith<$Res> {
  factory $NutritionFactsUiStateCopyWith(NutritionFactsUiState value,
          $Res Function(NutritionFactsUiState) _then) =
      _$NutritionFactsUiStateCopyWithImpl;
  @useResult
  $Res call(
      {Unit perAmountUnit,
      double? perAmountValue,
      List<NutrientAmountUiState> nutrientAmounts});
}

/// @nodoc
class _$NutritionFactsUiStateCopyWithImpl<$Res>
    implements $NutritionFactsUiStateCopyWith<$Res> {
  _$NutritionFactsUiStateCopyWithImpl(this._self, this._then);

  final NutritionFactsUiState _self;
  final $Res Function(NutritionFactsUiState) _then;

  /// Create a copy of NutritionFactsUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? perAmountUnit = null,
    Object? perAmountValue = freezed,
    Object? nutrientAmounts = null,
  }) {
    return _then(_self.copyWith(
      perAmountUnit: null == perAmountUnit
          ? _self.perAmountUnit
          : perAmountUnit // ignore: cast_nullable_to_non_nullable
              as Unit,
      perAmountValue: freezed == perAmountValue
          ? _self.perAmountValue
          : perAmountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      nutrientAmounts: null == nutrientAmounts
          ? _self.nutrientAmounts
          : nutrientAmounts // ignore: cast_nullable_to_non_nullable
              as List<NutrientAmountUiState>,
    ));
  }
}

/// @nodoc

class _NutritionFactsUiState extends NutritionFactsUiState {
  const _NutritionFactsUiState(
      {required this.perAmountUnit,
      this.perAmountValue,
      required final List<NutrientAmountUiState> nutrientAmounts})
      : _nutrientAmounts = nutrientAmounts,
        super._();

  @override
  final Unit perAmountUnit;
  @override
  final double? perAmountValue;
  final List<NutrientAmountUiState> _nutrientAmounts;
  @override
  List<NutrientAmountUiState> get nutrientAmounts {
    if (_nutrientAmounts is EqualUnmodifiableListView) return _nutrientAmounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutrientAmounts);
  }

  /// Create a copy of NutritionFactsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NutritionFactsUiStateCopyWith<_NutritionFactsUiState> get copyWith =>
      __$NutritionFactsUiStateCopyWithImpl<_NutritionFactsUiState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NutritionFactsUiState &&
            (identical(other.perAmountUnit, perAmountUnit) ||
                other.perAmountUnit == perAmountUnit) &&
            (identical(other.perAmountValue, perAmountValue) ||
                other.perAmountValue == perAmountValue) &&
            const DeepCollectionEquality()
                .equals(other._nutrientAmounts, _nutrientAmounts));
  }

  @override
  int get hashCode => Object.hash(runtimeType, perAmountUnit, perAmountValue,
      const DeepCollectionEquality().hash(_nutrientAmounts));

  @override
  String toString() {
    return 'NutritionFactsUiState._default(perAmountUnit: $perAmountUnit, perAmountValue: $perAmountValue, nutrientAmounts: $nutrientAmounts)';
  }
}

/// @nodoc
abstract mixin class _$NutritionFactsUiStateCopyWith<$Res>
    implements $NutritionFactsUiStateCopyWith<$Res> {
  factory _$NutritionFactsUiStateCopyWith(_NutritionFactsUiState value,
          $Res Function(_NutritionFactsUiState) _then) =
      __$NutritionFactsUiStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Unit perAmountUnit,
      double? perAmountValue,
      List<NutrientAmountUiState> nutrientAmounts});
}

/// @nodoc
class __$NutritionFactsUiStateCopyWithImpl<$Res>
    implements _$NutritionFactsUiStateCopyWith<$Res> {
  __$NutritionFactsUiStateCopyWithImpl(this._self, this._then);

  final _NutritionFactsUiState _self;
  final $Res Function(_NutritionFactsUiState) _then;

  /// Create a copy of NutritionFactsUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? perAmountUnit = null,
    Object? perAmountValue = freezed,
    Object? nutrientAmounts = null,
  }) {
    return _then(_NutritionFactsUiState(
      perAmountUnit: null == perAmountUnit
          ? _self.perAmountUnit
          : perAmountUnit // ignore: cast_nullable_to_non_nullable
              as Unit,
      perAmountValue: freezed == perAmountValue
          ? _self.perAmountValue
          : perAmountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      nutrientAmounts: null == nutrientAmounts
          ? _self._nutrientAmounts
          : nutrientAmounts // ignore: cast_nullable_to_non_nullable
              as List<NutrientAmountUiState>,
    ));
  }
}

// dart format on
