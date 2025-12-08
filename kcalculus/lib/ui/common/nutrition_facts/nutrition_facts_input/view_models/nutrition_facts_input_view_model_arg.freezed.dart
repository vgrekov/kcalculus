// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_input_view_model_arg.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NutritionFactsInputViewModelArg {

 List<NutritionFacts>? get nutritionFacts; List<Nutrient> get defaultNutrients;
/// Create a copy of NutritionFactsInputViewModelArg
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionFactsInputViewModelArgCopyWith<NutritionFactsInputViewModelArg> get copyWith => _$NutritionFactsInputViewModelArgCopyWithImpl<NutritionFactsInputViewModelArg>(this as NutritionFactsInputViewModelArg, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionFactsInputViewModelArg&&const DeepCollectionEquality().equals(other.nutritionFacts, nutritionFacts)&&const DeepCollectionEquality().equals(other.defaultNutrients, defaultNutrients));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(nutritionFacts),const DeepCollectionEquality().hash(defaultNutrients));

@override
String toString() {
  return 'NutritionFactsInputViewModelArg(nutritionFacts: $nutritionFacts, defaultNutrients: $defaultNutrients)';
}


}

/// @nodoc
abstract mixin class $NutritionFactsInputViewModelArgCopyWith<$Res>  {
  factory $NutritionFactsInputViewModelArgCopyWith(NutritionFactsInputViewModelArg value, $Res Function(NutritionFactsInputViewModelArg) _then) = _$NutritionFactsInputViewModelArgCopyWithImpl;
@useResult
$Res call({
 List<NutritionFacts>? nutritionFacts, List<Nutrient> defaultNutrients
});




}
/// @nodoc
class _$NutritionFactsInputViewModelArgCopyWithImpl<$Res>
    implements $NutritionFactsInputViewModelArgCopyWith<$Res> {
  _$NutritionFactsInputViewModelArgCopyWithImpl(this._self, this._then);

  final NutritionFactsInputViewModelArg _self;
  final $Res Function(NutritionFactsInputViewModelArg) _then;

/// Create a copy of NutritionFactsInputViewModelArg
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nutritionFacts = freezed,Object? defaultNutrients = null,}) {
  return _then(_self.copyWith(
nutritionFacts: freezed == nutritionFacts ? _self.nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFacts>?,defaultNutrients: null == defaultNutrients ? _self.defaultNutrients : defaultNutrients // ignore: cast_nullable_to_non_nullable
as List<Nutrient>,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionFactsInputViewModelArg].
extension NutritionFactsInputViewModelArgPatterns on NutritionFactsInputViewModelArg {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionFactsInputViewModelArg value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionFactsInputViewModelArg() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionFactsInputViewModelArg value)  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsInputViewModelArg():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionFactsInputViewModelArg value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsInputViewModelArg() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<NutritionFacts>? nutritionFacts,  List<Nutrient> defaultNutrients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionFactsInputViewModelArg() when $default != null:
return $default(_that.nutritionFacts,_that.defaultNutrients);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<NutritionFacts>? nutritionFacts,  List<Nutrient> defaultNutrients)  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsInputViewModelArg():
return $default(_that.nutritionFacts,_that.defaultNutrients);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<NutritionFacts>? nutritionFacts,  List<Nutrient> defaultNutrients)?  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsInputViewModelArg() when $default != null:
return $default(_that.nutritionFacts,_that.defaultNutrients);case _:
  return null;

}
}

}

/// @nodoc


class _NutritionFactsInputViewModelArg implements NutritionFactsInputViewModelArg {
  const _NutritionFactsInputViewModelArg({final  List<NutritionFacts>? nutritionFacts, required final  List<Nutrient> defaultNutrients}): _nutritionFacts = nutritionFacts,_defaultNutrients = defaultNutrients;
  

 final  List<NutritionFacts>? _nutritionFacts;
@override List<NutritionFacts>? get nutritionFacts {
  final value = _nutritionFacts;
  if (value == null) return null;
  if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Nutrient> _defaultNutrients;
@override List<Nutrient> get defaultNutrients {
  if (_defaultNutrients is EqualUnmodifiableListView) return _defaultNutrients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_defaultNutrients);
}


/// Create a copy of NutritionFactsInputViewModelArg
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionFactsInputViewModelArgCopyWith<_NutritionFactsInputViewModelArg> get copyWith => __$NutritionFactsInputViewModelArgCopyWithImpl<_NutritionFactsInputViewModelArg>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionFactsInputViewModelArg&&const DeepCollectionEquality().equals(other._nutritionFacts, _nutritionFacts)&&const DeepCollectionEquality().equals(other._defaultNutrients, _defaultNutrients));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_nutritionFacts),const DeepCollectionEquality().hash(_defaultNutrients));

@override
String toString() {
  return 'NutritionFactsInputViewModelArg(nutritionFacts: $nutritionFacts, defaultNutrients: $defaultNutrients)';
}


}

/// @nodoc
abstract mixin class _$NutritionFactsInputViewModelArgCopyWith<$Res> implements $NutritionFactsInputViewModelArgCopyWith<$Res> {
  factory _$NutritionFactsInputViewModelArgCopyWith(_NutritionFactsInputViewModelArg value, $Res Function(_NutritionFactsInputViewModelArg) _then) = __$NutritionFactsInputViewModelArgCopyWithImpl;
@override @useResult
$Res call({
 List<NutritionFacts>? nutritionFacts, List<Nutrient> defaultNutrients
});




}
/// @nodoc
class __$NutritionFactsInputViewModelArgCopyWithImpl<$Res>
    implements _$NutritionFactsInputViewModelArgCopyWith<$Res> {
  __$NutritionFactsInputViewModelArgCopyWithImpl(this._self, this._then);

  final _NutritionFactsInputViewModelArg _self;
  final $Res Function(_NutritionFactsInputViewModelArg) _then;

/// Create a copy of NutritionFactsInputViewModelArg
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nutritionFacts = freezed,Object? defaultNutrients = null,}) {
  return _then(_NutritionFactsInputViewModelArg(
nutritionFacts: freezed == nutritionFacts ? _self._nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFacts>?,defaultNutrients: null == defaultNutrients ? _self._defaultNutrients : defaultNutrients // ignore: cast_nullable_to_non_nullable
as List<Nutrient>,
  ));
}


}

// dart format on
