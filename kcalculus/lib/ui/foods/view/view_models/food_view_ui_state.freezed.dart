// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_view_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FoodViewUiState {

 Food get food; List<Nutrient> get nutrientDefaults;
/// Create a copy of FoodViewUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodViewUiStateCopyWith<FoodViewUiState> get copyWith => _$FoodViewUiStateCopyWithImpl<FoodViewUiState>(this as FoodViewUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodViewUiState&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other.nutrientDefaults, nutrientDefaults));
}


@override
int get hashCode => Object.hash(runtimeType,food,const DeepCollectionEquality().hash(nutrientDefaults));

@override
String toString() {
  return 'FoodViewUiState(food: $food, nutrientDefaults: $nutrientDefaults)';
}


}

/// @nodoc
abstract mixin class $FoodViewUiStateCopyWith<$Res>  {
  factory $FoodViewUiStateCopyWith(FoodViewUiState value, $Res Function(FoodViewUiState) _then) = _$FoodViewUiStateCopyWithImpl;
@useResult
$Res call({
 Food food, List<Nutrient> nutrientDefaults
});


$FoodCopyWith<$Res> get food;

}
/// @nodoc
class _$FoodViewUiStateCopyWithImpl<$Res>
    implements $FoodViewUiStateCopyWith<$Res> {
  _$FoodViewUiStateCopyWithImpl(this._self, this._then);

  final FoodViewUiState _self;
  final $Res Function(FoodViewUiState) _then;

/// Create a copy of FoodViewUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? food = null,Object? nutrientDefaults = null,}) {
  return _then(_self.copyWith(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as Food,nutrientDefaults: null == nutrientDefaults ? _self.nutrientDefaults : nutrientDefaults // ignore: cast_nullable_to_non_nullable
as List<Nutrient>,
  ));
}
/// Create a copy of FoodViewUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodCopyWith<$Res> get food {
  
  return $FoodCopyWith<$Res>(_self.food, (value) {
    return _then(_self.copyWith(food: value));
  });
}
}


/// Adds pattern-matching-related methods to [FoodViewUiState].
extension FoodViewUiStatePatterns on FoodViewUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodViewUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodViewUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodViewUiState value)  $default,){
final _that = this;
switch (_that) {
case _FoodViewUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodViewUiState value)?  $default,){
final _that = this;
switch (_that) {
case _FoodViewUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Food food,  List<Nutrient> nutrientDefaults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodViewUiState() when $default != null:
return $default(_that.food,_that.nutrientDefaults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Food food,  List<Nutrient> nutrientDefaults)  $default,) {final _that = this;
switch (_that) {
case _FoodViewUiState():
return $default(_that.food,_that.nutrientDefaults);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Food food,  List<Nutrient> nutrientDefaults)?  $default,) {final _that = this;
switch (_that) {
case _FoodViewUiState() when $default != null:
return $default(_that.food,_that.nutrientDefaults);case _:
  return null;

}
}

}

/// @nodoc


class _FoodViewUiState implements FoodViewUiState {
  const _FoodViewUiState({required this.food, required final  List<Nutrient> nutrientDefaults}): _nutrientDefaults = nutrientDefaults;
  

@override final  Food food;
 final  List<Nutrient> _nutrientDefaults;
@override List<Nutrient> get nutrientDefaults {
  if (_nutrientDefaults is EqualUnmodifiableListView) return _nutrientDefaults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nutrientDefaults);
}


/// Create a copy of FoodViewUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodViewUiStateCopyWith<_FoodViewUiState> get copyWith => __$FoodViewUiStateCopyWithImpl<_FoodViewUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodViewUiState&&(identical(other.food, food) || other.food == food)&&const DeepCollectionEquality().equals(other._nutrientDefaults, _nutrientDefaults));
}


@override
int get hashCode => Object.hash(runtimeType,food,const DeepCollectionEquality().hash(_nutrientDefaults));

@override
String toString() {
  return 'FoodViewUiState(food: $food, nutrientDefaults: $nutrientDefaults)';
}


}

/// @nodoc
abstract mixin class _$FoodViewUiStateCopyWith<$Res> implements $FoodViewUiStateCopyWith<$Res> {
  factory _$FoodViewUiStateCopyWith(_FoodViewUiState value, $Res Function(_FoodViewUiState) _then) = __$FoodViewUiStateCopyWithImpl;
@override @useResult
$Res call({
 Food food, List<Nutrient> nutrientDefaults
});


@override $FoodCopyWith<$Res> get food;

}
/// @nodoc
class __$FoodViewUiStateCopyWithImpl<$Res>
    implements _$FoodViewUiStateCopyWith<$Res> {
  __$FoodViewUiStateCopyWithImpl(this._self, this._then);

  final _FoodViewUiState _self;
  final $Res Function(_FoodViewUiState) _then;

/// Create a copy of FoodViewUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? food = null,Object? nutrientDefaults = null,}) {
  return _then(_FoodViewUiState(
food: null == food ? _self.food : food // ignore: cast_nullable_to_non_nullable
as Food,nutrientDefaults: null == nutrientDefaults ? _self._nutrientDefaults : nutrientDefaults // ignore: cast_nullable_to_non_nullable
as List<Nutrient>,
  ));
}

/// Create a copy of FoodViewUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FoodCopyWith<$Res> get food {
  
  return $FoodCopyWith<$Res>(_self.food, (value) {
    return _then(_self.copyWith(food: value));
  });
}
}

// dart format on
