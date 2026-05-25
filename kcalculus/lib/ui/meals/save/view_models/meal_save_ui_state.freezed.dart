// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_save_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MealSaveUiState {

 String? get id; DateTime get eatenAt; Portion? get portion;
/// Create a copy of MealSaveUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealSaveUiStateCopyWith<MealSaveUiState> get copyWith => _$MealSaveUiStateCopyWithImpl<MealSaveUiState>(this as MealSaveUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealSaveUiState&&(identical(other.id, id) || other.id == id)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.portion, portion) || other.portion == portion));
}


@override
int get hashCode => Object.hash(runtimeType,id,eatenAt,portion);

@override
String toString() {
  return 'MealSaveUiState(id: $id, eatenAt: $eatenAt, portion: $portion)';
}


}

/// @nodoc
abstract mixin class $MealSaveUiStateCopyWith<$Res>  {
  factory $MealSaveUiStateCopyWith(MealSaveUiState value, $Res Function(MealSaveUiState) _then) = _$MealSaveUiStateCopyWithImpl;
@useResult
$Res call({
 String? id, DateTime eatenAt, Portion? portion
});




}
/// @nodoc
class _$MealSaveUiStateCopyWithImpl<$Res>
    implements $MealSaveUiStateCopyWith<$Res> {
  _$MealSaveUiStateCopyWithImpl(this._self, this._then);

  final MealSaveUiState _self;
  final $Res Function(MealSaveUiState) _then;

/// Create a copy of MealSaveUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? eatenAt = null,Object? portion = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,eatenAt: null == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as DateTime,portion: freezed == portion ? _self.portion : portion // ignore: cast_nullable_to_non_nullable
as Portion?,
  ));
}

}


/// Adds pattern-matching-related methods to [MealSaveUiState].
extension MealSaveUiStatePatterns on MealSaveUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _MealSaveUiState value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealSaveUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _MealSaveUiState value)  $default,}){
final _that = this;
switch (_that) {
case _MealSaveUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _MealSaveUiState value)?  $default,}){
final _that = this;
switch (_that) {
case _MealSaveUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? id,  DateTime eatenAt,  Portion? portion)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealSaveUiState() when $default != null:
return $default(_that.id,_that.eatenAt,_that.portion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? id,  DateTime eatenAt,  Portion? portion)  $default,}) {final _that = this;
switch (_that) {
case _MealSaveUiState():
return $default(_that.id,_that.eatenAt,_that.portion);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? id,  DateTime eatenAt,  Portion? portion)?  $default,}) {final _that = this;
switch (_that) {
case _MealSaveUiState() when $default != null:
return $default(_that.id,_that.eatenAt,_that.portion);case _:
  return null;

}
}

}

/// @nodoc


class _MealSaveUiState extends MealSaveUiState {
  const _MealSaveUiState({this.id, required this.eatenAt, this.portion}): super._();
  

@override final  String? id;
@override final  DateTime eatenAt;
@override final  Portion? portion;

/// Create a copy of MealSaveUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealSaveUiStateCopyWith<_MealSaveUiState> get copyWith => __$MealSaveUiStateCopyWithImpl<_MealSaveUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealSaveUiState&&(identical(other.id, id) || other.id == id)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.portion, portion) || other.portion == portion));
}


@override
int get hashCode => Object.hash(runtimeType,id,eatenAt,portion);

@override
String toString() {
  return 'MealSaveUiState.\$default(id: $id, eatenAt: $eatenAt, portion: $portion)';
}


}

/// @nodoc
abstract mixin class _$MealSaveUiStateCopyWith<$Res> implements $MealSaveUiStateCopyWith<$Res> {
  factory _$MealSaveUiStateCopyWith(_MealSaveUiState value, $Res Function(_MealSaveUiState) _then) = __$MealSaveUiStateCopyWithImpl;
@override @useResult
$Res call({
 String? id, DateTime eatenAt, Portion? portion
});




}
/// @nodoc
class __$MealSaveUiStateCopyWithImpl<$Res>
    implements _$MealSaveUiStateCopyWith<$Res> {
  __$MealSaveUiStateCopyWithImpl(this._self, this._then);

  final _MealSaveUiState _self;
  final $Res Function(_MealSaveUiState) _then;

/// Create a copy of MealSaveUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? eatenAt = null,Object? portion = freezed,}) {
  return _then(_MealSaveUiState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,eatenAt: null == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as DateTime,portion: freezed == portion ? _self.portion : portion // ignore: cast_nullable_to_non_nullable
as Portion?,
  ));
}


}

// dart format on
