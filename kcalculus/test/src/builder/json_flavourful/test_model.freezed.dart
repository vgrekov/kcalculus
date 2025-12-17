// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'test_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TestModel {

@JsonFlavoured({Action.create}, value: idGenerator, exclusive: false) String? get id; String get name;@JsonFlavoured({Action.create, Action.update}, filter: nonNull) String? get description;@JsonKey(name: 'created_at')@JsonFlavoured({Action.create}, value: serverTimestamp) DateTime? get createdAt;@JsonFlavoured({Action.create, Action.update}, value: serverTimestamp) DateTime? get updatedAt;@JsonFlavoured({Action.create, Action.delete}, value: deletedAtTimestamp) DateTime? get deletedAt;@JsonFlavoured({Action.create, Action.delete}, value: deletedFlag) bool? get deleted;
/// Create a copy of TestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestModelCopyWith<TestModel> get copyWith => _$TestModelCopyWithImpl<TestModel>(this as TestModel, _$identity);

  /// Serializes this TestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,createdAt,updatedAt,deletedAt,deleted);

@override
String toString() {
  return 'TestModel(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $TestModelCopyWith<$Res>  {
  factory $TestModelCopyWith(TestModel value, $Res Function(TestModel) _then) = _$TestModelCopyWithImpl;
@useResult
$Res call({
@JsonFlavoured({Action.create}, value: idGenerator, exclusive: false) String? id, String name,@JsonFlavoured({Action.create, Action.update}, filter: nonNull) String? description,@JsonKey(name: 'created_at')@JsonFlavoured({Action.create}, value: serverTimestamp) DateTime? createdAt,@JsonFlavoured({Action.create, Action.update}, value: serverTimestamp) DateTime? updatedAt,@JsonFlavoured({Action.create, Action.delete}, value: deletedAtTimestamp) DateTime? deletedAt,@JsonFlavoured({Action.create, Action.delete}, value: deletedFlag) bool? deleted
});




}
/// @nodoc
class _$TestModelCopyWithImpl<$Res>
    implements $TestModelCopyWith<$Res> {
  _$TestModelCopyWithImpl(this._self, this._then);

  final TestModel _self;
  final $Res Function(TestModel) _then;

/// Create a copy of TestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? deleted = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deleted: freezed == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestModel].
extension TestModelPatterns on TestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestModel value)  $default,){
final _that = this;
switch (_that) {
case _TestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestModel value)?  $default,){
final _that = this;
switch (_that) {
case _TestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonFlavoured({Action.create}, value: idGenerator, exclusive: false)  String? id,  String name, @JsonFlavoured({Action.create, Action.update}, filter: nonNull)  String? description, @JsonKey(name: 'created_at')@JsonFlavoured({Action.create}, value: serverTimestamp)  DateTime? createdAt, @JsonFlavoured({Action.create, Action.update}, value: serverTimestamp)  DateTime? updatedAt, @JsonFlavoured({Action.create, Action.delete}, value: deletedAtTimestamp)  DateTime? deletedAt, @JsonFlavoured({Action.create, Action.delete}, value: deletedFlag)  bool? deleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonFlavoured({Action.create}, value: idGenerator, exclusive: false)  String? id,  String name, @JsonFlavoured({Action.create, Action.update}, filter: nonNull)  String? description, @JsonKey(name: 'created_at')@JsonFlavoured({Action.create}, value: serverTimestamp)  DateTime? createdAt, @JsonFlavoured({Action.create, Action.update}, value: serverTimestamp)  DateTime? updatedAt, @JsonFlavoured({Action.create, Action.delete}, value: deletedAtTimestamp)  DateTime? deletedAt, @JsonFlavoured({Action.create, Action.delete}, value: deletedFlag)  bool? deleted)  $default,) {final _that = this;
switch (_that) {
case _TestModel():
return $default(_that.id,_that.name,_that.description,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.deleted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonFlavoured({Action.create}, value: idGenerator, exclusive: false)  String? id,  String name, @JsonFlavoured({Action.create, Action.update}, filter: nonNull)  String? description, @JsonKey(name: 'created_at')@JsonFlavoured({Action.create}, value: serverTimestamp)  DateTime? createdAt, @JsonFlavoured({Action.create, Action.update}, value: serverTimestamp)  DateTime? updatedAt, @JsonFlavoured({Action.create, Action.delete}, value: deletedAtTimestamp)  DateTime? deletedAt, @JsonFlavoured({Action.create, Action.delete}, value: deletedFlag)  bool? deleted)?  $default,) {final _that = this;
switch (_that) {
case _TestModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.createdAt,_that.updatedAt,_that.deletedAt,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TestModel implements TestModel {
  const _TestModel({@JsonFlavoured({Action.create}, value: idGenerator, exclusive: false) this.id, required this.name, @JsonFlavoured({Action.create, Action.update}, filter: nonNull) this.description, @JsonKey(name: 'created_at')@JsonFlavoured({Action.create}, value: serverTimestamp) this.createdAt, @JsonFlavoured({Action.create, Action.update}, value: serverTimestamp) this.updatedAt, @JsonFlavoured({Action.create, Action.delete}, value: deletedAtTimestamp) this.deletedAt, @JsonFlavoured({Action.create, Action.delete}, value: deletedFlag) this.deleted});
  factory _TestModel.fromJson(Map<String, dynamic> json) => _$TestModelFromJson(json);

@override@JsonFlavoured({Action.create}, value: idGenerator, exclusive: false) final  String? id;
@override final  String name;
@override@JsonFlavoured({Action.create, Action.update}, filter: nonNull) final  String? description;
@override@JsonKey(name: 'created_at')@JsonFlavoured({Action.create}, value: serverTimestamp) final  DateTime? createdAt;
@override@JsonFlavoured({Action.create, Action.update}, value: serverTimestamp) final  DateTime? updatedAt;
@override@JsonFlavoured({Action.create, Action.delete}, value: deletedAtTimestamp) final  DateTime? deletedAt;
@override@JsonFlavoured({Action.create, Action.delete}, value: deletedFlag) final  bool? deleted;

/// Create a copy of TestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestModelCopyWith<_TestModel> get copyWith => __$TestModelCopyWithImpl<_TestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,createdAt,updatedAt,deletedAt,deleted);

@override
String toString() {
  return 'TestModel(id: $id, name: $name, description: $description, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$TestModelCopyWith<$Res> implements $TestModelCopyWith<$Res> {
  factory _$TestModelCopyWith(_TestModel value, $Res Function(_TestModel) _then) = __$TestModelCopyWithImpl;
@override @useResult
$Res call({
@JsonFlavoured({Action.create}, value: idGenerator, exclusive: false) String? id, String name,@JsonFlavoured({Action.create, Action.update}, filter: nonNull) String? description,@JsonKey(name: 'created_at')@JsonFlavoured({Action.create}, value: serverTimestamp) DateTime? createdAt,@JsonFlavoured({Action.create, Action.update}, value: serverTimestamp) DateTime? updatedAt,@JsonFlavoured({Action.create, Action.delete}, value: deletedAtTimestamp) DateTime? deletedAt,@JsonFlavoured({Action.create, Action.delete}, value: deletedFlag) bool? deleted
});




}
/// @nodoc
class __$TestModelCopyWithImpl<$Res>
    implements _$TestModelCopyWith<$Res> {
  __$TestModelCopyWithImpl(this._self, this._then);

  final _TestModel _self;
  final $Res Function(_TestModel) _then;

/// Create a copy of TestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? deletedAt = freezed,Object? deleted = freezed,}) {
  return _then(_TestModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deleted: freezed == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}

// dart format on
