// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_container_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodContainerFirestoreModel {

@JsonKey(includeToJson: false) String? get id; String get name;@JsonKey(name: 'name_lower') String get nameLower; String get description;@JsonKey(name: 'description_lower') String get descriptionLower; AmountFirestoreModel get weight; String get ownerId;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? get createdAt;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() DateTime? get updatedAt;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) DateTime? get deletedAt;@CreateOnly.overrideValue(false) bool? get deleted;
/// Create a copy of FoodContainerFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodContainerFirestoreModelCopyWith<FoodContainerFirestoreModel> get copyWith => _$FoodContainerFirestoreModelCopyWithImpl<FoodContainerFirestoreModel>(this as FoodContainerFirestoreModel, _$identity);

  /// Serializes this FoodContainerFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodContainerFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameLower, nameLower) || other.nameLower == nameLower)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionLower, descriptionLower) || other.descriptionLower == descriptionLower)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameLower,description,descriptionLower,weight,ownerId,createdAt,updatedAt,deletedAt,deleted);

@override
String toString() {
  return 'FoodContainerFirestoreModel(id: $id, name: $name, nameLower: $nameLower, description: $description, descriptionLower: $descriptionLower, weight: $weight, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $FoodContainerFirestoreModelCopyWith<$Res>  {
  factory $FoodContainerFirestoreModelCopyWith(FoodContainerFirestoreModel value, $Res Function(FoodContainerFirestoreModel) _then) = _$FoodContainerFirestoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String? id, String name,@JsonKey(name: 'name_lower') String nameLower, String description,@JsonKey(name: 'description_lower') String descriptionLower, AmountFirestoreModel weight, String ownerId,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? createdAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() DateTime? updatedAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) DateTime? deletedAt,@CreateOnly.overrideValue(false) bool? deleted
});


$AmountFirestoreModelCopyWith<$Res> get weight;

}
/// @nodoc
class _$FoodContainerFirestoreModelCopyWithImpl<$Res>
    implements $FoodContainerFirestoreModelCopyWith<$Res> {
  _$FoodContainerFirestoreModelCopyWithImpl(this._self, this._then);

  final FoodContainerFirestoreModel _self;
  final $Res Function(FoodContainerFirestoreModel) _then;

/// Create a copy of FoodContainerFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? nameLower = null,Object? description = null,Object? descriptionLower = null,Object? weight = null,Object? ownerId = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? deleted = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameLower: null == nameLower ? _self.nameLower : nameLower // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,descriptionLower: null == descriptionLower ? _self.descriptionLower : descriptionLower // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deleted: freezed == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of FoodContainerFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get weight {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.weight, (value) {
    return _then(_self.copyWith(weight: value));
  });
}
}


/// Adds pattern-matching-related methods to [FoodContainerFirestoreModel].
extension FoodContainerFirestoreModelPatterns on FoodContainerFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _FoodContainerFirestoreModel value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodContainerFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _FoodContainerFirestoreModel value)  $default,}){
final _that = this;
switch (_that) {
case _FoodContainerFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _FoodContainerFirestoreModel value)?  $default,}){
final _that = this;
switch (_that) {
case _FoodContainerFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@JsonKey(includeToJson: false)  String? id,  String name, @JsonKey(name: 'name_lower')  String nameLower,  String description, @JsonKey(name: 'description_lower')  String descriptionLower,  AmountFirestoreModel weight,  String ownerId, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt()  DateTime? updatedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null)  DateTime? deletedAt, @CreateOnly.overrideValue(false)  bool? deleted)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodContainerFirestoreModel() when $default != null:
return $default(_that.id,_that.name,_that.nameLower,_that.description,_that.descriptionLower,_that.weight,_that.ownerId,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@JsonKey(includeToJson: false)  String? id,  String name, @JsonKey(name: 'name_lower')  String nameLower,  String description, @JsonKey(name: 'description_lower')  String descriptionLower,  AmountFirestoreModel weight,  String ownerId, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt()  DateTime? updatedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null)  DateTime? deletedAt, @CreateOnly.overrideValue(false)  bool? deleted)  $default,}) {final _that = this;
switch (_that) {
case _FoodContainerFirestoreModel():
return $default(_that.id,_that.name,_that.nameLower,_that.description,_that.descriptionLower,_that.weight,_that.ownerId,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.deleted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@JsonKey(includeToJson: false)  String? id,  String name, @JsonKey(name: 'name_lower')  String nameLower,  String description, @JsonKey(name: 'description_lower')  String descriptionLower,  AmountFirestoreModel weight,  String ownerId, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt()  DateTime? updatedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null)  DateTime? deletedAt, @CreateOnly.overrideValue(false)  bool? deleted)?  $default,}) {final _that = this;
switch (_that) {
case _FoodContainerFirestoreModel() when $default != null:
return $default(_that.id,_that.name,_that.nameLower,_that.description,_that.descriptionLower,_that.weight,_that.ownerId,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodContainerFirestoreModel extends FoodContainerFirestoreModel {
  const _FoodContainerFirestoreModel({@JsonKey(includeToJson: false) this.id, required this.name, @JsonKey(name: 'name_lower') required this.nameLower, required this.description, @JsonKey(name: 'description_lower') required this.descriptionLower, required this.weight, required this.ownerId, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() this.createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() this.updatedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) this.deletedAt, @CreateOnly.overrideValue(false) this.deleted}): super._();
  factory _FoodContainerFirestoreModel.fromJson(Map<String, dynamic> json) => _$FoodContainerFirestoreModelFromJson(json);

@override@JsonKey(includeToJson: false) final  String? id;
@override final  String name;
@override@JsonKey(name: 'name_lower') final  String nameLower;
@override final  String description;
@override@JsonKey(name: 'description_lower') final  String descriptionLower;
@override final  AmountFirestoreModel weight;
@override final  String ownerId;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() final  DateTime? createdAt;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() final  DateTime? updatedAt;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) final  DateTime? deletedAt;
@override@CreateOnly.overrideValue(false) final  bool? deleted;

/// Create a copy of FoodContainerFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodContainerFirestoreModelCopyWith<_FoodContainerFirestoreModel> get copyWith => __$FoodContainerFirestoreModelCopyWithImpl<_FoodContainerFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodContainerFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodContainerFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameLower, nameLower) || other.nameLower == nameLower)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionLower, descriptionLower) || other.descriptionLower == descriptionLower)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameLower,description,descriptionLower,weight,ownerId,createdAt,updatedAt,deletedAt,deleted);

@override
String toString() {
  return 'FoodContainerFirestoreModel.\$default(id: $id, name: $name, nameLower: $nameLower, description: $description, descriptionLower: $descriptionLower, weight: $weight, ownerId: $ownerId, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$FoodContainerFirestoreModelCopyWith<$Res> implements $FoodContainerFirestoreModelCopyWith<$Res> {
  factory _$FoodContainerFirestoreModelCopyWith(_FoodContainerFirestoreModel value, $Res Function(_FoodContainerFirestoreModel) _then) = __$FoodContainerFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String? id, String name,@JsonKey(name: 'name_lower') String nameLower, String description,@JsonKey(name: 'description_lower') String descriptionLower, AmountFirestoreModel weight, String ownerId,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? createdAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() DateTime? updatedAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) DateTime? deletedAt,@CreateOnly.overrideValue(false) bool? deleted
});


@override $AmountFirestoreModelCopyWith<$Res> get weight;

}
/// @nodoc
class __$FoodContainerFirestoreModelCopyWithImpl<$Res>
    implements _$FoodContainerFirestoreModelCopyWith<$Res> {
  __$FoodContainerFirestoreModelCopyWithImpl(this._self, this._then);

  final _FoodContainerFirestoreModel _self;
  final $Res Function(_FoodContainerFirestoreModel) _then;

/// Create a copy of FoodContainerFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? nameLower = null,Object? description = null,Object? descriptionLower = null,Object? weight = null,Object? ownerId = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? deleted = freezed,}) {
  return _then(_FoodContainerFirestoreModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameLower: null == nameLower ? _self.nameLower : nameLower // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,descriptionLower: null == descriptionLower ? _self.descriptionLower : descriptionLower // ignore: cast_nullable_to_non_nullable
as String,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as AmountFirestoreModel,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deleted: freezed == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of FoodContainerFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AmountFirestoreModelCopyWith<$Res> get weight {
  
  return $AmountFirestoreModelCopyWith<$Res>(_self.weight, (value) {
    return _then(_self.copyWith(weight: value));
  });
}
}

// dart format on
