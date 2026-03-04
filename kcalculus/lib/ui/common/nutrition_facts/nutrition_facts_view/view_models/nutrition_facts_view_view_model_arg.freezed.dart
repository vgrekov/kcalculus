// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_view_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutritionFactsViewViewModelArg {

 List<NutritionFacts> get nutritionFacts; List<Nutrient> get nutrientDefaults;
/// Create a copy of NutritionFactsViewViewModelArg
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionFactsViewViewModelArgCopyWith<NutritionFactsViewViewModelArg> get copyWith => _$NutritionFactsViewViewModelArgCopyWithImpl<NutritionFactsViewViewModelArg>(this as NutritionFactsViewViewModelArg, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionFactsViewViewModelArg&&const DeepCollectionEquality().equals(other.nutritionFacts, nutritionFacts)&&const DeepCollectionEquality().equals(other.nutrientDefaults, nutrientDefaults));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nutritionFacts),const DeepCollectionEquality().hash(nutrientDefaults));

@override
String toString() {
  return 'NutritionFactsViewViewModelArg(nutritionFacts: $nutritionFacts, nutrientDefaults: $nutrientDefaults)';
}


}

/// @nodoc
abstract mixin class $NutritionFactsViewViewModelArgCopyWith<$Res>  {
  factory $NutritionFactsViewViewModelArgCopyWith(NutritionFactsViewViewModelArg value, $Res Function(NutritionFactsViewViewModelArg) _then) = _$NutritionFactsViewViewModelArgCopyWithImpl;
@useResult
$Res call({
 List<NutritionFacts> nutritionFacts, List<Nutrient> nutrientDefaults
});




}
/// @nodoc
class _$NutritionFactsViewViewModelArgCopyWithImpl<$Res>
    implements $NutritionFactsViewViewModelArgCopyWith<$Res> {
  _$NutritionFactsViewViewModelArgCopyWithImpl(this._self, this._then);

  final NutritionFactsViewViewModelArg _self;
  final $Res Function(NutritionFactsViewViewModelArg) _then;

/// Create a copy of NutritionFactsViewViewModelArg
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nutritionFacts = null,Object? nutrientDefaults = null,}) {
  return _then(_self.copyWith(
nutritionFacts: null == nutritionFacts ? _self.nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFacts>,nutrientDefaults: null == nutrientDefaults ? _self.nutrientDefaults : nutrientDefaults // ignore: cast_nullable_to_non_nullable
as List<Nutrient>,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionFactsViewViewModelArg].
extension NutritionFactsViewViewModelArgPatterns on NutritionFactsViewViewModelArg {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionFactsViewViewModelArg value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionFactsViewViewModelArg() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionFactsViewViewModelArg value)  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsViewViewModelArg():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionFactsViewViewModelArg value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsViewViewModelArg() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NutritionFacts> nutritionFacts,  List<Nutrient> nutrientDefaults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionFactsViewViewModelArg() when $default != null:
return $default(_that.nutritionFacts,_that.nutrientDefaults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NutritionFacts> nutritionFacts,  List<Nutrient> nutrientDefaults)  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsViewViewModelArg():
return $default(_that.nutritionFacts,_that.nutrientDefaults);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NutritionFacts> nutritionFacts,  List<Nutrient> nutrientDefaults)?  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsViewViewModelArg() when $default != null:
return $default(_that.nutritionFacts,_that.nutrientDefaults);case _:
  return null;

}
}

}

/// @nodoc


class _NutritionFactsViewViewModelArg implements NutritionFactsViewViewModelArg {
  const _NutritionFactsViewViewModelArg({required final  List<NutritionFacts> nutritionFacts, required final  List<Nutrient> nutrientDefaults}): _nutritionFacts = nutritionFacts,_nutrientDefaults = nutrientDefaults;
  

 final  List<NutritionFacts> _nutritionFacts;
@override List<NutritionFacts> get nutritionFacts {
  if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nutritionFacts);
}

 final  List<Nutrient> _nutrientDefaults;
@override List<Nutrient> get nutrientDefaults {
  if (_nutrientDefaults is EqualUnmodifiableListView) return _nutrientDefaults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nutrientDefaults);
}


/// Create a copy of NutritionFactsViewViewModelArg
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionFactsViewViewModelArgCopyWith<_NutritionFactsViewViewModelArg> get copyWith => __$NutritionFactsViewViewModelArgCopyWithImpl<_NutritionFactsViewViewModelArg>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionFactsViewViewModelArg&&const DeepCollectionEquality().equals(other._nutritionFacts, _nutritionFacts)&&const DeepCollectionEquality().equals(other._nutrientDefaults, _nutrientDefaults));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nutritionFacts),const DeepCollectionEquality().hash(_nutrientDefaults));

@override
String toString() {
  return 'NutritionFactsViewViewModelArg(nutritionFacts: $nutritionFacts, nutrientDefaults: $nutrientDefaults)';
}


}

/// @nodoc
abstract mixin class _$NutritionFactsViewViewModelArgCopyWith<$Res> implements $NutritionFactsViewViewModelArgCopyWith<$Res> {
  factory _$NutritionFactsViewViewModelArgCopyWith(_NutritionFactsViewViewModelArg value, $Res Function(_NutritionFactsViewViewModelArg) _then) = __$NutritionFactsViewViewModelArgCopyWithImpl;
@override @useResult
$Res call({
 List<NutritionFacts> nutritionFacts, List<Nutrient> nutrientDefaults
});




}
/// @nodoc
class __$NutritionFactsViewViewModelArgCopyWithImpl<$Res>
    implements _$NutritionFactsViewViewModelArgCopyWith<$Res> {
  __$NutritionFactsViewViewModelArgCopyWithImpl(this._self, this._then);

  final _NutritionFactsViewViewModelArg _self;
  final $Res Function(_NutritionFactsViewViewModelArg) _then;

/// Create a copy of NutritionFactsViewViewModelArg
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nutritionFacts = null,Object? nutrientDefaults = null,}) {
  return _then(_NutritionFactsViewViewModelArg(
nutritionFacts: null == nutritionFacts ? _self._nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFacts>,nutrientDefaults: null == nutrientDefaults ? _self._nutrientDefaults : nutrientDefaults // ignore: cast_nullable_to_non_nullable
as List<Nutrient>,
  ));
}


}

// dart format on
