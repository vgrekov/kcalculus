// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_save_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FoodSaveUiState {

 String? get id; String get name; String get description; List<NutritionFacts>? get nutritionFacts;
/// Create a copy of FoodSaveUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodSaveUiStateCopyWith<FoodSaveUiState> get copyWith => _$FoodSaveUiStateCopyWithImpl<FoodSaveUiState>(this as FoodSaveUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodSaveUiState&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.nutritionFacts, nutritionFacts));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(nutritionFacts));

@override
String toString() {
  return 'FoodSaveUiState(id: $id, name: $name, description: $description, nutritionFacts: $nutritionFacts)';
}


}

/// @nodoc
abstract mixin class $FoodSaveUiStateCopyWith<$Res>  {
  factory $FoodSaveUiStateCopyWith(FoodSaveUiState value, $Res Function(FoodSaveUiState) _then) = _$FoodSaveUiStateCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String description, List<NutritionFacts>? nutritionFacts
});




}
/// @nodoc
class _$FoodSaveUiStateCopyWithImpl<$Res>
    implements $FoodSaveUiStateCopyWith<$Res> {
  _$FoodSaveUiStateCopyWithImpl(this._self, this._then);

  final FoodSaveUiState _self;
  final $Res Function(FoodSaveUiState) _then;

/// Create a copy of FoodSaveUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? nutritionFacts = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,nutritionFacts: freezed == nutritionFacts ? _self.nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFacts>?,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodSaveUiState].
extension FoodSaveUiStatePatterns on FoodSaveUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodSaveUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodSaveUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodSaveUiState value)  $default,){
final _that = this;
switch (_that) {
case _FoodSaveUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodSaveUiState value)?  $default,){
final _that = this;
switch (_that) {
case _FoodSaveUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String description,  List<NutritionFacts>? nutritionFacts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodSaveUiState() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.nutritionFacts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String description,  List<NutritionFacts>? nutritionFacts)  $default,) {final _that = this;
switch (_that) {
case _FoodSaveUiState():
return $default(_that.id,_that.name,_that.description,_that.nutritionFacts);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String description,  List<NutritionFacts>? nutritionFacts)?  $default,) {final _that = this;
switch (_that) {
case _FoodSaveUiState() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.nutritionFacts);case _:
  return null;

}
}

}

/// @nodoc


class _FoodSaveUiState extends FoodSaveUiState {
  const _FoodSaveUiState({this.id, this.name = '', this.description = '', final  List<NutritionFacts>? nutritionFacts}): _nutritionFacts = nutritionFacts,super._();
  

@override final  String? id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
 final  List<NutritionFacts>? _nutritionFacts;
@override List<NutritionFacts>? get nutritionFacts {
  final value = _nutritionFacts;
  if (value == null) return null;
  if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of FoodSaveUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodSaveUiStateCopyWith<_FoodSaveUiState> get copyWith => __$FoodSaveUiStateCopyWithImpl<_FoodSaveUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodSaveUiState&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._nutritionFacts, _nutritionFacts));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_nutritionFacts));

@override
String toString() {
  return 'FoodSaveUiState(id: $id, name: $name, description: $description, nutritionFacts: $nutritionFacts)';
}


}

/// @nodoc
abstract mixin class _$FoodSaveUiStateCopyWith<$Res> implements $FoodSaveUiStateCopyWith<$Res> {
  factory _$FoodSaveUiStateCopyWith(_FoodSaveUiState value, $Res Function(_FoodSaveUiState) _then) = __$FoodSaveUiStateCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String description, List<NutritionFacts>? nutritionFacts
});




}
/// @nodoc
class __$FoodSaveUiStateCopyWithImpl<$Res>
    implements _$FoodSaveUiStateCopyWith<$Res> {
  __$FoodSaveUiStateCopyWithImpl(this._self, this._then);

  final _FoodSaveUiState _self;
  final $Res Function(_FoodSaveUiState) _then;

/// Create a copy of FoodSaveUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? nutritionFacts = freezed,}) {
  return _then(_FoodSaveUiState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,nutritionFacts: freezed == nutritionFacts ? _self._nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFacts>?,
  ));
}


}

// dart format on
