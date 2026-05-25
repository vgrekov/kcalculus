// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_amount_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientAmountDbModel {

 String get nutrition_facts_id; String get nutrient; String get amount_unit; double get amount_value; int get position;
/// Create a copy of NutrientAmountDbModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientAmountDbModelCopyWith<NutrientAmountDbModel> get copyWith => _$NutrientAmountDbModelCopyWithImpl<NutrientAmountDbModel>(this as NutrientAmountDbModel, _$identity);

  /// Serializes this NutrientAmountDbModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientAmountDbModel&&(identical(other.nutrition_facts_id, nutrition_facts_id) || other.nutrition_facts_id == nutrition_facts_id)&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.amount_unit, amount_unit) || other.amount_unit == amount_unit)&&(identical(other.amount_value, amount_value) || other.amount_value == amount_value)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nutrition_facts_id,nutrient,amount_unit,amount_value,position);

@override
String toString() {
  return 'NutrientAmountDbModel(nutrition_facts_id: $nutrition_facts_id, nutrient: $nutrient, amount_unit: $amount_unit, amount_value: $amount_value, position: $position)';
}


}

/// @nodoc
abstract mixin class $NutrientAmountDbModelCopyWith<$Res>  {
  factory $NutrientAmountDbModelCopyWith(NutrientAmountDbModel value, $Res Function(NutrientAmountDbModel) _then) = _$NutrientAmountDbModelCopyWithImpl;
@useResult
$Res call({
 String nutrition_facts_id, String nutrient, String amount_unit, double amount_value, int position
});




}
/// @nodoc
class _$NutrientAmountDbModelCopyWithImpl<$Res>
    implements $NutrientAmountDbModelCopyWith<$Res> {
  _$NutrientAmountDbModelCopyWithImpl(this._self, this._then);

  final NutrientAmountDbModel _self;
  final $Res Function(NutrientAmountDbModel) _then;

/// Create a copy of NutrientAmountDbModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? nutrition_facts_id = null,Object? nutrient = null,Object? amount_unit = null,Object? amount_value = null,Object? position = null,}) {
  return _then(_self.copyWith(
nutrition_facts_id: null == nutrition_facts_id ? _self.nutrition_facts_id : nutrition_facts_id // ignore: cast_nullable_to_non_nullable
as String,nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as String,amount_unit: null == amount_unit ? _self.amount_unit : amount_unit // ignore: cast_nullable_to_non_nullable
as String,amount_value: null == amount_value ? _self.amount_value : amount_value // ignore: cast_nullable_to_non_nullable
as double,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [NutrientAmountDbModel].
extension NutrientAmountDbModelPatterns on NutrientAmountDbModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutrientAmountDbModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientAmountDbModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutrientAmountDbModel value)  $default,){
final _that = this;
switch (_that) {
case _NutrientAmountDbModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutrientAmountDbModel value)?  $default,){
final _that = this;
switch (_that) {
case _NutrientAmountDbModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String nutrition_facts_id,  String nutrient,  String amount_unit,  double amount_value,  int position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientAmountDbModel() when $default != null:
return $default(_that.nutrition_facts_id,_that.nutrient,_that.amount_unit,_that.amount_value,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String nutrition_facts_id,  String nutrient,  String amount_unit,  double amount_value,  int position)  $default,) {final _that = this;
switch (_that) {
case _NutrientAmountDbModel():
return $default(_that.nutrition_facts_id,_that.nutrient,_that.amount_unit,_that.amount_value,_that.position);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String nutrition_facts_id,  String nutrient,  String amount_unit,  double amount_value,  int position)?  $default,) {final _that = this;
switch (_that) {
case _NutrientAmountDbModel() when $default != null:
return $default(_that.nutrition_facts_id,_that.nutrient,_that.amount_unit,_that.amount_value,_that.position);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutrientAmountDbModel implements NutrientAmountDbModel {
   _NutrientAmountDbModel({required this.nutrition_facts_id, required this.nutrient, required this.amount_unit, required this.amount_value, required this.position});
  factory _NutrientAmountDbModel.fromJson(Map<String, dynamic> json) => _$NutrientAmountDbModelFromJson(json);

@override final  String nutrition_facts_id;
@override final  String nutrient;
@override final  String amount_unit;
@override final  double amount_value;
@override final  int position;

/// Create a copy of NutrientAmountDbModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientAmountDbModelCopyWith<_NutrientAmountDbModel> get copyWith => __$NutrientAmountDbModelCopyWithImpl<_NutrientAmountDbModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutrientAmountDbModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientAmountDbModel&&(identical(other.nutrition_facts_id, nutrition_facts_id) || other.nutrition_facts_id == nutrition_facts_id)&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.amount_unit, amount_unit) || other.amount_unit == amount_unit)&&(identical(other.amount_value, amount_value) || other.amount_value == amount_value)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,nutrition_facts_id,nutrient,amount_unit,amount_value,position);

@override
String toString() {
  return 'NutrientAmountDbModel(nutrition_facts_id: $nutrition_facts_id, nutrient: $nutrient, amount_unit: $amount_unit, amount_value: $amount_value, position: $position)';
}


}

/// @nodoc
abstract mixin class _$NutrientAmountDbModelCopyWith<$Res> implements $NutrientAmountDbModelCopyWith<$Res> {
  factory _$NutrientAmountDbModelCopyWith(_NutrientAmountDbModel value, $Res Function(_NutrientAmountDbModel) _then) = __$NutrientAmountDbModelCopyWithImpl;
@override @useResult
$Res call({
 String nutrition_facts_id, String nutrient, String amount_unit, double amount_value, int position
});




}
/// @nodoc
class __$NutrientAmountDbModelCopyWithImpl<$Res>
    implements _$NutrientAmountDbModelCopyWith<$Res> {
  __$NutrientAmountDbModelCopyWithImpl(this._self, this._then);

  final _NutrientAmountDbModel _self;
  final $Res Function(_NutrientAmountDbModel) _then;

/// Create a copy of NutrientAmountDbModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? nutrition_facts_id = null,Object? nutrient = null,Object? amount_unit = null,Object? amount_value = null,Object? position = null,}) {
  return _then(_NutrientAmountDbModel(
nutrition_facts_id: null == nutrition_facts_id ? _self.nutrition_facts_id : nutrition_facts_id // ignore: cast_nullable_to_non_nullable
as String,nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as String,amount_unit: null == amount_unit ? _self.amount_unit : amount_unit // ignore: cast_nullable_to_non_nullable
as String,amount_value: null == amount_value ? _self.amount_value : amount_value // ignore: cast_nullable_to_non_nullable
as double,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
