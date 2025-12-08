// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MealFirestoreModel {

@JsonKey(includeToJson: false) String? get id; String get edibleId; AmountFirestoreModel get amount;@JsonKey(fromJson: timestampToDateNotNull, toJson: dateToTimestamp) DateTime get eatenAt;@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? get createdAt;@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? get updatedAt;@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? get deletedAt;
/// Create a copy of MealFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealFirestoreModelCopyWith<MealFirestoreModel> get copyWith => _$MealFirestoreModelCopyWithImpl<MealFirestoreModel>(this as MealFirestoreModel, _$identity);

  /// Serializes this MealFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.edibleId, edibleId) || other.edibleId == edibleId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,edibleId,amount,eatenAt,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'MealFirestoreModel(id: $id, edibleId: $edibleId, amount: $amount, eatenAt: $eatenAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $MealFirestoreModelCopyWith<$Res>  {
  factory $MealFirestoreModelCopyWith(MealFirestoreModel value, $Res Function(MealFirestoreModel) _then) = _$MealFirestoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String? id, String edibleId, AmountFirestoreModel amount,@JsonKey(fromJson: timestampToDateNotNull, toJson: dateToTimestamp) DateTime eatenAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? createdAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? updatedAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? deletedAt
});


$AmountFirestoreModelCopyWith<$Res> get amount;

}
/// @nodoc
class _$MealFirestoreModelCopyWithImpl<$Res>
    implements $MealFirestoreModelCopyWith<$Res> {
  _$MealFirestoreModelCopyWithImpl(this._self, this._then);

  final MealFirestoreModel _self;
  final $Res Function(MealFirestoreModel) _then;

/// Create a copy of MealFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? edibleId = null,Object? amount = null,Object? eatenAt = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,edibleId: null == edibleId ? _self.edibleId : edibleId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,eatenAt: null == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of MealFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get amount {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}


/// Adds pattern-matching-related methods to [MealFirestoreModel].
extension MealFirestoreModelPatterns on MealFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealFirestoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealFirestoreModel value)  $default,){
final _that = this;
switch (_that) {
case _MealFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealFirestoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _MealFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String? id,  String edibleId,  AmountFirestoreModel amount, @JsonKey(fromJson: timestampToDateNotNull, toJson: dateToTimestamp)  DateTime eatenAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? createdAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? updatedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealFirestoreModel() when $default != null:
return $default(_that.id,_that.edibleId,_that.amount,_that.eatenAt,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String? id,  String edibleId,  AmountFirestoreModel amount, @JsonKey(fromJson: timestampToDateNotNull, toJson: dateToTimestamp)  DateTime eatenAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? createdAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? updatedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _MealFirestoreModel():
return $default(_that.id,_that.edibleId,_that.amount,_that.eatenAt,_that.createdAt,_that.updatedAt,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String? id,  String edibleId,  AmountFirestoreModel amount, @JsonKey(fromJson: timestampToDateNotNull, toJson: dateToTimestamp)  DateTime eatenAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? createdAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? updatedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _MealFirestoreModel() when $default != null:
return $default(_that.id,_that.edibleId,_that.amount,_that.eatenAt,_that.createdAt,_that.updatedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MealFirestoreModel extends MealFirestoreModel {
  const _MealFirestoreModel({@JsonKey(includeToJson: false) this.id, required this.edibleId, required this.amount, @JsonKey(fromJson: timestampToDateNotNull, toJson: dateToTimestamp) required this.eatenAt, @JsonKey(includeToJson: false, fromJson: timestampToDate) this.createdAt, @JsonKey(includeToJson: false, fromJson: timestampToDate) this.updatedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate) this.deletedAt}): super._();
  factory _MealFirestoreModel.fromJson(Map<String, dynamic> json) => _$MealFirestoreModelFromJson(json);

@override@JsonKey(includeToJson: false) final  String? id;
@override final  String edibleId;
@override final  AmountFirestoreModel amount;
@override@JsonKey(fromJson: timestampToDateNotNull, toJson: dateToTimestamp) final  DateTime eatenAt;
@override@JsonKey(includeToJson: false, fromJson: timestampToDate) final  DateTime? createdAt;
@override@JsonKey(includeToJson: false, fromJson: timestampToDate) final  DateTime? updatedAt;
@override@JsonKey(includeToJson: false, fromJson: timestampToDate) final  DateTime? deletedAt;

/// Create a copy of MealFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealFirestoreModelCopyWith<_MealFirestoreModel> get copyWith => __$MealFirestoreModelCopyWithImpl<_MealFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.edibleId, edibleId) || other.edibleId == edibleId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,edibleId,amount,eatenAt,createdAt,updatedAt,deletedAt);

@override
String toString() {
  return 'MealFirestoreModel(id: $id, edibleId: $edibleId, amount: $amount, eatenAt: $eatenAt, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$MealFirestoreModelCopyWith<$Res> implements $MealFirestoreModelCopyWith<$Res> {
  factory _$MealFirestoreModelCopyWith(_MealFirestoreModel value, $Res Function(_MealFirestoreModel) _then) = __$MealFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String? id, String edibleId, AmountFirestoreModel amount,@JsonKey(fromJson: timestampToDateNotNull, toJson: dateToTimestamp) DateTime eatenAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? createdAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? updatedAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? deletedAt
});


@override $AmountFirestoreModelCopyWith<$Res> get amount;

}
/// @nodoc
class __$MealFirestoreModelCopyWithImpl<$Res>
    implements _$MealFirestoreModelCopyWith<$Res> {
  __$MealFirestoreModelCopyWithImpl(this._self, this._then);

  final _MealFirestoreModel _self;
  final $Res Function(_MealFirestoreModel) _then;

/// Create a copy of MealFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? edibleId = null,Object? amount = null,Object? eatenAt = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_MealFirestoreModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,edibleId: null == edibleId ? _self.edibleId : edibleId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,eatenAt: null == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as DateTime,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of MealFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get amount {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.amount, (value) {
    return _then(_self.copyWith(amount: value));
  });
}
}

// dart format on
