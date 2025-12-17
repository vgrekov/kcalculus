// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usda_portion_dto_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsdaPortionDtoModel {

 int get measureUnitId; double? get amount; double get gramWeight;
/// Create a copy of UsdaPortionDtoModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsdaPortionDtoModelCopyWith<UsdaPortionDtoModel> get copyWith => _$UsdaPortionDtoModelCopyWithImpl<UsdaPortionDtoModel>(this as UsdaPortionDtoModel, _$identity);

  /// Serializes this UsdaPortionDtoModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsdaPortionDtoModel&&(identical(other.measureUnitId, measureUnitId) || other.measureUnitId == measureUnitId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.gramWeight, gramWeight) || other.gramWeight == gramWeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,measureUnitId,amount,gramWeight);

@override
String toString() {
  return 'UsdaPortionDtoModel(measureUnitId: $measureUnitId, amount: $amount, gramWeight: $gramWeight)';
}


}

/// @nodoc
abstract mixin class $UsdaPortionDtoModelCopyWith<$Res>  {
  factory $UsdaPortionDtoModelCopyWith(UsdaPortionDtoModel value, $Res Function(UsdaPortionDtoModel) _then) = _$UsdaPortionDtoModelCopyWithImpl;
@useResult
$Res call({
 int measureUnitId, double? amount, double gramWeight
});




}
/// @nodoc
class _$UsdaPortionDtoModelCopyWithImpl<$Res>
    implements $UsdaPortionDtoModelCopyWith<$Res> {
  _$UsdaPortionDtoModelCopyWithImpl(this._self, this._then);

  final UsdaPortionDtoModel _self;
  final $Res Function(UsdaPortionDtoModel) _then;

/// Create a copy of UsdaPortionDtoModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? measureUnitId = null,Object? amount = freezed,Object? gramWeight = null,}) {
  return _then(_self.copyWith(
measureUnitId: null == measureUnitId ? _self.measureUnitId : measureUnitId // ignore: cast_nullable_to_non_nullable
as int,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,gramWeight: null == gramWeight ? _self.gramWeight : gramWeight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [UsdaPortionDtoModel].
extension UsdaPortionDtoModelPatterns on UsdaPortionDtoModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsdaPortionDtoModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsdaPortionDtoModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsdaPortionDtoModel value)  $default,){
final _that = this;
switch (_that) {
case _UsdaPortionDtoModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsdaPortionDtoModel value)?  $default,){
final _that = this;
switch (_that) {
case _UsdaPortionDtoModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int measureUnitId,  double? amount,  double gramWeight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsdaPortionDtoModel() when $default != null:
return $default(_that.measureUnitId,_that.amount,_that.gramWeight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int measureUnitId,  double? amount,  double gramWeight)  $default,) {final _that = this;
switch (_that) {
case _UsdaPortionDtoModel():
return $default(_that.measureUnitId,_that.amount,_that.gramWeight);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int measureUnitId,  double? amount,  double gramWeight)?  $default,) {final _that = this;
switch (_that) {
case _UsdaPortionDtoModel() when $default != null:
return $default(_that.measureUnitId,_that.amount,_that.gramWeight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsdaPortionDtoModel implements UsdaPortionDtoModel {
  const _UsdaPortionDtoModel({required this.measureUnitId, this.amount, required this.gramWeight});
  factory _UsdaPortionDtoModel.fromJson(Map<String, dynamic> json) => _$UsdaPortionDtoModelFromJson(json);

@override final  int measureUnitId;
@override final  double? amount;
@override final  double gramWeight;

/// Create a copy of UsdaPortionDtoModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsdaPortionDtoModelCopyWith<_UsdaPortionDtoModel> get copyWith => __$UsdaPortionDtoModelCopyWithImpl<_UsdaPortionDtoModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsdaPortionDtoModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsdaPortionDtoModel&&(identical(other.measureUnitId, measureUnitId) || other.measureUnitId == measureUnitId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.gramWeight, gramWeight) || other.gramWeight == gramWeight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,measureUnitId,amount,gramWeight);

@override
String toString() {
  return 'UsdaPortionDtoModel(measureUnitId: $measureUnitId, amount: $amount, gramWeight: $gramWeight)';
}


}

/// @nodoc
abstract mixin class _$UsdaPortionDtoModelCopyWith<$Res> implements $UsdaPortionDtoModelCopyWith<$Res> {
  factory _$UsdaPortionDtoModelCopyWith(_UsdaPortionDtoModel value, $Res Function(_UsdaPortionDtoModel) _then) = __$UsdaPortionDtoModelCopyWithImpl;
@override @useResult
$Res call({
 int measureUnitId, double? amount, double gramWeight
});




}
/// @nodoc
class __$UsdaPortionDtoModelCopyWithImpl<$Res>
    implements _$UsdaPortionDtoModelCopyWith<$Res> {
  __$UsdaPortionDtoModelCopyWithImpl(this._self, this._then);

  final _UsdaPortionDtoModel _self;
  final $Res Function(_UsdaPortionDtoModel) _then;

/// Create a copy of UsdaPortionDtoModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? measureUnitId = null,Object? amount = freezed,Object? gramWeight = null,}) {
  return _then(_UsdaPortionDtoModel(
measureUnitId: null == measureUnitId ? _self.measureUnitId : measureUnitId // ignore: cast_nullable_to_non_nullable
as int,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,gramWeight: null == gramWeight ? _self.gramWeight : gramWeight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
