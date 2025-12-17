// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_db_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealDbModel {

 String get id; String get edible_id;@JsonKey(includeToJson: false, includeFromJson: true) String? get edible_food_id;@JsonKey(includeToJson: false, includeFromJson: true) String? get edible_dish_id; String get amount_unit; double get amount_value; String get eaten_at;@JsonKey(includeToJson: false, includeFromJson: true) String? get deleted_at;
/// Create a copy of MealDbModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealDbModelCopyWith<MealDbModel> get copyWith => _$MealDbModelCopyWithImpl<MealDbModel>(this as MealDbModel, _$identity);

  /// Serializes this MealDbModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealDbModel&&(identical(other.id, id) || other.id == id)&&(identical(other.edible_id, edible_id) || other.edible_id == edible_id)&&(identical(other.edible_food_id, edible_food_id) || other.edible_food_id == edible_food_id)&&(identical(other.edible_dish_id, edible_dish_id) || other.edible_dish_id == edible_dish_id)&&(identical(other.amount_unit, amount_unit) || other.amount_unit == amount_unit)&&(identical(other.amount_value, amount_value) || other.amount_value == amount_value)&&(identical(other.eaten_at, eaten_at) || other.eaten_at == eaten_at)&&(identical(other.deleted_at, deleted_at) || other.deleted_at == deleted_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,edible_id,edible_food_id,edible_dish_id,amount_unit,amount_value,eaten_at,deleted_at);

@override
String toString() {
  return 'MealDbModel(id: $id, edible_id: $edible_id, edible_food_id: $edible_food_id, edible_dish_id: $edible_dish_id, amount_unit: $amount_unit, amount_value: $amount_value, eaten_at: $eaten_at, deleted_at: $deleted_at)';
}


}

/// @nodoc
abstract mixin class $MealDbModelCopyWith<$Res>  {
  factory $MealDbModelCopyWith(MealDbModel value, $Res Function(MealDbModel) _then) = _$MealDbModelCopyWithImpl;
@useResult
$Res call({
 String id, String edible_id,@JsonKey(includeToJson: false, includeFromJson: true) String? edible_food_id,@JsonKey(includeToJson: false, includeFromJson: true) String? edible_dish_id, String amount_unit, double amount_value, String eaten_at,@JsonKey(includeToJson: false, includeFromJson: true) String? deleted_at
});




}
/// @nodoc
class _$MealDbModelCopyWithImpl<$Res>
    implements $MealDbModelCopyWith<$Res> {
  _$MealDbModelCopyWithImpl(this._self, this._then);

  final MealDbModel _self;
  final $Res Function(MealDbModel) _then;

/// Create a copy of MealDbModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? edible_id = null,Object? edible_food_id = freezed,Object? edible_dish_id = freezed,Object? amount_unit = null,Object? amount_value = null,Object? eaten_at = null,Object? deleted_at = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,edible_id: null == edible_id ? _self.edible_id : edible_id // ignore: cast_nullable_to_non_nullable
as String,edible_food_id: freezed == edible_food_id ? _self.edible_food_id : edible_food_id // ignore: cast_nullable_to_non_nullable
as String?,edible_dish_id: freezed == edible_dish_id ? _self.edible_dish_id : edible_dish_id // ignore: cast_nullable_to_non_nullable
as String?,amount_unit: null == amount_unit ? _self.amount_unit : amount_unit // ignore: cast_nullable_to_non_nullable
as String,amount_value: null == amount_value ? _self.amount_value : amount_value // ignore: cast_nullable_to_non_nullable
as double,eaten_at: null == eaten_at ? _self.eaten_at : eaten_at // ignore: cast_nullable_to_non_nullable
as String,deleted_at: freezed == deleted_at ? _self.deleted_at : deleted_at // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MealDbModel].
extension MealDbModelPatterns on MealDbModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealDbModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealDbModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealDbModel value)  $default,){
final _that = this;
switch (_that) {
case _MealDbModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealDbModel value)?  $default,){
final _that = this;
switch (_that) {
case _MealDbModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String edible_id, @JsonKey(includeToJson: false, includeFromJson: true)  String? edible_food_id, @JsonKey(includeToJson: false, includeFromJson: true)  String? edible_dish_id,  String amount_unit,  double amount_value,  String eaten_at, @JsonKey(includeToJson: false, includeFromJson: true)  String? deleted_at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealDbModel() when $default != null:
return $default(_that.id,_that.edible_id,_that.edible_food_id,_that.edible_dish_id,_that.amount_unit,_that.amount_value,_that.eaten_at,_that.deleted_at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String edible_id, @JsonKey(includeToJson: false, includeFromJson: true)  String? edible_food_id, @JsonKey(includeToJson: false, includeFromJson: true)  String? edible_dish_id,  String amount_unit,  double amount_value,  String eaten_at, @JsonKey(includeToJson: false, includeFromJson: true)  String? deleted_at)  $default,) {final _that = this;
switch (_that) {
case _MealDbModel():
return $default(_that.id,_that.edible_id,_that.edible_food_id,_that.edible_dish_id,_that.amount_unit,_that.amount_value,_that.eaten_at,_that.deleted_at);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String edible_id, @JsonKey(includeToJson: false, includeFromJson: true)  String? edible_food_id, @JsonKey(includeToJson: false, includeFromJson: true)  String? edible_dish_id,  String amount_unit,  double amount_value,  String eaten_at, @JsonKey(includeToJson: false, includeFromJson: true)  String? deleted_at)?  $default,) {final _that = this;
switch (_that) {
case _MealDbModel() when $default != null:
return $default(_that.id,_that.edible_id,_that.edible_food_id,_that.edible_dish_id,_that.amount_unit,_that.amount_value,_that.eaten_at,_that.deleted_at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MealDbModel implements MealDbModel {
   _MealDbModel({required this.id, required this.edible_id, @JsonKey(includeToJson: false, includeFromJson: true) this.edible_food_id, @JsonKey(includeToJson: false, includeFromJson: true) this.edible_dish_id, required this.amount_unit, required this.amount_value, required this.eaten_at, @JsonKey(includeToJson: false, includeFromJson: true) this.deleted_at});
  factory _MealDbModel.fromJson(Map<String, dynamic> json) => _$MealDbModelFromJson(json);

@override final  String id;
@override final  String edible_id;
@override@JsonKey(includeToJson: false, includeFromJson: true) final  String? edible_food_id;
@override@JsonKey(includeToJson: false, includeFromJson: true) final  String? edible_dish_id;
@override final  String amount_unit;
@override final  double amount_value;
@override final  String eaten_at;
@override@JsonKey(includeToJson: false, includeFromJson: true) final  String? deleted_at;

/// Create a copy of MealDbModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealDbModelCopyWith<_MealDbModel> get copyWith => __$MealDbModelCopyWithImpl<_MealDbModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealDbModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealDbModel&&(identical(other.id, id) || other.id == id)&&(identical(other.edible_id, edible_id) || other.edible_id == edible_id)&&(identical(other.edible_food_id, edible_food_id) || other.edible_food_id == edible_food_id)&&(identical(other.edible_dish_id, edible_dish_id) || other.edible_dish_id == edible_dish_id)&&(identical(other.amount_unit, amount_unit) || other.amount_unit == amount_unit)&&(identical(other.amount_value, amount_value) || other.amount_value == amount_value)&&(identical(other.eaten_at, eaten_at) || other.eaten_at == eaten_at)&&(identical(other.deleted_at, deleted_at) || other.deleted_at == deleted_at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,edible_id,edible_food_id,edible_dish_id,amount_unit,amount_value,eaten_at,deleted_at);

@override
String toString() {
  return 'MealDbModel(id: $id, edible_id: $edible_id, edible_food_id: $edible_food_id, edible_dish_id: $edible_dish_id, amount_unit: $amount_unit, amount_value: $amount_value, eaten_at: $eaten_at, deleted_at: $deleted_at)';
}


}

/// @nodoc
abstract mixin class _$MealDbModelCopyWith<$Res> implements $MealDbModelCopyWith<$Res> {
  factory _$MealDbModelCopyWith(_MealDbModel value, $Res Function(_MealDbModel) _then) = __$MealDbModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String edible_id,@JsonKey(includeToJson: false, includeFromJson: true) String? edible_food_id,@JsonKey(includeToJson: false, includeFromJson: true) String? edible_dish_id, String amount_unit, double amount_value, String eaten_at,@JsonKey(includeToJson: false, includeFromJson: true) String? deleted_at
});




}
/// @nodoc
class __$MealDbModelCopyWithImpl<$Res>
    implements _$MealDbModelCopyWith<$Res> {
  __$MealDbModelCopyWithImpl(this._self, this._then);

  final _MealDbModel _self;
  final $Res Function(_MealDbModel) _then;

/// Create a copy of MealDbModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? edible_id = null,Object? edible_food_id = freezed,Object? edible_dish_id = freezed,Object? amount_unit = null,Object? amount_value = null,Object? eaten_at = null,Object? deleted_at = freezed,}) {
  return _then(_MealDbModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,edible_id: null == edible_id ? _self.edible_id : edible_id // ignore: cast_nullable_to_non_nullable
as String,edible_food_id: freezed == edible_food_id ? _self.edible_food_id : edible_food_id // ignore: cast_nullable_to_non_nullable
as String?,edible_dish_id: freezed == edible_dish_id ? _self.edible_dish_id : edible_dish_id // ignore: cast_nullable_to_non_nullable
as String?,amount_unit: null == amount_unit ? _self.amount_unit : amount_unit // ignore: cast_nullable_to_non_nullable
as String,amount_value: null == amount_value ? _self.amount_value : amount_value // ignore: cast_nullable_to_non_nullable
as double,eaten_at: null == eaten_at ? _self.eaten_at : eaten_at // ignore: cast_nullable_to_non_nullable
as String,deleted_at: freezed == deleted_at ? _self.deleted_at : deleted_at // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
