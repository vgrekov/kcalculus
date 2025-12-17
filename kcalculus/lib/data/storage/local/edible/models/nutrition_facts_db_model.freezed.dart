// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrition_facts_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutritionFactsDbModel {

 String get id; String get edible_id; String get amount_unit; double get amount_value;
/// Create a copy of NutritionFactsDbModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutritionFactsDbModelCopyWith<NutritionFactsDbModel> get copyWith => _$NutritionFactsDbModelCopyWithImpl<NutritionFactsDbModel>(this as NutritionFactsDbModel, _$identity);

  /// Serializes this NutritionFactsDbModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutritionFactsDbModel&&(identical(other.id, id) || other.id == id)&&(identical(other.edible_id, edible_id) || other.edible_id == edible_id)&&(identical(other.amount_unit, amount_unit) || other.amount_unit == amount_unit)&&(identical(other.amount_value, amount_value) || other.amount_value == amount_value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,edible_id,amount_unit,amount_value);

@override
String toString() {
  return 'NutritionFactsDbModel(id: $id, edible_id: $edible_id, amount_unit: $amount_unit, amount_value: $amount_value)';
}


}

/// @nodoc
abstract mixin class $NutritionFactsDbModelCopyWith<$Res>  {
  factory $NutritionFactsDbModelCopyWith(NutritionFactsDbModel value, $Res Function(NutritionFactsDbModel) _then) = _$NutritionFactsDbModelCopyWithImpl;
@useResult
$Res call({
 String id, String edible_id, String amount_unit, double amount_value
});




}
/// @nodoc
class _$NutritionFactsDbModelCopyWithImpl<$Res>
    implements $NutritionFactsDbModelCopyWith<$Res> {
  _$NutritionFactsDbModelCopyWithImpl(this._self, this._then);

  final NutritionFactsDbModel _self;
  final $Res Function(NutritionFactsDbModel) _then;

/// Create a copy of NutritionFactsDbModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? edible_id = null,Object? amount_unit = null,Object? amount_value = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,edible_id: null == edible_id ? _self.edible_id : edible_id // ignore: cast_nullable_to_non_nullable
as String,amount_unit: null == amount_unit ? _self.amount_unit : amount_unit // ignore: cast_nullable_to_non_nullable
as String,amount_value: null == amount_value ? _self.amount_value : amount_value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [NutritionFactsDbModel].
extension NutritionFactsDbModelPatterns on NutritionFactsDbModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutritionFactsDbModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutritionFactsDbModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutritionFactsDbModel value)  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsDbModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutritionFactsDbModel value)?  $default,){
final _that = this;
switch (_that) {
case _NutritionFactsDbModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String edible_id,  String amount_unit,  double amount_value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutritionFactsDbModel() when $default != null:
return $default(_that.id,_that.edible_id,_that.amount_unit,_that.amount_value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String edible_id,  String amount_unit,  double amount_value)  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsDbModel():
return $default(_that.id,_that.edible_id,_that.amount_unit,_that.amount_value);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String edible_id,  String amount_unit,  double amount_value)?  $default,) {final _that = this;
switch (_that) {
case _NutritionFactsDbModel() when $default != null:
return $default(_that.id,_that.edible_id,_that.amount_unit,_that.amount_value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutritionFactsDbModel implements NutritionFactsDbModel {
   _NutritionFactsDbModel({required this.id, required this.edible_id, required this.amount_unit, required this.amount_value});
  factory _NutritionFactsDbModel.fromJson(Map<String, dynamic> json) => _$NutritionFactsDbModelFromJson(json);

@override final  String id;
@override final  String edible_id;
@override final  String amount_unit;
@override final  double amount_value;

/// Create a copy of NutritionFactsDbModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutritionFactsDbModelCopyWith<_NutritionFactsDbModel> get copyWith => __$NutritionFactsDbModelCopyWithImpl<_NutritionFactsDbModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutritionFactsDbModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutritionFactsDbModel&&(identical(other.id, id) || other.id == id)&&(identical(other.edible_id, edible_id) || other.edible_id == edible_id)&&(identical(other.amount_unit, amount_unit) || other.amount_unit == amount_unit)&&(identical(other.amount_value, amount_value) || other.amount_value == amount_value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,edible_id,amount_unit,amount_value);

@override
String toString() {
  return 'NutritionFactsDbModel(id: $id, edible_id: $edible_id, amount_unit: $amount_unit, amount_value: $amount_value)';
}


}

/// @nodoc
abstract mixin class _$NutritionFactsDbModelCopyWith<$Res> implements $NutritionFactsDbModelCopyWith<$Res> {
  factory _$NutritionFactsDbModelCopyWith(_NutritionFactsDbModel value, $Res Function(_NutritionFactsDbModel) _then) = __$NutritionFactsDbModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String edible_id, String amount_unit, double amount_value
});




}
/// @nodoc
class __$NutritionFactsDbModelCopyWithImpl<$Res>
    implements _$NutritionFactsDbModelCopyWith<$Res> {
  __$NutritionFactsDbModelCopyWithImpl(this._self, this._then);

  final _NutritionFactsDbModel _self;
  final $Res Function(_NutritionFactsDbModel) _then;

/// Create a copy of NutritionFactsDbModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? edible_id = null,Object? amount_unit = null,Object? amount_value = null,}) {
  return _then(_NutritionFactsDbModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,edible_id: null == edible_id ? _self.edible_id : edible_id // ignore: cast_nullable_to_non_nullable
as String,amount_unit: null == amount_unit ? _self.amount_unit : amount_unit // ignore: cast_nullable_to_non_nullable
as String,amount_value: null == amount_value ? _self.amount_value : amount_value // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
