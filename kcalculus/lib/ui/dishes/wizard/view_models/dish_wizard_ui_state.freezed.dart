// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_wizard_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DishWizardUiState {
  String? get id;
  DishWizardMainStepUiState get mainStepState;
  DishWizardIngredientsStepUiState get ingredientsStepState;
  DishWizardMeasurementsStepUiState get measurementsStepState;

  /// Create a copy of DishWizardUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DishWizardUiStateCopyWith<DishWizardUiState> get copyWith =>
      _$DishWizardUiStateCopyWithImpl<DishWizardUiState>(
          this as DishWizardUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DishWizardUiState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mainStepState, mainStepState) ||
                other.mainStepState == mainStepState) &&
            (identical(other.ingredientsStepState, ingredientsStepState) ||
                other.ingredientsStepState == ingredientsStepState) &&
            (identical(other.measurementsStepState, measurementsStepState) ||
                other.measurementsStepState == measurementsStepState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, mainStepState,
      ingredientsStepState, measurementsStepState);

  @override
  String toString() {
    return 'DishWizardUiState(id: $id, mainStepState: $mainStepState, ingredientsStepState: $ingredientsStepState, measurementsStepState: $measurementsStepState)';
  }
}

/// @nodoc
abstract mixin class $DishWizardUiStateCopyWith<$Res> {
  factory $DishWizardUiStateCopyWith(
          DishWizardUiState value, $Res Function(DishWizardUiState) _then) =
      _$DishWizardUiStateCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      DishWizardMainStepUiState mainStepState,
      DishWizardIngredientsStepUiState ingredientsStepState,
      DishWizardMeasurementsStepUiState measurementsStepState});

  $DishWizardMainStepUiStateCopyWith<$Res> get mainStepState;
  $DishWizardIngredientsStepUiStateCopyWith<$Res> get ingredientsStepState;
  $DishWizardMeasurementsStepUiStateCopyWith<$Res> get measurementsStepState;
}

/// @nodoc
class _$DishWizardUiStateCopyWithImpl<$Res>
    implements $DishWizardUiStateCopyWith<$Res> {
  _$DishWizardUiStateCopyWithImpl(this._self, this._then);

  final DishWizardUiState _self;
  final $Res Function(DishWizardUiState) _then;

  /// Create a copy of DishWizardUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? mainStepState = null,
    Object? ingredientsStepState = null,
    Object? measurementsStepState = null,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      mainStepState: null == mainStepState
          ? _self.mainStepState
          : mainStepState // ignore: cast_nullable_to_non_nullable
              as DishWizardMainStepUiState,
      ingredientsStepState: null == ingredientsStepState
          ? _self.ingredientsStepState
          : ingredientsStepState // ignore: cast_nullable_to_non_nullable
              as DishWizardIngredientsStepUiState,
      measurementsStepState: null == measurementsStepState
          ? _self.measurementsStepState
          : measurementsStepState // ignore: cast_nullable_to_non_nullable
              as DishWizardMeasurementsStepUiState,
    ));
  }

  /// Create a copy of DishWizardUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DishWizardMainStepUiStateCopyWith<$Res> get mainStepState {
    return $DishWizardMainStepUiStateCopyWith<$Res>(_self.mainStepState,
        (value) {
      return _then(_self.copyWith(mainStepState: value));
    });
  }

  /// Create a copy of DishWizardUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DishWizardIngredientsStepUiStateCopyWith<$Res> get ingredientsStepState {
    return $DishWizardIngredientsStepUiStateCopyWith<$Res>(
        _self.ingredientsStepState, (value) {
      return _then(_self.copyWith(ingredientsStepState: value));
    });
  }

  /// Create a copy of DishWizardUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DishWizardMeasurementsStepUiStateCopyWith<$Res> get measurementsStepState {
    return $DishWizardMeasurementsStepUiStateCopyWith<$Res>(
        _self.measurementsStepState, (value) {
      return _then(_self.copyWith(measurementsStepState: value));
    });
  }
}

/// @nodoc

class _DishWizardState extends DishWizardUiState {
  const _DishWizardState(
      {this.id,
      required this.mainStepState,
      required this.ingredientsStepState,
      required this.measurementsStepState})
      : super._();

  @override
  final String? id;
  @override
  final DishWizardMainStepUiState mainStepState;
  @override
  final DishWizardIngredientsStepUiState ingredientsStepState;
  @override
  final DishWizardMeasurementsStepUiState measurementsStepState;

  /// Create a copy of DishWizardUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DishWizardStateCopyWith<_DishWizardState> get copyWith =>
      __$DishWizardStateCopyWithImpl<_DishWizardState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DishWizardState &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mainStepState, mainStepState) ||
                other.mainStepState == mainStepState) &&
            (identical(other.ingredientsStepState, ingredientsStepState) ||
                other.ingredientsStepState == ingredientsStepState) &&
            (identical(other.measurementsStepState, measurementsStepState) ||
                other.measurementsStepState == measurementsStepState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, mainStepState,
      ingredientsStepState, measurementsStepState);

  @override
  String toString() {
    return 'DishWizardUiState._default(id: $id, mainStepState: $mainStepState, ingredientsStepState: $ingredientsStepState, measurementsStepState: $measurementsStepState)';
  }
}

/// @nodoc
abstract mixin class _$DishWizardStateCopyWith<$Res>
    implements $DishWizardUiStateCopyWith<$Res> {
  factory _$DishWizardStateCopyWith(
          _DishWizardState value, $Res Function(_DishWizardState) _then) =
      __$DishWizardStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      DishWizardMainStepUiState mainStepState,
      DishWizardIngredientsStepUiState ingredientsStepState,
      DishWizardMeasurementsStepUiState measurementsStepState});

  @override
  $DishWizardMainStepUiStateCopyWith<$Res> get mainStepState;
  @override
  $DishWizardIngredientsStepUiStateCopyWith<$Res> get ingredientsStepState;
  @override
  $DishWizardMeasurementsStepUiStateCopyWith<$Res> get measurementsStepState;
}

/// @nodoc
class __$DishWizardStateCopyWithImpl<$Res>
    implements _$DishWizardStateCopyWith<$Res> {
  __$DishWizardStateCopyWithImpl(this._self, this._then);

  final _DishWizardState _self;
  final $Res Function(_DishWizardState) _then;

  /// Create a copy of DishWizardUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? mainStepState = null,
    Object? ingredientsStepState = null,
    Object? measurementsStepState = null,
  }) {
    return _then(_DishWizardState(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      mainStepState: null == mainStepState
          ? _self.mainStepState
          : mainStepState // ignore: cast_nullable_to_non_nullable
              as DishWizardMainStepUiState,
      ingredientsStepState: null == ingredientsStepState
          ? _self.ingredientsStepState
          : ingredientsStepState // ignore: cast_nullable_to_non_nullable
              as DishWizardIngredientsStepUiState,
      measurementsStepState: null == measurementsStepState
          ? _self.measurementsStepState
          : measurementsStepState // ignore: cast_nullable_to_non_nullable
              as DishWizardMeasurementsStepUiState,
    ));
  }

  /// Create a copy of DishWizardUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DishWizardMainStepUiStateCopyWith<$Res> get mainStepState {
    return $DishWizardMainStepUiStateCopyWith<$Res>(_self.mainStepState,
        (value) {
      return _then(_self.copyWith(mainStepState: value));
    });
  }

  /// Create a copy of DishWizardUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DishWizardIngredientsStepUiStateCopyWith<$Res> get ingredientsStepState {
    return $DishWizardIngredientsStepUiStateCopyWith<$Res>(
        _self.ingredientsStepState, (value) {
      return _then(_self.copyWith(ingredientsStepState: value));
    });
  }

  /// Create a copy of DishWizardUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DishWizardMeasurementsStepUiStateCopyWith<$Res> get measurementsStepState {
    return $DishWizardMeasurementsStepUiStateCopyWith<$Res>(
        _self.measurementsStepState, (value) {
      return _then(_self.copyWith(measurementsStepState: value));
    });
  }
}

// dart format on
