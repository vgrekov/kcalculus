// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_wizard_measurements_step_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MeasurementsStepValidationResult {

 bool get measurementsMissing; Map<Measure, NutritionRatioValidationResult?> get ratioStateValidationResults;
/// Create a copy of MeasurementsStepValidationResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeasurementsStepValidationResultCopyWith<MeasurementsStepValidationResult> get copyWith => _$MeasurementsStepValidationResultCopyWithImpl<MeasurementsStepValidationResult>(this as MeasurementsStepValidationResult, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MeasurementsStepValidationResult&&(identical(other.measurementsMissing, measurementsMissing) || other.measurementsMissing == measurementsMissing)&&const DeepCollectionEquality().equals(other.ratioStateValidationResults, ratioStateValidationResults));
}


@override
int get hashCode => Object.hash(runtimeType,measurementsMissing,const DeepCollectionEquality().hash(ratioStateValidationResults));

@override
String toString() {
  return 'MeasurementsStepValidationResult(measurementsMissing: $measurementsMissing, ratioStateValidationResults: $ratioStateValidationResults)';
}


}

/// @nodoc
abstract mixin class $MeasurementsStepValidationResultCopyWith<$Res>  {
  factory $MeasurementsStepValidationResultCopyWith(MeasurementsStepValidationResult value, $Res Function(MeasurementsStepValidationResult) _then) = _$MeasurementsStepValidationResultCopyWithImpl;
@useResult
$Res call({
 bool measurementsMissing, Map<Measure, NutritionRatioValidationResult?> ratioStateValidationResults
});




}
/// @nodoc
class _$MeasurementsStepValidationResultCopyWithImpl<$Res>
    implements $MeasurementsStepValidationResultCopyWith<$Res> {
  _$MeasurementsStepValidationResultCopyWithImpl(this._self, this._then);

  final MeasurementsStepValidationResult _self;
  final $Res Function(MeasurementsStepValidationResult) _then;

/// Create a copy of MeasurementsStepValidationResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? measurementsMissing = null,Object? ratioStateValidationResults = null,}) {
  return _then(_self.copyWith(
measurementsMissing: null == measurementsMissing ? _self.measurementsMissing : measurementsMissing // ignore: cast_nullable_to_non_nullable
as bool,ratioStateValidationResults: null == ratioStateValidationResults ? _self.ratioStateValidationResults : ratioStateValidationResults // ignore: cast_nullable_to_non_nullable
as Map<Measure, NutritionRatioValidationResult?>,
  ));
}

}


/// Adds pattern-matching-related methods to [MeasurementsStepValidationResult].
extension MeasurementsStepValidationResultPatterns on MeasurementsStepValidationResult {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MeasurementsStepValidationResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MeasurementsStepValidationResult() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MeasurementsStepValidationResult value)  $default,){
final _that = this;
switch (_that) {
case _MeasurementsStepValidationResult():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MeasurementsStepValidationResult value)?  $default,){
final _that = this;
switch (_that) {
case _MeasurementsStepValidationResult() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool measurementsMissing,  Map<Measure, NutritionRatioValidationResult?> ratioStateValidationResults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MeasurementsStepValidationResult() when $default != null:
return $default(_that.measurementsMissing,_that.ratioStateValidationResults);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool measurementsMissing,  Map<Measure, NutritionRatioValidationResult?> ratioStateValidationResults)  $default,) {final _that = this;
switch (_that) {
case _MeasurementsStepValidationResult():
return $default(_that.measurementsMissing,_that.ratioStateValidationResults);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool measurementsMissing,  Map<Measure, NutritionRatioValidationResult?> ratioStateValidationResults)?  $default,) {final _that = this;
switch (_that) {
case _MeasurementsStepValidationResult() when $default != null:
return $default(_that.measurementsMissing,_that.ratioStateValidationResults);case _:
  return null;

}
}

}

/// @nodoc


class _MeasurementsStepValidationResult implements MeasurementsStepValidationResult {
  const _MeasurementsStepValidationResult({required this.measurementsMissing, required final  Map<Measure, NutritionRatioValidationResult?> ratioStateValidationResults}): _ratioStateValidationResults = ratioStateValidationResults;
  

@override final  bool measurementsMissing;
 final  Map<Measure, NutritionRatioValidationResult?> _ratioStateValidationResults;
@override Map<Measure, NutritionRatioValidationResult?> get ratioStateValidationResults {
  if (_ratioStateValidationResults is EqualUnmodifiableMapView) return _ratioStateValidationResults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_ratioStateValidationResults);
}


/// Create a copy of MeasurementsStepValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeasurementsStepValidationResultCopyWith<_MeasurementsStepValidationResult> get copyWith => __$MeasurementsStepValidationResultCopyWithImpl<_MeasurementsStepValidationResult>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MeasurementsStepValidationResult&&(identical(other.measurementsMissing, measurementsMissing) || other.measurementsMissing == measurementsMissing)&&const DeepCollectionEquality().equals(other._ratioStateValidationResults, _ratioStateValidationResults));
}


@override
int get hashCode => Object.hash(runtimeType,measurementsMissing,const DeepCollectionEquality().hash(_ratioStateValidationResults));

@override
String toString() {
  return 'MeasurementsStepValidationResult(measurementsMissing: $measurementsMissing, ratioStateValidationResults: $ratioStateValidationResults)';
}


}

/// @nodoc
abstract mixin class _$MeasurementsStepValidationResultCopyWith<$Res> implements $MeasurementsStepValidationResultCopyWith<$Res> {
  factory _$MeasurementsStepValidationResultCopyWith(_MeasurementsStepValidationResult value, $Res Function(_MeasurementsStepValidationResult) _then) = __$MeasurementsStepValidationResultCopyWithImpl;
@override @useResult
$Res call({
 bool measurementsMissing, Map<Measure, NutritionRatioValidationResult?> ratioStateValidationResults
});




}
/// @nodoc
class __$MeasurementsStepValidationResultCopyWithImpl<$Res>
    implements _$MeasurementsStepValidationResultCopyWith<$Res> {
  __$MeasurementsStepValidationResultCopyWithImpl(this._self, this._then);

  final _MeasurementsStepValidationResult _self;
  final $Res Function(_MeasurementsStepValidationResult) _then;

/// Create a copy of MeasurementsStepValidationResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? measurementsMissing = null,Object? ratioStateValidationResults = null,}) {
  return _then(_MeasurementsStepValidationResult(
measurementsMissing: null == measurementsMissing ? _self.measurementsMissing : measurementsMissing // ignore: cast_nullable_to_non_nullable
as bool,ratioStateValidationResults: null == ratioStateValidationResults ? _self._ratioStateValidationResults : ratioStateValidationResults // ignore: cast_nullable_to_non_nullable
as Map<Measure, NutritionRatioValidationResult?>,
  ));
}


}

/// @nodoc
mixin _$DishWizardMeasurementsStepUiState {

 FoodContainer? get container; List<NutritionRatioUiState> get nutritionRatioStates;
/// Create a copy of DishWizardMeasurementsStepUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DishWizardMeasurementsStepUiStateCopyWith<DishWizardMeasurementsStepUiState> get copyWith => _$DishWizardMeasurementsStepUiStateCopyWithImpl<DishWizardMeasurementsStepUiState>(this as DishWizardMeasurementsStepUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DishWizardMeasurementsStepUiState&&(identical(other.container, container) || other.container == container)&&const DeepCollectionEquality().equals(other.nutritionRatioStates, nutritionRatioStates));
}


@override
int get hashCode => Object.hash(runtimeType,container,const DeepCollectionEquality().hash(nutritionRatioStates));

@override
String toString() {
  return 'DishWizardMeasurementsStepUiState(container: $container, nutritionRatioStates: $nutritionRatioStates)';
}


}

/// @nodoc
abstract mixin class $DishWizardMeasurementsStepUiStateCopyWith<$Res>  {
  factory $DishWizardMeasurementsStepUiStateCopyWith(DishWizardMeasurementsStepUiState value, $Res Function(DishWizardMeasurementsStepUiState) _then) = _$DishWizardMeasurementsStepUiStateCopyWithImpl;
@useResult
$Res call({
 FoodContainer? container, List<NutritionRatioUiState> nutritionRatioStates
});


$FoodContainerCopyWith<$Res>? get container;

}
/// @nodoc
class _$DishWizardMeasurementsStepUiStateCopyWithImpl<$Res>
    implements $DishWizardMeasurementsStepUiStateCopyWith<$Res> {
  _$DishWizardMeasurementsStepUiStateCopyWithImpl(this._self, this._then);

  final DishWizardMeasurementsStepUiState _self;
  final $Res Function(DishWizardMeasurementsStepUiState) _then;

/// Create a copy of DishWizardMeasurementsStepUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? container = freezed,Object? nutritionRatioStates = null,}) {
  return _then(_self.copyWith(
container: freezed == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as FoodContainer?,nutritionRatioStates: null == nutritionRatioStates ? _self.nutritionRatioStates : nutritionRatioStates // ignore: cast_nullable_to_non_nullable
as List<NutritionRatioUiState>,
  ));
}
/// Create a copy of DishWizardMeasurementsStepUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodContainerCopyWith<$Res>? get container {
    if (_self.container == null) {
    return null;
  }

  return $FoodContainerCopyWith<$Res>(_self.container!, (value) {
    return _then(_self.copyWith(container: value));
  });
}
}


/// Adds pattern-matching-related methods to [DishWizardMeasurementsStepUiState].
extension DishWizardMeasurementsStepUiStatePatterns on DishWizardMeasurementsStepUiState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _DishWizardMeasurementsStepUiState value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DishWizardMeasurementsStepUiState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _DishWizardMeasurementsStepUiState value)  $default,}){
final _that = this;
switch (_that) {
case _DishWizardMeasurementsStepUiState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _DishWizardMeasurementsStepUiState value)?  $default,}){
final _that = this;
switch (_that) {
case _DishWizardMeasurementsStepUiState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( FoodContainer? container,  List<NutritionRatioUiState> nutritionRatioStates)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DishWizardMeasurementsStepUiState() when $default != null:
return $default(_that.container,_that.nutritionRatioStates);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( FoodContainer? container,  List<NutritionRatioUiState> nutritionRatioStates)  $default,}) {final _that = this;
switch (_that) {
case _DishWizardMeasurementsStepUiState():
return $default(_that.container,_that.nutritionRatioStates);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( FoodContainer? container,  List<NutritionRatioUiState> nutritionRatioStates)?  $default,}) {final _that = this;
switch (_that) {
case _DishWizardMeasurementsStepUiState() when $default != null:
return $default(_that.container,_that.nutritionRatioStates);case _:
  return null;

}
}

}

/// @nodoc


class _DishWizardMeasurementsStepUiState extends DishWizardMeasurementsStepUiState {
  const _DishWizardMeasurementsStepUiState({this.container, required final  List<NutritionRatioUiState> nutritionRatioStates}): _nutritionRatioStates = nutritionRatioStates,super._();
  

@override final  FoodContainer? container;
 final  List<NutritionRatioUiState> _nutritionRatioStates;
@override List<NutritionRatioUiState> get nutritionRatioStates {
  if (_nutritionRatioStates is EqualUnmodifiableListView) return _nutritionRatioStates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nutritionRatioStates);
}


/// Create a copy of DishWizardMeasurementsStepUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DishWizardMeasurementsStepUiStateCopyWith<_DishWizardMeasurementsStepUiState> get copyWith => __$DishWizardMeasurementsStepUiStateCopyWithImpl<_DishWizardMeasurementsStepUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DishWizardMeasurementsStepUiState&&(identical(other.container, container) || other.container == container)&&const DeepCollectionEquality().equals(other._nutritionRatioStates, _nutritionRatioStates));
}


@override
int get hashCode => Object.hash(runtimeType,container,const DeepCollectionEquality().hash(_nutritionRatioStates));

@override
String toString() {
  return 'DishWizardMeasurementsStepUiState.\$default(container: $container, nutritionRatioStates: $nutritionRatioStates)';
}


}

/// @nodoc
abstract mixin class _$DishWizardMeasurementsStepUiStateCopyWith<$Res> implements $DishWizardMeasurementsStepUiStateCopyWith<$Res> {
  factory _$DishWizardMeasurementsStepUiStateCopyWith(_DishWizardMeasurementsStepUiState value, $Res Function(_DishWizardMeasurementsStepUiState) _then) = __$DishWizardMeasurementsStepUiStateCopyWithImpl;
@override @useResult
$Res call({
 FoodContainer? container, List<NutritionRatioUiState> nutritionRatioStates
});


@override $FoodContainerCopyWith<$Res>? get container;

}
/// @nodoc
class __$DishWizardMeasurementsStepUiStateCopyWithImpl<$Res>
    implements _$DishWizardMeasurementsStepUiStateCopyWith<$Res> {
  __$DishWizardMeasurementsStepUiStateCopyWithImpl(this._self, this._then);

  final _DishWizardMeasurementsStepUiState _self;
  final $Res Function(_DishWizardMeasurementsStepUiState) _then;

/// Create a copy of DishWizardMeasurementsStepUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? container = freezed,Object? nutritionRatioStates = null,}) {
  return _then(_DishWizardMeasurementsStepUiState(
container: freezed == container ? _self.container : container // ignore: cast_nullable_to_non_nullable
as FoodContainer?,nutritionRatioStates: null == nutritionRatioStates ? _self._nutritionRatioStates : nutritionRatioStates // ignore: cast_nullable_to_non_nullable
as List<NutritionRatioUiState>,
  ));
}

/// Create a copy of DishWizardMeasurementsStepUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodContainerCopyWith<$Res>? get container {
    if (_self.container == null) {
    return null;
  }

  return $FoodContainerCopyWith<$Res>(_self.container!, (value) {
    return _then(_self.copyWith(container: value));
  });
}
}

// dart format on
