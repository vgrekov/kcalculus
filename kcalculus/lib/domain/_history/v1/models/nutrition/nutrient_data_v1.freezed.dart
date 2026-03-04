// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_data_v1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientDataV1 {

 double get calories; double get fatInGrams; double get carbsInGrams; double get fiberInGrams; double get proteinInGrams;
/// Create a copy of NutrientDataV1
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientDataV1CopyWith<NutrientDataV1> get copyWith => _$NutrientDataV1CopyWithImpl<NutrientDataV1>(this as NutrientDataV1, _$identity);

  /// Serializes this NutrientDataV1 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientDataV1&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.fatInGrams, fatInGrams) || other.fatInGrams == fatInGrams)&&(identical(other.carbsInGrams, carbsInGrams) || other.carbsInGrams == carbsInGrams)&&(identical(other.fiberInGrams, fiberInGrams) || other.fiberInGrams == fiberInGrams)&&(identical(other.proteinInGrams, proteinInGrams) || other.proteinInGrams == proteinInGrams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,fatInGrams,carbsInGrams,fiberInGrams,proteinInGrams);

@override
String toString() {
  return 'NutrientDataV1(calories: $calories, fatInGrams: $fatInGrams, carbsInGrams: $carbsInGrams, fiberInGrams: $fiberInGrams, proteinInGrams: $proteinInGrams)';
}


}

/// @nodoc
abstract mixin class $NutrientDataV1CopyWith<$Res>  {
  factory $NutrientDataV1CopyWith(NutrientDataV1 value, $Res Function(NutrientDataV1) _then) = _$NutrientDataV1CopyWithImpl;
@useResult
$Res call({
 double calories, double fatInGrams, double carbsInGrams, double fiberInGrams, double proteinInGrams
});




}
/// @nodoc
class _$NutrientDataV1CopyWithImpl<$Res>
    implements $NutrientDataV1CopyWith<$Res> {
  _$NutrientDataV1CopyWithImpl(this._self, this._then);

  final NutrientDataV1 _self;
  final $Res Function(NutrientDataV1) _then;

/// Create a copy of NutrientDataV1
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? calories = null,Object? fatInGrams = null,Object? carbsInGrams = null,Object? fiberInGrams = null,Object? proteinInGrams = null,}) {
  return _then(_self.copyWith(
calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,fatInGrams: null == fatInGrams ? _self.fatInGrams : fatInGrams // ignore: cast_nullable_to_non_nullable
as double,carbsInGrams: null == carbsInGrams ? _self.carbsInGrams : carbsInGrams // ignore: cast_nullable_to_non_nullable
as double,fiberInGrams: null == fiberInGrams ? _self.fiberInGrams : fiberInGrams // ignore: cast_nullable_to_non_nullable
as double,proteinInGrams: null == proteinInGrams ? _self.proteinInGrams : proteinInGrams // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NutrientDataV1].
extension NutrientDataV1Patterns on NutrientDataV1 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutrientDataV1 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientDataV1() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutrientDataV1 value)  $default,){
final _that = this;
switch (_that) {
case _NutrientDataV1():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutrientDataV1 value)?  $default,){
final _that = this;
switch (_that) {
case _NutrientDataV1() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double calories,  double fatInGrams,  double carbsInGrams,  double fiberInGrams,  double proteinInGrams)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientDataV1() when $default != null:
return $default(_that.calories,_that.fatInGrams,_that.carbsInGrams,_that.fiberInGrams,_that.proteinInGrams);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double calories,  double fatInGrams,  double carbsInGrams,  double fiberInGrams,  double proteinInGrams)  $default,) {final _that = this;
switch (_that) {
case _NutrientDataV1():
return $default(_that.calories,_that.fatInGrams,_that.carbsInGrams,_that.fiberInGrams,_that.proteinInGrams);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double calories,  double fatInGrams,  double carbsInGrams,  double fiberInGrams,  double proteinInGrams)?  $default,) {final _that = this;
switch (_that) {
case _NutrientDataV1() when $default != null:
return $default(_that.calories,_that.fatInGrams,_that.carbsInGrams,_that.fiberInGrams,_that.proteinInGrams);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutrientDataV1 implements NutrientDataV1 {
  const _NutrientDataV1({required this.calories, required this.fatInGrams, required this.carbsInGrams, required this.fiberInGrams, required this.proteinInGrams});
  factory _NutrientDataV1.fromJson(Map<String, dynamic> json) => _$NutrientDataV1FromJson(json);

@override final  double calories;
@override final  double fatInGrams;
@override final  double carbsInGrams;
@override final  double fiberInGrams;
@override final  double proteinInGrams;

/// Create a copy of NutrientDataV1
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientDataV1CopyWith<_NutrientDataV1> get copyWith => __$NutrientDataV1CopyWithImpl<_NutrientDataV1>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutrientDataV1ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientDataV1&&(identical(other.calories, calories) || other.calories == calories)&&(identical(other.fatInGrams, fatInGrams) || other.fatInGrams == fatInGrams)&&(identical(other.carbsInGrams, carbsInGrams) || other.carbsInGrams == carbsInGrams)&&(identical(other.fiberInGrams, fiberInGrams) || other.fiberInGrams == fiberInGrams)&&(identical(other.proteinInGrams, proteinInGrams) || other.proteinInGrams == proteinInGrams));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,calories,fatInGrams,carbsInGrams,fiberInGrams,proteinInGrams);

@override
String toString() {
  return 'NutrientDataV1(calories: $calories, fatInGrams: $fatInGrams, carbsInGrams: $carbsInGrams, fiberInGrams: $fiberInGrams, proteinInGrams: $proteinInGrams)';
}


}

/// @nodoc
abstract mixin class _$NutrientDataV1CopyWith<$Res> implements $NutrientDataV1CopyWith<$Res> {
  factory _$NutrientDataV1CopyWith(_NutrientDataV1 value, $Res Function(_NutrientDataV1) _then) = __$NutrientDataV1CopyWithImpl;
@override @useResult
$Res call({
 double calories, double fatInGrams, double carbsInGrams, double fiberInGrams, double proteinInGrams
});




}
/// @nodoc
class __$NutrientDataV1CopyWithImpl<$Res>
    implements _$NutrientDataV1CopyWith<$Res> {
  __$NutrientDataV1CopyWithImpl(this._self, this._then);

  final _NutrientDataV1 _self;
  final $Res Function(_NutrientDataV1) _then;

/// Create a copy of NutrientDataV1
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? calories = null,Object? fatInGrams = null,Object? carbsInGrams = null,Object? fiberInGrams = null,Object? proteinInGrams = null,}) {
  return _then(_NutrientDataV1(
calories: null == calories ? _self.calories : calories // ignore: cast_nullable_to_non_nullable
as double,fatInGrams: null == fatInGrams ? _self.fatInGrams : fatInGrams // ignore: cast_nullable_to_non_nullable
as double,carbsInGrams: null == carbsInGrams ? _self.carbsInGrams : carbsInGrams // ignore: cast_nullable_to_non_nullable
as double,fiberInGrams: null == fiberInGrams ? _self.fiberInGrams : fiberInGrams // ignore: cast_nullable_to_non_nullable
as double,proteinInGrams: null == proteinInGrams ? _self.proteinInGrams : proteinInGrams // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
