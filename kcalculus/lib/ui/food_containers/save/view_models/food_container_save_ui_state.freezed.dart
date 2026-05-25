// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_container_save_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FoodContainerSaveUiState {

 String? get id; String get name; String get description; Unit get weightUnit; double? get weightValue;
/// Create a copy of FoodContainerSaveUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodContainerSaveUiStateCopyWith<FoodContainerSaveUiState> get copyWith => _$FoodContainerSaveUiStateCopyWithImpl<FoodContainerSaveUiState>(this as FoodContainerSaveUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodContainerSaveUiState&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&(identical(other.weightValue, weightValue) || other.weightValue == weightValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,weightUnit,weightValue);

@override
String toString() {
  return 'FoodContainerSaveUiState(id: $id, name: $name, description: $description, weightUnit: $weightUnit, weightValue: $weightValue)';
}


}

/// @nodoc
abstract mixin class $FoodContainerSaveUiStateCopyWith<$Res>  {
  factory $FoodContainerSaveUiStateCopyWith(FoodContainerSaveUiState value, $Res Function(FoodContainerSaveUiState) _then) = _$FoodContainerSaveUiStateCopyWithImpl;
@useResult
$Res call({
 String? id, String name, String description, Unit weightUnit, double? weightValue
});




}
/// @nodoc
class _$FoodContainerSaveUiStateCopyWithImpl<$Res>
    implements $FoodContainerSaveUiStateCopyWith<$Res> {
  _$FoodContainerSaveUiStateCopyWithImpl(this._self, this._then);

  final FoodContainerSaveUiState _self;
  final $Res Function(FoodContainerSaveUiState) _then;

/// Create a copy of FoodContainerSaveUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? weightUnit = null,Object? weightValue = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,weightUnit: null == weightUnit ? _self.weightUnit : weightUnit // ignore: cast_nullable_to_non_nullable
as Unit,weightValue: freezed == weightValue ? _self.weightValue : weightValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodContainerSaveUiState].
extension FoodContainerSaveUiStatePatterns on FoodContainerSaveUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodContainerSaveUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodContainerSaveUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodContainerSaveUiState value)  $default,){
final _that = this;
switch (_that) {
case _FoodContainerSaveUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodContainerSaveUiState value)?  $default,){
final _that = this;
switch (_that) {
case _FoodContainerSaveUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String description,  Unit weightUnit,  double? weightValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodContainerSaveUiState() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.weightUnit,_that.weightValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String description,  Unit weightUnit,  double? weightValue)  $default,) {final _that = this;
switch (_that) {
case _FoodContainerSaveUiState():
return $default(_that.id,_that.name,_that.description,_that.weightUnit,_that.weightValue);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String description,  Unit weightUnit,  double? weightValue)?  $default,) {final _that = this;
switch (_that) {
case _FoodContainerSaveUiState() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.weightUnit,_that.weightValue);case _:
  return null;

}
}

}

/// @nodoc


class _FoodContainerSaveUiState extends FoodContainerSaveUiState {
  const _FoodContainerSaveUiState({this.id, this.name = '', this.description = '', this.weightUnit = Unit.gram, this.weightValue}): super._();
  

@override final  String? id;
@override@JsonKey() final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  Unit weightUnit;
@override final  double? weightValue;

/// Create a copy of FoodContainerSaveUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodContainerSaveUiStateCopyWith<_FoodContainerSaveUiState> get copyWith => __$FoodContainerSaveUiStateCopyWithImpl<_FoodContainerSaveUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodContainerSaveUiState&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.weightUnit, weightUnit) || other.weightUnit == weightUnit)&&(identical(other.weightValue, weightValue) || other.weightValue == weightValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,weightUnit,weightValue);

@override
String toString() {
  return 'FoodContainerSaveUiState(id: $id, name: $name, description: $description, weightUnit: $weightUnit, weightValue: $weightValue)';
}


}

/// @nodoc
abstract mixin class _$FoodContainerSaveUiStateCopyWith<$Res> implements $FoodContainerSaveUiStateCopyWith<$Res> {
  factory _$FoodContainerSaveUiStateCopyWith(_FoodContainerSaveUiState value, $Res Function(_FoodContainerSaveUiState) _then) = __$FoodContainerSaveUiStateCopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String description, Unit weightUnit, double? weightValue
});




}
/// @nodoc
class __$FoodContainerSaveUiStateCopyWithImpl<$Res>
    implements _$FoodContainerSaveUiStateCopyWith<$Res> {
  __$FoodContainerSaveUiStateCopyWithImpl(this._self, this._then);

  final _FoodContainerSaveUiState _self;
  final $Res Function(_FoodContainerSaveUiState) _then;

/// Create a copy of FoodContainerSaveUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? weightUnit = null,Object? weightValue = freezed,}) {
  return _then(_FoodContainerSaveUiState(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,weightUnit: null == weightUnit ? _self.weightUnit : weightUnit // ignore: cast_nullable_to_non_nullable
as Unit,weightValue: freezed == weightValue ? _self.weightValue : weightValue // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
