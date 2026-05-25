// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

 Unit get perAmountUnit; double? get perAmountValue; List<NutrientAmountUiState> get nutrientAmounts;
/// Create a copy of NutritionFactsUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionFactsUiStateCopyWith<NutritionFactsUiState> get copyWith => _$NutritionFactsUiStateCopyWithImpl<NutritionFactsUiState>(this as NutritionFactsUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionFactsUiState&&(identical(other.perAmountUnit, perAmountUnit) || other.perAmountUnit == perAmountUnit)&&(identical(other.perAmountValue, perAmountValue) || other.perAmountValue == perAmountValue)&&const DeepCollectionEquality().equals(other.nutrientAmounts, nutrientAmounts));
}


@override
int get hashCode => Object.hash(runtimeType,perAmountUnit,perAmountValue,const DeepCollectionEquality().hash(nutrientAmounts));

@override
String toString() {
  return 'NutritionFactsUiState(perAmountUnit: $perAmountUnit, perAmountValue: $perAmountValue, nutrientAmounts: $nutrientAmounts)';
}


}

/// @nodoc
abstract mixin class $NutritionFactsUiStateCopyWith<$Res>  {
  factory $NutritionFactsUiStateCopyWith(NutritionFactsUiState value, $Res Function(NutritionFactsUiState) _then) = _$NutritionFactsUiStateCopyWithImpl;
@useResult
$Res call({
 Unit perAmountUnit, double? perAmountValue, List<NutrientAmountUiState> nutrientAmounts
});




}
/// @nodoc
class _$NutritionFactsUiStateCopyWithImpl<$Res>
    implements $NutritionFactsUiStateCopyWith<$Res> {
  _$NutritionFactsUiStateCopyWithImpl(this._self, this._then);

  final NutritionFactsUiState _self;
  final $Res Function(NutritionFactsUiState) _then;

/// Create a copy of NutritionFactsUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? perAmountUnit = null,Object? perAmountValue = freezed,Object? nutrientAmounts = null,}) {
  return _then(_self.copyWith(
perAmountUnit: null == perAmountUnit ? _self.perAmountUnit : perAmountUnit // ignore: cast_nullable_to_non_nullable
as Unit,perAmountValue: freezed == perAmountValue ? _self.perAmountValue : perAmountValue // ignore: cast_nullable_to_non_nullable
as double?,nutrientAmounts: null == nutrientAmounts ? _self.nutrientAmounts : nutrientAmounts // ignore: cast_nullable_to_non_nullable
as List<NutrientAmountUiState>,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionFactsUiState].
extension NutritionFactsUiStatePatterns on NutritionFactsUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _NutritionFactsUiState value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionFactsUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _NutritionFactsUiState value)  $default,}){
final _that = this;
switch (_that) {
case _NutritionFactsUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _NutritionFactsUiState value)?  $default,}){
final _that = this;
switch (_that) {
case _NutritionFactsUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( Unit perAmountUnit,  double? perAmountValue,  List<NutrientAmountUiState> nutrientAmounts)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionFactsUiState() when $default != null:
return $default(_that.perAmountUnit,_that.perAmountValue,_that.nutrientAmounts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( Unit perAmountUnit,  double? perAmountValue,  List<NutrientAmountUiState> nutrientAmounts)  $default,}) {final _that = this;
switch (_that) {
case _NutritionFactsUiState():
return $default(_that.perAmountUnit,_that.perAmountValue,_that.nutrientAmounts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( Unit perAmountUnit,  double? perAmountValue,  List<NutrientAmountUiState> nutrientAmounts)?  $default,}) {final _that = this;
switch (_that) {
case _NutritionFactsUiState() when $default != null:
return $default(_that.perAmountUnit,_that.perAmountValue,_that.nutrientAmounts);case _:
  return null;

}
}

}

/// @nodoc


class _NutritionFactsUiState extends NutritionFactsUiState {
  const _NutritionFactsUiState({required this.perAmountUnit, this.perAmountValue, required final  List<NutrientAmountUiState> nutrientAmounts}): _nutrientAmounts = nutrientAmounts,super._();
  

@override final  Unit perAmountUnit;
@override final  double? perAmountValue;
 final  List<NutrientAmountUiState> _nutrientAmounts;
@override List<NutrientAmountUiState> get nutrientAmounts {
  if (_nutrientAmounts is EqualUnmodifiableListView) return _nutrientAmounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nutrientAmounts);
}


/// Create a copy of NutritionFactsUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionFactsUiStateCopyWith<_NutritionFactsUiState> get copyWith => __$NutritionFactsUiStateCopyWithImpl<_NutritionFactsUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionFactsUiState&&(identical(other.perAmountUnit, perAmountUnit) || other.perAmountUnit == perAmountUnit)&&(identical(other.perAmountValue, perAmountValue) || other.perAmountValue == perAmountValue)&&const DeepCollectionEquality().equals(other._nutrientAmounts, _nutrientAmounts));
}


@override
int get hashCode => Object.hash(runtimeType,perAmountUnit,perAmountValue,const DeepCollectionEquality().hash(_nutrientAmounts));

@override
String toString() {
  return 'NutritionFactsUiState.\$default(perAmountUnit: $perAmountUnit, perAmountValue: $perAmountValue, nutrientAmounts: $nutrientAmounts)';
}


}

/// @nodoc
abstract mixin class _$NutritionFactsUiStateCopyWith<$Res> implements $NutritionFactsUiStateCopyWith<$Res> {
  factory _$NutritionFactsUiStateCopyWith(_NutritionFactsUiState value, $Res Function(_NutritionFactsUiState) _then) = __$NutritionFactsUiStateCopyWithImpl;
@override @useResult
$Res call({
 Unit perAmountUnit, double? perAmountValue, List<NutrientAmountUiState> nutrientAmounts
});




}
/// @nodoc
class __$NutritionFactsUiStateCopyWithImpl<$Res>
    implements _$NutritionFactsUiStateCopyWith<$Res> {
  __$NutritionFactsUiStateCopyWithImpl(this._self, this._then);

  final _NutritionFactsUiState _self;
  final $Res Function(_NutritionFactsUiState) _then;

/// Create a copy of NutritionFactsUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? perAmountUnit = null,Object? perAmountValue = freezed,Object? nutrientAmounts = null,}) {
  return _then(_NutritionFactsUiState(
perAmountUnit: null == perAmountUnit ? _self.perAmountUnit : perAmountUnit // ignore: cast_nullable_to_non_nullable
as Unit,perAmountValue: freezed == perAmountValue ? _self.perAmountValue : perAmountValue // ignore: cast_nullable_to_non_nullable
as double?,nutrientAmounts: null == nutrientAmounts ? _self._nutrientAmounts : nutrientAmounts // ignore: cast_nullable_to_non_nullable
as List<NutrientAmountUiState>,
  ));
}


}

// dart format on
