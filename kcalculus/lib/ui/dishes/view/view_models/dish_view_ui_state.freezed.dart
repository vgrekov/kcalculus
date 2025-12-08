// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dish_view_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DishViewUiState {

 Dish get dish; List<Nutrient> get nutrientDefaults;
/// Create a copy of DishViewUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DishViewUiStateCopyWith<DishViewUiState> get copyWith => _$DishViewUiStateCopyWithImpl<DishViewUiState>(this as DishViewUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DishViewUiState&&(identical(other.dish, dish) || other.dish == dish)&&const DeepCollectionEquality().equals(other.nutrientDefaults, nutrientDefaults));
}


@override
int get hashCode => Object.hash(runtimeType,dish,const DeepCollectionEquality().hash(nutrientDefaults));

@override
String toString() {
  return 'DishViewUiState(dish: $dish, nutrientDefaults: $nutrientDefaults)';
}


}

/// @nodoc
abstract mixin class $DishViewUiStateCopyWith<$Res>  {
  factory $DishViewUiStateCopyWith(DishViewUiState value, $Res Function(DishViewUiState) _then) = _$DishViewUiStateCopyWithImpl;
@useResult
$Res call({
 Dish dish, List<Nutrient> nutrientDefaults
});


$DishCopyWith<$Res> get dish;

}
/// @nodoc
class _$DishViewUiStateCopyWithImpl<$Res>
    implements $DishViewUiStateCopyWith<$Res> {
  _$DishViewUiStateCopyWithImpl(this._self, this._then);

  final DishViewUiState _self;
  final $Res Function(DishViewUiState) _then;

/// Create a copy of DishViewUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dish = null,Object? nutrientDefaults = null,}) {
  return _then(_self.copyWith(
dish: null == dish ? _self.dish : dish // ignore: cast_nullable_to_non_nullable
as Dish,nutrientDefaults: null == nutrientDefaults ? _self.nutrientDefaults : nutrientDefaults // ignore: cast_nullable_to_non_nullable
as List<Nutrient>,
  ));
}
/// Create a copy of DishViewUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DishCopyWith<$Res> get dish {
  
  return $DishCopyWith<$Res>(_self.dish, (value) {
    return _then(_self.copyWith(dish: value));
  });
}
}


/// Adds pattern-matching-related methods to [DishViewUiState].
extension DishViewUiStatePatterns on DishViewUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DishViewUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DishViewUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DishViewUiState value)  $default,){
final _that = this;
switch (_that) {
case _DishViewUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DishViewUiState value)?  $default,){
final _that = this;
switch (_that) {
case _DishViewUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Dish dish,  List<Nutrient> nutrientDefaults)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DishViewUiState() when $default != null:
return $default(_that.dish,_that.nutrientDefaults);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Dish dish,  List<Nutrient> nutrientDefaults)  $default,) {final _that = this;
switch (_that) {
case _DishViewUiState():
return $default(_that.dish,_that.nutrientDefaults);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Dish dish,  List<Nutrient> nutrientDefaults)?  $default,) {final _that = this;
switch (_that) {
case _DishViewUiState() when $default != null:
return $default(_that.dish,_that.nutrientDefaults);case _:
  return null;

}
}

}

/// @nodoc


class _DishViewUiState implements DishViewUiState {
  const _DishViewUiState({required this.dish, required final  List<Nutrient> nutrientDefaults}): _nutrientDefaults = nutrientDefaults;
  

@override final  Dish dish;
 final  List<Nutrient> _nutrientDefaults;
@override List<Nutrient> get nutrientDefaults {
  if (_nutrientDefaults is EqualUnmodifiableListView) return _nutrientDefaults;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nutrientDefaults);
}


/// Create a copy of DishViewUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DishViewUiStateCopyWith<_DishViewUiState> get copyWith => __$DishViewUiStateCopyWithImpl<_DishViewUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DishViewUiState&&(identical(other.dish, dish) || other.dish == dish)&&const DeepCollectionEquality().equals(other._nutrientDefaults, _nutrientDefaults));
}


@override
int get hashCode => Object.hash(runtimeType,dish,const DeepCollectionEquality().hash(_nutrientDefaults));

@override
String toString() {
  return 'DishViewUiState(dish: $dish, nutrientDefaults: $nutrientDefaults)';
}


}

/// @nodoc
abstract mixin class _$DishViewUiStateCopyWith<$Res> implements $DishViewUiStateCopyWith<$Res> {
  factory _$DishViewUiStateCopyWith(_DishViewUiState value, $Res Function(_DishViewUiState) _then) = __$DishViewUiStateCopyWithImpl;
@override @useResult
$Res call({
 Dish dish, List<Nutrient> nutrientDefaults
});


@override $DishCopyWith<$Res> get dish;

}
/// @nodoc
class __$DishViewUiStateCopyWithImpl<$Res>
    implements _$DishViewUiStateCopyWith<$Res> {
  __$DishViewUiStateCopyWithImpl(this._self, this._then);

  final _DishViewUiState _self;
  final $Res Function(_DishViewUiState) _then;

/// Create a copy of DishViewUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dish = null,Object? nutrientDefaults = null,}) {
  return _then(_DishViewUiState(
dish: null == dish ? _self.dish : dish // ignore: cast_nullable_to_non_nullable
as Dish,nutrientDefaults: null == nutrientDefaults ? _self._nutrientDefaults : nutrientDefaults // ignore: cast_nullable_to_non_nullable
as List<Nutrient>,
  ));
}

/// Create a copy of DishViewUiState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DishCopyWith<$Res> get dish {
  
  return $DishCopyWith<$Res>(_self.dish, (value) {
    return _then(_self.copyWith(dish: value));
  });
}
}

// dart format on
