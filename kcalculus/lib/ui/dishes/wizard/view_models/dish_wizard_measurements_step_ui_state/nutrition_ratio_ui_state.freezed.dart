// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_ratio_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutritionRatioUiState {

 Measure get measure; Unit get perAmountUnit; double? get perAmountValue; Unit get totalAmountUnit; double? get totalAmountValue; bool get enabled;
/// Create a copy of NutritionRatioUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionRatioUiStateCopyWith<NutritionRatioUiState> get copyWith => _$NutritionRatioUiStateCopyWithImpl<NutritionRatioUiState>(this as NutritionRatioUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionRatioUiState&&(identical(other.measure, measure) || other.measure == measure)&&(identical(other.perAmountUnit, perAmountUnit) || other.perAmountUnit == perAmountUnit)&&(identical(other.perAmountValue, perAmountValue) || other.perAmountValue == perAmountValue)&&(identical(other.totalAmountUnit, totalAmountUnit) || other.totalAmountUnit == totalAmountUnit)&&(identical(other.totalAmountValue, totalAmountValue) || other.totalAmountValue == totalAmountValue)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,measure,perAmountUnit,perAmountValue,totalAmountUnit,totalAmountValue,enabled);

@override
String toString() {
  return 'NutritionRatioUiState(measure: $measure, perAmountUnit: $perAmountUnit, perAmountValue: $perAmountValue, totalAmountUnit: $totalAmountUnit, totalAmountValue: $totalAmountValue, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class $NutritionRatioUiStateCopyWith<$Res>  {
  factory $NutritionRatioUiStateCopyWith(NutritionRatioUiState value, $Res Function(NutritionRatioUiState) _then) = _$NutritionRatioUiStateCopyWithImpl;
@useResult
$Res call({
 Measure measure, Unit perAmountUnit, double? perAmountValue, Unit totalAmountUnit, double? totalAmountValue, bool enabled
});




}
/// @nodoc
class _$NutritionRatioUiStateCopyWithImpl<$Res>
    implements $NutritionRatioUiStateCopyWith<$Res> {
  _$NutritionRatioUiStateCopyWithImpl(this._self, this._then);

  final NutritionRatioUiState _self;
  final $Res Function(NutritionRatioUiState) _then;

/// Create a copy of NutritionRatioUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? measure = null,Object? perAmountUnit = null,Object? perAmountValue = freezed,Object? totalAmountUnit = null,Object? totalAmountValue = freezed,Object? enabled = null,}) {
  return _then(_self.copyWith(
measure: null == measure ? _self.measure : measure // ignore: cast_nullable_to_non_nullable
as Measure,perAmountUnit: null == perAmountUnit ? _self.perAmountUnit : perAmountUnit // ignore: cast_nullable_to_non_nullable
as Unit,perAmountValue: freezed == perAmountValue ? _self.perAmountValue : perAmountValue // ignore: cast_nullable_to_non_nullable
as double?,totalAmountUnit: null == totalAmountUnit ? _self.totalAmountUnit : totalAmountUnit // ignore: cast_nullable_to_non_nullable
as Unit,totalAmountValue: freezed == totalAmountValue ? _self.totalAmountValue : totalAmountValue // ignore: cast_nullable_to_non_nullable
as double?,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionRatioUiState].
extension NutritionRatioUiStatePatterns on NutritionRatioUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NutritionRatioUiState value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionRatioUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NutritionRatioUiState value)  $default,}){
final _that = this;
switch (_that) {
case _NutritionRatioUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NutritionRatioUiState value)?  $default,}){
final _that = this;
switch (_that) {
case _NutritionRatioUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Measure measure,  Unit perAmountUnit,  double? perAmountValue,  Unit totalAmountUnit,  double? totalAmountValue,  bool enabled)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionRatioUiState() when $default != null:
return $default(_that.measure,_that.perAmountUnit,_that.perAmountValue,_that.totalAmountUnit,_that.totalAmountValue,_that.enabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Measure measure,  Unit perAmountUnit,  double? perAmountValue,  Unit totalAmountUnit,  double? totalAmountValue,  bool enabled)  $default,}) {final _that = this;
switch (_that) {
case _NutritionRatioUiState():
return $default(_that.measure,_that.perAmountUnit,_that.perAmountValue,_that.totalAmountUnit,_that.totalAmountValue,_that.enabled);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Measure measure,  Unit perAmountUnit,  double? perAmountValue,  Unit totalAmountUnit,  double? totalAmountValue,  bool enabled)?  $default,}) {final _that = this;
switch (_that) {
case _NutritionRatioUiState() when $default != null:
return $default(_that.measure,_that.perAmountUnit,_that.perAmountValue,_that.totalAmountUnit,_that.totalAmountValue,_that.enabled);case _:
  return null;

}
}

}

/// @nodoc


class _NutritionRatioUiState extends NutritionRatioUiState {
  const _NutritionRatioUiState({required this.measure, required this.perAmountUnit, this.perAmountValue, required this.totalAmountUnit, this.totalAmountValue, required this.enabled}): super._();
  

@override final  Measure measure;
@override final  Unit perAmountUnit;
@override final  double? perAmountValue;
@override final  Unit totalAmountUnit;
@override final  double? totalAmountValue;
@override final  bool enabled;

/// Create a copy of NutritionRatioUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionRatioUiStateCopyWith<_NutritionRatioUiState> get copyWith => __$NutritionRatioUiStateCopyWithImpl<_NutritionRatioUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionRatioUiState&&(identical(other.measure, measure) || other.measure == measure)&&(identical(other.perAmountUnit, perAmountUnit) || other.perAmountUnit == perAmountUnit)&&(identical(other.perAmountValue, perAmountValue) || other.perAmountValue == perAmountValue)&&(identical(other.totalAmountUnit, totalAmountUnit) || other.totalAmountUnit == totalAmountUnit)&&(identical(other.totalAmountValue, totalAmountValue) || other.totalAmountValue == totalAmountValue)&&(identical(other.enabled, enabled) || other.enabled == enabled));
}


@override
int get hashCode => Object.hash(runtimeType,measure,perAmountUnit,perAmountValue,totalAmountUnit,totalAmountValue,enabled);

@override
String toString() {
  return 'NutritionRatioUiState.\$default(measure: $measure, perAmountUnit: $perAmountUnit, perAmountValue: $perAmountValue, totalAmountUnit: $totalAmountUnit, totalAmountValue: $totalAmountValue, enabled: $enabled)';
}


}

/// @nodoc
abstract mixin class _$NutritionRatioUiStateCopyWith<$Res> implements $NutritionRatioUiStateCopyWith<$Res> {
  factory _$NutritionRatioUiStateCopyWith(_NutritionRatioUiState value, $Res Function(_NutritionRatioUiState) _then) = __$NutritionRatioUiStateCopyWithImpl;
@override @useResult
$Res call({
 Measure measure, Unit perAmountUnit, double? perAmountValue, Unit totalAmountUnit, double? totalAmountValue, bool enabled
});




}
/// @nodoc
class __$NutritionRatioUiStateCopyWithImpl<$Res>
    implements _$NutritionRatioUiStateCopyWith<$Res> {
  __$NutritionRatioUiStateCopyWithImpl(this._self, this._then);

  final _NutritionRatioUiState _self;
  final $Res Function(_NutritionRatioUiState) _then;

/// Create a copy of NutritionRatioUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? measure = null,Object? perAmountUnit = null,Object? perAmountValue = freezed,Object? totalAmountUnit = null,Object? totalAmountValue = freezed,Object? enabled = null,}) {
  return _then(_NutritionRatioUiState(
measure: null == measure ? _self.measure : measure // ignore: cast_nullable_to_non_nullable
as Measure,perAmountUnit: null == perAmountUnit ? _self.perAmountUnit : perAmountUnit // ignore: cast_nullable_to_non_nullable
as Unit,perAmountValue: freezed == perAmountValue ? _self.perAmountValue : perAmountValue // ignore: cast_nullable_to_non_nullable
as double?,totalAmountUnit: null == totalAmountUnit ? _self.totalAmountUnit : totalAmountUnit // ignore: cast_nullable_to_non_nullable
as Unit,totalAmountValue: freezed == totalAmountValue ? _self.totalAmountValue : totalAmountValue // ignore: cast_nullable_to_non_nullable
as double?,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
