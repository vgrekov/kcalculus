// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usda_portion_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UsdaPortionDbModel {

 int get fdc_id; int get measure_unit_id; double? get amount; double get gram_weight;
/// Create a copy of UsdaPortionDbModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UsdaPortionDbModelCopyWith<UsdaPortionDbModel> get copyWith => _$UsdaPortionDbModelCopyWithImpl<UsdaPortionDbModel>(this as UsdaPortionDbModel, _$identity);

  /// Serializes this UsdaPortionDbModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UsdaPortionDbModel&&(identical(other.fdc_id, fdc_id) || other.fdc_id == fdc_id)&&(identical(other.measure_unit_id, measure_unit_id) || other.measure_unit_id == measure_unit_id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.gram_weight, gram_weight) || other.gram_weight == gram_weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fdc_id,measure_unit_id,amount,gram_weight);

@override
String toString() {
  return 'UsdaPortionDbModel(fdc_id: $fdc_id, measure_unit_id: $measure_unit_id, amount: $amount, gram_weight: $gram_weight)';
}


}

/// @nodoc
abstract mixin class $UsdaPortionDbModelCopyWith<$Res>  {
  factory $UsdaPortionDbModelCopyWith(UsdaPortionDbModel value, $Res Function(UsdaPortionDbModel) _then) = _$UsdaPortionDbModelCopyWithImpl;
@useResult
$Res call({
 int fdc_id, int measure_unit_id, double? amount, double gram_weight
});




}
/// @nodoc
class _$UsdaPortionDbModelCopyWithImpl<$Res>
    implements $UsdaPortionDbModelCopyWith<$Res> {
  _$UsdaPortionDbModelCopyWithImpl(this._self, this._then);

  final UsdaPortionDbModel _self;
  final $Res Function(UsdaPortionDbModel) _then;

/// Create a copy of UsdaPortionDbModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fdc_id = null,Object? measure_unit_id = null,Object? amount = freezed,Object? gram_weight = null,}) {
  return _then(_self.copyWith(
fdc_id: null == fdc_id ? _self.fdc_id : fdc_id // ignore: cast_nullable_to_non_nullable
as int,measure_unit_id: null == measure_unit_id ? _self.measure_unit_id : measure_unit_id // ignore: cast_nullable_to_non_nullable
as int,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,gram_weight: null == gram_weight ? _self.gram_weight : gram_weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [UsdaPortionDbModel].
extension UsdaPortionDbModelPatterns on UsdaPortionDbModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UsdaPortionDbModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UsdaPortionDbModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UsdaPortionDbModel value)  $default,){
final _that = this;
switch (_that) {
case _UsdaPortionDbModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UsdaPortionDbModel value)?  $default,){
final _that = this;
switch (_that) {
case _UsdaPortionDbModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int fdc_id,  int measure_unit_id,  double? amount,  double gram_weight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UsdaPortionDbModel() when $default != null:
return $default(_that.fdc_id,_that.measure_unit_id,_that.amount,_that.gram_weight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int fdc_id,  int measure_unit_id,  double? amount,  double gram_weight)  $default,) {final _that = this;
switch (_that) {
case _UsdaPortionDbModel():
return $default(_that.fdc_id,_that.measure_unit_id,_that.amount,_that.gram_weight);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int fdc_id,  int measure_unit_id,  double? amount,  double gram_weight)?  $default,) {final _that = this;
switch (_that) {
case _UsdaPortionDbModel() when $default != null:
return $default(_that.fdc_id,_that.measure_unit_id,_that.amount,_that.gram_weight);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UsdaPortionDbModel implements UsdaPortionDbModel {
  const _UsdaPortionDbModel({required this.fdc_id, required this.measure_unit_id, this.amount, required this.gram_weight});
  factory _UsdaPortionDbModel.fromJson(Map<String, dynamic> json) => _$UsdaPortionDbModelFromJson(json);

@override final  int fdc_id;
@override final  int measure_unit_id;
@override final  double? amount;
@override final  double gram_weight;

/// Create a copy of UsdaPortionDbModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UsdaPortionDbModelCopyWith<_UsdaPortionDbModel> get copyWith => __$UsdaPortionDbModelCopyWithImpl<_UsdaPortionDbModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UsdaPortionDbModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UsdaPortionDbModel&&(identical(other.fdc_id, fdc_id) || other.fdc_id == fdc_id)&&(identical(other.measure_unit_id, measure_unit_id) || other.measure_unit_id == measure_unit_id)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.gram_weight, gram_weight) || other.gram_weight == gram_weight));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fdc_id,measure_unit_id,amount,gram_weight);

@override
String toString() {
  return 'UsdaPortionDbModel(fdc_id: $fdc_id, measure_unit_id: $measure_unit_id, amount: $amount, gram_weight: $gram_weight)';
}


}

/// @nodoc
abstract mixin class _$UsdaPortionDbModelCopyWith<$Res> implements $UsdaPortionDbModelCopyWith<$Res> {
  factory _$UsdaPortionDbModelCopyWith(_UsdaPortionDbModel value, $Res Function(_UsdaPortionDbModel) _then) = __$UsdaPortionDbModelCopyWithImpl;
@override @useResult
$Res call({
 int fdc_id, int measure_unit_id, double? amount, double gram_weight
});




}
/// @nodoc
class __$UsdaPortionDbModelCopyWithImpl<$Res>
    implements _$UsdaPortionDbModelCopyWith<$Res> {
  __$UsdaPortionDbModelCopyWithImpl(this._self, this._then);

  final _UsdaPortionDbModel _self;
  final $Res Function(_UsdaPortionDbModel) _then;

/// Create a copy of UsdaPortionDbModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fdc_id = null,Object? measure_unit_id = null,Object? amount = freezed,Object? gram_weight = null,}) {
  return _then(_UsdaPortionDbModel(
fdc_id: null == fdc_id ? _self.fdc_id : fdc_id // ignore: cast_nullable_to_non_nullable
as int,measure_unit_id: null == measure_unit_id ? _self.measure_unit_id : measure_unit_id // ignore: cast_nullable_to_non_nullable
as int,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,gram_weight: null == gram_weight ? _self.gram_weight : gram_weight // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
