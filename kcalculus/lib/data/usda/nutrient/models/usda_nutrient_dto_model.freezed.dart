// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usda_nutrient_dto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsdaNutrientDtoModel {

 String get number; double get amount; String get unitName;
/// Create a copy of UsdaNutrientDtoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsdaNutrientDtoModelCopyWith<UsdaNutrientDtoModel> get copyWith => _$UsdaNutrientDtoModelCopyWithImpl<UsdaNutrientDtoModel>(this as UsdaNutrientDtoModel, _$identity);

  /// Serializes this UsdaNutrientDtoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsdaNutrientDtoModel&&(identical(other.number, number) || other.number == number)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unitName, unitName) || other.unitName == unitName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,amount,unitName);

@override
String toString() {
  return 'UsdaNutrientDtoModel(number: $number, amount: $amount, unitName: $unitName)';
}


}

/// @nodoc
abstract mixin class $UsdaNutrientDtoModelCopyWith<$Res>  {
  factory $UsdaNutrientDtoModelCopyWith(UsdaNutrientDtoModel value, $Res Function(UsdaNutrientDtoModel) _then) = _$UsdaNutrientDtoModelCopyWithImpl;
@useResult
$Res call({
 String number, double amount, String unitName
});




}
/// @nodoc
class _$UsdaNutrientDtoModelCopyWithImpl<$Res>
    implements $UsdaNutrientDtoModelCopyWith<$Res> {
  _$UsdaNutrientDtoModelCopyWithImpl(this._self, this._then);

  final UsdaNutrientDtoModel _self;
  final $Res Function(UsdaNutrientDtoModel) _then;

/// Create a copy of UsdaNutrientDtoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? amount = null,Object? unitName = null,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unitName: null == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UsdaNutrientDtoModel].
extension UsdaNutrientDtoModelPatterns on UsdaNutrientDtoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsdaNutrientDtoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsdaNutrientDtoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsdaNutrientDtoModel value)  $default,){
final _that = this;
switch (_that) {
case _UsdaNutrientDtoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsdaNutrientDtoModel value)?  $default,){
final _that = this;
switch (_that) {
case _UsdaNutrientDtoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String number,  double amount,  String unitName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsdaNutrientDtoModel() when $default != null:
return $default(_that.number,_that.amount,_that.unitName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String number,  double amount,  String unitName)  $default,) {final _that = this;
switch (_that) {
case _UsdaNutrientDtoModel():
return $default(_that.number,_that.amount,_that.unitName);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String number,  double amount,  String unitName)?  $default,) {final _that = this;
switch (_that) {
case _UsdaNutrientDtoModel() when $default != null:
return $default(_that.number,_that.amount,_that.unitName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsdaNutrientDtoModel implements UsdaNutrientDtoModel {
  const _UsdaNutrientDtoModel({required this.number, required this.amount, required this.unitName});
  factory _UsdaNutrientDtoModel.fromJson(Map<String, dynamic> json) => _$UsdaNutrientDtoModelFromJson(json);

@override final  String number;
@override final  double amount;
@override final  String unitName;

/// Create a copy of UsdaNutrientDtoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsdaNutrientDtoModelCopyWith<_UsdaNutrientDtoModel> get copyWith => __$UsdaNutrientDtoModelCopyWithImpl<_UsdaNutrientDtoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsdaNutrientDtoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsdaNutrientDtoModel&&(identical(other.number, number) || other.number == number)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.unitName, unitName) || other.unitName == unitName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,amount,unitName);

@override
String toString() {
  return 'UsdaNutrientDtoModel(number: $number, amount: $amount, unitName: $unitName)';
}


}

/// @nodoc
abstract mixin class _$UsdaNutrientDtoModelCopyWith<$Res> implements $UsdaNutrientDtoModelCopyWith<$Res> {
  factory _$UsdaNutrientDtoModelCopyWith(_UsdaNutrientDtoModel value, $Res Function(_UsdaNutrientDtoModel) _then) = __$UsdaNutrientDtoModelCopyWithImpl;
@override @useResult
$Res call({
 String number, double amount, String unitName
});




}
/// @nodoc
class __$UsdaNutrientDtoModelCopyWithImpl<$Res>
    implements _$UsdaNutrientDtoModelCopyWith<$Res> {
  __$UsdaNutrientDtoModelCopyWithImpl(this._self, this._then);

  final _UsdaNutrientDtoModel _self;
  final $Res Function(_UsdaNutrientDtoModel) _then;

/// Create a copy of UsdaNutrientDtoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? amount = null,Object? unitName = null,}) {
  return _then(_UsdaNutrientDtoModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,unitName: null == unitName ? _self.unitName : unitName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
