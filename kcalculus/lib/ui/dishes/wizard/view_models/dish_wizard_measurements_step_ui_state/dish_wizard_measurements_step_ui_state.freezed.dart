// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_wizard_measurements_step_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MeasurementsStepValidationResult {
  bool get measurementsMissing => throw _privateConstructorUsedError;
  Map<Measure, NutritionRatioValidationResult?>
      get ratioStateValidationResults => throw _privateConstructorUsedError;

  /// Create a copy of MeasurementsStepValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeasurementsStepValidationResultCopyWith<MeasurementsStepValidationResult>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeasurementsStepValidationResultCopyWith<$Res> {
  factory $MeasurementsStepValidationResultCopyWith(
          MeasurementsStepValidationResult value,
          $Res Function(MeasurementsStepValidationResult) then) =
      _$MeasurementsStepValidationResultCopyWithImpl<$Res,
          MeasurementsStepValidationResult>;
  @useResult
  $Res call(
      {bool measurementsMissing,
      Map<Measure, NutritionRatioValidationResult?>
          ratioStateValidationResults});
}

/// @nodoc
class _$MeasurementsStepValidationResultCopyWithImpl<$Res,
        $Val extends MeasurementsStepValidationResult>
    implements $MeasurementsStepValidationResultCopyWith<$Res> {
  _$MeasurementsStepValidationResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeasurementsStepValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? measurementsMissing = null,
    Object? ratioStateValidationResults = null,
  }) {
    return _then(_value.copyWith(
      measurementsMissing: null == measurementsMissing
          ? _value.measurementsMissing
          : measurementsMissing // ignore: cast_nullable_to_non_nullable
              as bool,
      ratioStateValidationResults: null == ratioStateValidationResults
          ? _value.ratioStateValidationResults
          : ratioStateValidationResults // ignore: cast_nullable_to_non_nullable
              as Map<Measure, NutritionRatioValidationResult?>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeasurementsStepValidationResultImplCopyWith<$Res>
    implements $MeasurementsStepValidationResultCopyWith<$Res> {
  factory _$$MeasurementsStepValidationResultImplCopyWith(
          _$MeasurementsStepValidationResultImpl value,
          $Res Function(_$MeasurementsStepValidationResultImpl) then) =
      __$$MeasurementsStepValidationResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool measurementsMissing,
      Map<Measure, NutritionRatioValidationResult?>
          ratioStateValidationResults});
}

/// @nodoc
class __$$MeasurementsStepValidationResultImplCopyWithImpl<$Res>
    extends _$MeasurementsStepValidationResultCopyWithImpl<$Res,
        _$MeasurementsStepValidationResultImpl>
    implements _$$MeasurementsStepValidationResultImplCopyWith<$Res> {
  __$$MeasurementsStepValidationResultImplCopyWithImpl(
      _$MeasurementsStepValidationResultImpl _value,
      $Res Function(_$MeasurementsStepValidationResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeasurementsStepValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? measurementsMissing = null,
    Object? ratioStateValidationResults = null,
  }) {
    return _then(_$MeasurementsStepValidationResultImpl(
      measurementsMissing: null == measurementsMissing
          ? _value.measurementsMissing
          : measurementsMissing // ignore: cast_nullable_to_non_nullable
              as bool,
      ratioStateValidationResults: null == ratioStateValidationResults
          ? _value._ratioStateValidationResults
          : ratioStateValidationResults // ignore: cast_nullable_to_non_nullable
              as Map<Measure, NutritionRatioValidationResult?>,
    ));
  }
}

/// @nodoc

class _$MeasurementsStepValidationResultImpl
    implements _MeasurementsStepValidationResult {
  const _$MeasurementsStepValidationResultImpl(
      {required this.measurementsMissing,
      required final Map<Measure, NutritionRatioValidationResult?>
          ratioStateValidationResults})
      : _ratioStateValidationResults = ratioStateValidationResults;

  @override
  final bool measurementsMissing;
  final Map<Measure, NutritionRatioValidationResult?>
      _ratioStateValidationResults;
  @override
  Map<Measure, NutritionRatioValidationResult?>
      get ratioStateValidationResults {
    if (_ratioStateValidationResults is EqualUnmodifiableMapView)
      return _ratioStateValidationResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ratioStateValidationResults);
  }

  @override
  String toString() {
    return 'MeasurementsStepValidationResult(measurementsMissing: $measurementsMissing, ratioStateValidationResults: $ratioStateValidationResults)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurementsStepValidationResultImpl &&
            (identical(other.measurementsMissing, measurementsMissing) ||
                other.measurementsMissing == measurementsMissing) &&
            const DeepCollectionEquality().equals(
                other._ratioStateValidationResults,
                _ratioStateValidationResults));
  }

  @override
  int get hashCode => Object.hash(runtimeType, measurementsMissing,
      const DeepCollectionEquality().hash(_ratioStateValidationResults));

  /// Create a copy of MeasurementsStepValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeasurementsStepValidationResultImplCopyWith<
          _$MeasurementsStepValidationResultImpl>
      get copyWith => __$$MeasurementsStepValidationResultImplCopyWithImpl<
          _$MeasurementsStepValidationResultImpl>(this, _$identity);
}

abstract class _MeasurementsStepValidationResult
    implements MeasurementsStepValidationResult {
  const factory _MeasurementsStepValidationResult(
          {required final bool measurementsMissing,
          required final Map<Measure, NutritionRatioValidationResult?>
              ratioStateValidationResults}) =
      _$MeasurementsStepValidationResultImpl;

  @override
  bool get measurementsMissing;
  @override
  Map<Measure, NutritionRatioValidationResult?> get ratioStateValidationResults;

  /// Create a copy of MeasurementsStepValidationResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeasurementsStepValidationResultImplCopyWith<
          _$MeasurementsStepValidationResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DishWizardMeasurementsStepUiState {
  List<NutritionRatioUiState> get nutritionRatioStates =>
      throw _privateConstructorUsedError;

  /// Create a copy of DishWizardMeasurementsStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DishWizardMeasurementsStepUiStateCopyWith<DishWizardMeasurementsStepUiState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DishWizardMeasurementsStepUiStateCopyWith<$Res> {
  factory $DishWizardMeasurementsStepUiStateCopyWith(
          DishWizardMeasurementsStepUiState value,
          $Res Function(DishWizardMeasurementsStepUiState) then) =
      _$DishWizardMeasurementsStepUiStateCopyWithImpl<$Res,
          DishWizardMeasurementsStepUiState>;
  @useResult
  $Res call({List<NutritionRatioUiState> nutritionRatioStates});
}

/// @nodoc
class _$DishWizardMeasurementsStepUiStateCopyWithImpl<$Res,
        $Val extends DishWizardMeasurementsStepUiState>
    implements $DishWizardMeasurementsStepUiStateCopyWith<$Res> {
  _$DishWizardMeasurementsStepUiStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DishWizardMeasurementsStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutritionRatioStates = null,
  }) {
    return _then(_value.copyWith(
      nutritionRatioStates: null == nutritionRatioStates
          ? _value.nutritionRatioStates
          : nutritionRatioStates // ignore: cast_nullable_to_non_nullable
              as List<NutritionRatioUiState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DishWizardMeasurementsStepUiStateImplCopyWith<$Res>
    implements $DishWizardMeasurementsStepUiStateCopyWith<$Res> {
  factory _$$DishWizardMeasurementsStepUiStateImplCopyWith(
          _$DishWizardMeasurementsStepUiStateImpl value,
          $Res Function(_$DishWizardMeasurementsStepUiStateImpl) then) =
      __$$DishWizardMeasurementsStepUiStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NutritionRatioUiState> nutritionRatioStates});
}

/// @nodoc
class __$$DishWizardMeasurementsStepUiStateImplCopyWithImpl<$Res>
    extends _$DishWizardMeasurementsStepUiStateCopyWithImpl<$Res,
        _$DishWizardMeasurementsStepUiStateImpl>
    implements _$$DishWizardMeasurementsStepUiStateImplCopyWith<$Res> {
  __$$DishWizardMeasurementsStepUiStateImplCopyWithImpl(
      _$DishWizardMeasurementsStepUiStateImpl _value,
      $Res Function(_$DishWizardMeasurementsStepUiStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DishWizardMeasurementsStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nutritionRatioStates = null,
  }) {
    return _then(_$DishWizardMeasurementsStepUiStateImpl(
      nutritionRatioStates: null == nutritionRatioStates
          ? _value._nutritionRatioStates
          : nutritionRatioStates // ignore: cast_nullable_to_non_nullable
              as List<NutritionRatioUiState>,
    ));
  }
}

/// @nodoc

class _$DishWizardMeasurementsStepUiStateImpl
    extends _DishWizardMeasurementsStepUiState {
  const _$DishWizardMeasurementsStepUiStateImpl(
      {required final List<NutritionRatioUiState> nutritionRatioStates})
      : _nutritionRatioStates = nutritionRatioStates,
        super._();

  final List<NutritionRatioUiState> _nutritionRatioStates;
  @override
  List<NutritionRatioUiState> get nutritionRatioStates {
    if (_nutritionRatioStates is EqualUnmodifiableListView)
      return _nutritionRatioStates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_nutritionRatioStates);
  }

  @override
  String toString() {
    return 'DishWizardMeasurementsStepUiState._default(nutritionRatioStates: $nutritionRatioStates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DishWizardMeasurementsStepUiStateImpl &&
            const DeepCollectionEquality()
                .equals(other._nutritionRatioStates, _nutritionRatioStates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_nutritionRatioStates));

  /// Create a copy of DishWizardMeasurementsStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DishWizardMeasurementsStepUiStateImplCopyWith<
          _$DishWizardMeasurementsStepUiStateImpl>
      get copyWith => __$$DishWizardMeasurementsStepUiStateImplCopyWithImpl<
          _$DishWizardMeasurementsStepUiStateImpl>(this, _$identity);
}

abstract class _DishWizardMeasurementsStepUiState
    extends DishWizardMeasurementsStepUiState {
  const factory _DishWizardMeasurementsStepUiState(
          {required final List<NutritionRatioUiState> nutritionRatioStates}) =
      _$DishWizardMeasurementsStepUiStateImpl;
  const _DishWizardMeasurementsStepUiState._() : super._();

  @override
  List<NutritionRatioUiState> get nutritionRatioStates;

  /// Create a copy of DishWizardMeasurementsStepUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DishWizardMeasurementsStepUiStateImplCopyWith<
          _$DishWizardMeasurementsStepUiStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
