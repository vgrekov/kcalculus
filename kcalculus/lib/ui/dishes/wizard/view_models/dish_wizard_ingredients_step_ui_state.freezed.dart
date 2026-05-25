// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_wizard_ingredients_step_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DishWizardIngredientsStepUiState {

 List<Ingredient> get ingredients; List<Ingredient> get ingredientsPrev;
/// Create a copy of DishWizardIngredientsStepUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DishWizardIngredientsStepUiStateCopyWith<DishWizardIngredientsStepUiState> get copyWith => _$DishWizardIngredientsStepUiStateCopyWithImpl<DishWizardIngredientsStepUiState>(this as DishWizardIngredientsStepUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DishWizardIngredientsStepUiState&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.ingredientsPrev, ingredientsPrev));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(ingredientsPrev));

@override
String toString() {
  return 'DishWizardIngredientsStepUiState(ingredients: $ingredients, ingredientsPrev: $ingredientsPrev)';
}


}

/// @nodoc
abstract mixin class $DishWizardIngredientsStepUiStateCopyWith<$Res>  {
  factory $DishWizardIngredientsStepUiStateCopyWith(DishWizardIngredientsStepUiState value, $Res Function(DishWizardIngredientsStepUiState) _then) = _$DishWizardIngredientsStepUiStateCopyWithImpl;
@useResult
$Res call({
 List<Ingredient> ingredients, List<Ingredient> ingredientsPrev
});




}
/// @nodoc
class _$DishWizardIngredientsStepUiStateCopyWithImpl<$Res>
    implements $DishWizardIngredientsStepUiStateCopyWith<$Res> {
  _$DishWizardIngredientsStepUiStateCopyWithImpl(this._self, this._then);

  final DishWizardIngredientsStepUiState _self;
  final $Res Function(DishWizardIngredientsStepUiState) _then;

/// Create a copy of DishWizardIngredientsStepUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredients = null,Object? ingredientsPrev = null,}) {
  return _then(_self.copyWith(
ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,ingredientsPrev: null == ingredientsPrev ? _self.ingredientsPrev : ingredientsPrev // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,
  ));
}

}


/// Adds pattern-matching-related methods to [DishWizardIngredientsStepUiState].
extension DishWizardIngredientsStepUiStatePatterns on DishWizardIngredientsStepUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DishWizardIngredientsStepUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DishWizardIngredientsStepUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DishWizardIngredientsStepUiState value)  $default,){
final _that = this;
switch (_that) {
case _DishWizardIngredientsStepUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DishWizardIngredientsStepUiState value)?  $default,){
final _that = this;
switch (_that) {
case _DishWizardIngredientsStepUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Ingredient> ingredients,  List<Ingredient> ingredientsPrev)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DishWizardIngredientsStepUiState() when $default != null:
return $default(_that.ingredients,_that.ingredientsPrev);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Ingredient> ingredients,  List<Ingredient> ingredientsPrev)  $default,) {final _that = this;
switch (_that) {
case _DishWizardIngredientsStepUiState():
return $default(_that.ingredients,_that.ingredientsPrev);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Ingredient> ingredients,  List<Ingredient> ingredientsPrev)?  $default,) {final _that = this;
switch (_that) {
case _DishWizardIngredientsStepUiState() when $default != null:
return $default(_that.ingredients,_that.ingredientsPrev);case _:
  return null;

}
}

}

/// @nodoc


class _DishWizardIngredientsStepUiState extends DishWizardIngredientsStepUiState {
  const _DishWizardIngredientsStepUiState({final  List<Ingredient> ingredients = const [], final  List<Ingredient> ingredientsPrev = const []}): _ingredients = ingredients,_ingredientsPrev = ingredientsPrev,super._();
  

 final  List<Ingredient> _ingredients;
@override@JsonKey() List<Ingredient> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<Ingredient> _ingredientsPrev;
@override@JsonKey() List<Ingredient> get ingredientsPrev {
  if (_ingredientsPrev is EqualUnmodifiableListView) return _ingredientsPrev;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredientsPrev);
}


/// Create a copy of DishWizardIngredientsStepUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DishWizardIngredientsStepUiStateCopyWith<_DishWizardIngredientsStepUiState> get copyWith => __$DishWizardIngredientsStepUiStateCopyWithImpl<_DishWizardIngredientsStepUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DishWizardIngredientsStepUiState&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._ingredientsPrev, _ingredientsPrev));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_ingredientsPrev));

@override
String toString() {
  return 'DishWizardIngredientsStepUiState(ingredients: $ingredients, ingredientsPrev: $ingredientsPrev)';
}


}

/// @nodoc
abstract mixin class _$DishWizardIngredientsStepUiStateCopyWith<$Res> implements $DishWizardIngredientsStepUiStateCopyWith<$Res> {
  factory _$DishWizardIngredientsStepUiStateCopyWith(_DishWizardIngredientsStepUiState value, $Res Function(_DishWizardIngredientsStepUiState) _then) = __$DishWizardIngredientsStepUiStateCopyWithImpl;
@override @useResult
$Res call({
 List<Ingredient> ingredients, List<Ingredient> ingredientsPrev
});




}
/// @nodoc
class __$DishWizardIngredientsStepUiStateCopyWithImpl<$Res>
    implements _$DishWizardIngredientsStepUiStateCopyWith<$Res> {
  __$DishWizardIngredientsStepUiStateCopyWithImpl(this._self, this._then);

  final _DishWizardIngredientsStepUiState _self;
  final $Res Function(_DishWizardIngredientsStepUiState) _then;

/// Create a copy of DishWizardIngredientsStepUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredients = null,Object? ingredientsPrev = null,}) {
  return _then(_DishWizardIngredientsStepUiState(
ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,ingredientsPrev: null == ingredientsPrev ? _self._ingredientsPrev : ingredientsPrev // ignore: cast_nullable_to_non_nullable
as List<Ingredient>,
  ));
}


}

// dart format on
