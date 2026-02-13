// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nutrient_goal_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NutrientGoalFirestoreModel {

@JsonKey(includeToJson: false) String? get id; String get nutrient; String get unit; double get value;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? get createdAt;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.override(NutrientGoalFirestoreModel._maxTimestampProvider) DateTime? get deletedAt;
/// Create a copy of NutrientGoalFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NutrientGoalFirestoreModelCopyWith<NutrientGoalFirestoreModel> get copyWith => _$NutrientGoalFirestoreModelCopyWithImpl<NutrientGoalFirestoreModel>(this as NutrientGoalFirestoreModel, _$identity);

  /// Serializes this NutrientGoalFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NutrientGoalFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.value, value) || other.value == value)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nutrient,unit,value,createdAt,deletedAt);

@override
String toString() {
  return 'NutrientGoalFirestoreModel(id: $id, nutrient: $nutrient, unit: $unit, value: $value, createdAt: $createdAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $NutrientGoalFirestoreModelCopyWith<$Res>  {
  factory $NutrientGoalFirestoreModelCopyWith(NutrientGoalFirestoreModel value, $Res Function(NutrientGoalFirestoreModel) _then) = _$NutrientGoalFirestoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String? id, String nutrient, String unit, double value,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? createdAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.override(NutrientGoalFirestoreModel._maxTimestampProvider) DateTime? deletedAt
});




}
/// @nodoc
class _$NutrientGoalFirestoreModelCopyWithImpl<$Res>
    implements $NutrientGoalFirestoreModelCopyWith<$Res> {
  _$NutrientGoalFirestoreModelCopyWithImpl(this._self, this._then);

  final NutrientGoalFirestoreModel _self;
  final $Res Function(NutrientGoalFirestoreModel) _then;

/// Create a copy of NutrientGoalFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? nutrient = null,Object? unit = null,Object? value = null,Object? createdAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [NutrientGoalFirestoreModel].
extension NutrientGoalFirestoreModelPatterns on NutrientGoalFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NutrientGoalFirestoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NutrientGoalFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NutrientGoalFirestoreModel value)  $default,){
final _that = this;
switch (_that) {
case _NutrientGoalFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NutrientGoalFirestoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _NutrientGoalFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String? id,  String nutrient,  String unit,  double value, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.override(NutrientGoalFirestoreModel._maxTimestampProvider)  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NutrientGoalFirestoreModel() when $default != null:
return $default(_that.id,_that.nutrient,_that.unit,_that.value,_that.createdAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String? id,  String nutrient,  String unit,  double value, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.override(NutrientGoalFirestoreModel._maxTimestampProvider)  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _NutrientGoalFirestoreModel():
return $default(_that.id,_that.nutrient,_that.unit,_that.value,_that.createdAt,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String? id,  String nutrient,  String unit,  double value, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.override(NutrientGoalFirestoreModel._maxTimestampProvider)  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _NutrientGoalFirestoreModel() when $default != null:
return $default(_that.id,_that.nutrient,_that.unit,_that.value,_that.createdAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NutrientGoalFirestoreModel extends NutrientGoalFirestoreModel {
  const _NutrientGoalFirestoreModel({@JsonKey(includeToJson: false) this.id, required this.nutrient, required this.unit, required this.value, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() this.createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.override(NutrientGoalFirestoreModel._maxTimestampProvider) this.deletedAt}): super._();
  factory _NutrientGoalFirestoreModel.fromJson(Map<String, dynamic> json) => _$NutrientGoalFirestoreModelFromJson(json);

@override@JsonKey(includeToJson: false) final  String? id;
@override final  String nutrient;
@override final  String unit;
@override final  double value;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() final  DateTime? createdAt;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.override(NutrientGoalFirestoreModel._maxTimestampProvider) final  DateTime? deletedAt;

/// Create a copy of NutrientGoalFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NutrientGoalFirestoreModelCopyWith<_NutrientGoalFirestoreModel> get copyWith => __$NutrientGoalFirestoreModelCopyWithImpl<_NutrientGoalFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NutrientGoalFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NutrientGoalFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.nutrient, nutrient) || other.nutrient == nutrient)&&(identical(other.unit, unit) || other.unit == unit)&&(identical(other.value, value) || other.value == value)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,nutrient,unit,value,createdAt,deletedAt);

@override
String toString() {
  return 'NutrientGoalFirestoreModel(id: $id, nutrient: $nutrient, unit: $unit, value: $value, createdAt: $createdAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$NutrientGoalFirestoreModelCopyWith<$Res> implements $NutrientGoalFirestoreModelCopyWith<$Res> {
  factory _$NutrientGoalFirestoreModelCopyWith(_NutrientGoalFirestoreModel value, $Res Function(_NutrientGoalFirestoreModel) _then) = __$NutrientGoalFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String? id, String nutrient, String unit, double value,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? createdAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.override(NutrientGoalFirestoreModel._maxTimestampProvider) DateTime? deletedAt
});




}
/// @nodoc
class __$NutrientGoalFirestoreModelCopyWithImpl<$Res>
    implements _$NutrientGoalFirestoreModelCopyWith<$Res> {
  __$NutrientGoalFirestoreModelCopyWithImpl(this._self, this._then);

  final _NutrientGoalFirestoreModel _self;
  final $Res Function(_NutrientGoalFirestoreModel) _then;

/// Create a copy of NutrientGoalFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? nutrient = null,Object? unit = null,Object? value = null,Object? createdAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_NutrientGoalFirestoreModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,nutrient: null == nutrient ? _self.nutrient : nutrient // ignore: cast_nullable_to_non_nullable
as String,unit: null == unit ? _self.unit : unit // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as double,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
