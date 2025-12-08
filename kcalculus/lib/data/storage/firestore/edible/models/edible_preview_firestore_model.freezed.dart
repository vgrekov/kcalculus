// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_preview_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdiblePreviewFirestoreModel {

@JsonKey(includeToJson: false) String get id; EdibleType get type; String get name; String get description; String get ownerId; NutritionFactsPreviewFirestoreModel? get nutritionFactsPreview;@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? get eatenAt;@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? get touchedAt;@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? get deletedAt;
/// Create a copy of EdiblePreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EdiblePreviewFirestoreModelCopyWith<EdiblePreviewFirestoreModel> get copyWith => _$EdiblePreviewFirestoreModelCopyWithImpl<EdiblePreviewFirestoreModel>(this as EdiblePreviewFirestoreModel, _$identity);

  /// Serializes this EdiblePreviewFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EdiblePreviewFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.nutritionFactsPreview, nutritionFactsPreview) || other.nutritionFactsPreview == nutritionFactsPreview)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.touchedAt, touchedAt) || other.touchedAt == touchedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,description,ownerId,nutritionFactsPreview,eatenAt,touchedAt,deletedAt);

@override
String toString() {
  return 'EdiblePreviewFirestoreModel(id: $id, type: $type, name: $name, description: $description, ownerId: $ownerId, nutritionFactsPreview: $nutritionFactsPreview, eatenAt: $eatenAt, touchedAt: $touchedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class $EdiblePreviewFirestoreModelCopyWith<$Res>  {
  factory $EdiblePreviewFirestoreModelCopyWith(EdiblePreviewFirestoreModel value, $Res Function(EdiblePreviewFirestoreModel) _then) = _$EdiblePreviewFirestoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String id, EdibleType type, String name, String description, String ownerId, NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? eatenAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? touchedAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? deletedAt
});


$NutritionFactsPreviewFirestoreModelCopyWith<$Res>? get nutritionFactsPreview;

}
/// @nodoc
class _$EdiblePreviewFirestoreModelCopyWithImpl<$Res>
    implements $EdiblePreviewFirestoreModelCopyWith<$Res> {
  _$EdiblePreviewFirestoreModelCopyWithImpl(this._self, this._then);

  final EdiblePreviewFirestoreModel _self;
  final $Res Function(EdiblePreviewFirestoreModel) _then;

/// Create a copy of EdiblePreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? name = null,Object? description = null,Object? ownerId = null,Object? nutritionFactsPreview = freezed,Object? eatenAt = freezed,Object? touchedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EdibleType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,nutritionFactsPreview: freezed == nutritionFactsPreview ? _self.nutritionFactsPreview : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
as NutritionFactsPreviewFirestoreModel?,eatenAt: freezed == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,touchedAt: freezed == touchedAt ? _self.touchedAt : touchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of EdiblePreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionFactsPreviewFirestoreModelCopyWith<$Res>? get nutritionFactsPreview {
    if (_self.nutritionFactsPreview == null) {
    return null;
  }

  return $NutritionFactsPreviewFirestoreModelCopyWith<$Res>(_self.nutritionFactsPreview!, (value) {
    return _then(_self.copyWith(nutritionFactsPreview: value));
  });
}
}


/// Adds pattern-matching-related methods to [EdiblePreviewFirestoreModel].
extension EdiblePreviewFirestoreModelPatterns on EdiblePreviewFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EdiblePreviewFirestoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EdiblePreviewFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EdiblePreviewFirestoreModel value)  $default,){
final _that = this;
switch (_that) {
case _EdiblePreviewFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EdiblePreviewFirestoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _EdiblePreviewFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  EdibleType type,  String name,  String description,  String ownerId,  NutritionFactsPreviewFirestoreModel? nutritionFactsPreview, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? eatenAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? touchedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? deletedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EdiblePreviewFirestoreModel() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.description,_that.ownerId,_that.nutritionFactsPreview,_that.eatenAt,_that.touchedAt,_that.deletedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String id,  EdibleType type,  String name,  String description,  String ownerId,  NutritionFactsPreviewFirestoreModel? nutritionFactsPreview, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? eatenAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? touchedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? deletedAt)  $default,) {final _that = this;
switch (_that) {
case _EdiblePreviewFirestoreModel():
return $default(_that.id,_that.type,_that.name,_that.description,_that.ownerId,_that.nutritionFactsPreview,_that.eatenAt,_that.touchedAt,_that.deletedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String id,  EdibleType type,  String name,  String description,  String ownerId,  NutritionFactsPreviewFirestoreModel? nutritionFactsPreview, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? eatenAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? touchedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate)  DateTime? deletedAt)?  $default,) {final _that = this;
switch (_that) {
case _EdiblePreviewFirestoreModel() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.description,_that.ownerId,_that.nutritionFactsPreview,_that.eatenAt,_that.touchedAt,_that.deletedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EdiblePreviewFirestoreModel extends EdiblePreviewFirestoreModel {
  const _EdiblePreviewFirestoreModel({@JsonKey(includeToJson: false) required this.id, required this.type, required this.name, required this.description, required this.ownerId, this.nutritionFactsPreview, @JsonKey(includeToJson: false, fromJson: timestampToDate) this.eatenAt, @JsonKey(includeToJson: false, fromJson: timestampToDate) this.touchedAt, @JsonKey(includeToJson: false, fromJson: timestampToDate) this.deletedAt}): super._();
  factory _EdiblePreviewFirestoreModel.fromJson(Map<String, dynamic> json) => _$EdiblePreviewFirestoreModelFromJson(json);

@override@JsonKey(includeToJson: false) final  String id;
@override final  EdibleType type;
@override final  String name;
@override final  String description;
@override final  String ownerId;
@override final  NutritionFactsPreviewFirestoreModel? nutritionFactsPreview;
@override@JsonKey(includeToJson: false, fromJson: timestampToDate) final  DateTime? eatenAt;
@override@JsonKey(includeToJson: false, fromJson: timestampToDate) final  DateTime? touchedAt;
@override@JsonKey(includeToJson: false, fromJson: timestampToDate) final  DateTime? deletedAt;

/// Create a copy of EdiblePreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EdiblePreviewFirestoreModelCopyWith<_EdiblePreviewFirestoreModel> get copyWith => __$EdiblePreviewFirestoreModelCopyWithImpl<_EdiblePreviewFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EdiblePreviewFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EdiblePreviewFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.nutritionFactsPreview, nutritionFactsPreview) || other.nutritionFactsPreview == nutritionFactsPreview)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.touchedAt, touchedAt) || other.touchedAt == touchedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,description,ownerId,nutritionFactsPreview,eatenAt,touchedAt,deletedAt);

@override
String toString() {
  return 'EdiblePreviewFirestoreModel(id: $id, type: $type, name: $name, description: $description, ownerId: $ownerId, nutritionFactsPreview: $nutritionFactsPreview, eatenAt: $eatenAt, touchedAt: $touchedAt, deletedAt: $deletedAt)';
}


}

/// @nodoc
abstract mixin class _$EdiblePreviewFirestoreModelCopyWith<$Res> implements $EdiblePreviewFirestoreModelCopyWith<$Res> {
  factory _$EdiblePreviewFirestoreModelCopyWith(_EdiblePreviewFirestoreModel value, $Res Function(_EdiblePreviewFirestoreModel) _then) = __$EdiblePreviewFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String id, EdibleType type, String name, String description, String ownerId, NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? eatenAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? touchedAt,@JsonKey(includeToJson: false, fromJson: timestampToDate) DateTime? deletedAt
});


@override $NutritionFactsPreviewFirestoreModelCopyWith<$Res>? get nutritionFactsPreview;

}
/// @nodoc
class __$EdiblePreviewFirestoreModelCopyWithImpl<$Res>
    implements _$EdiblePreviewFirestoreModelCopyWith<$Res> {
  __$EdiblePreviewFirestoreModelCopyWithImpl(this._self, this._then);

  final _EdiblePreviewFirestoreModel _self;
  final $Res Function(_EdiblePreviewFirestoreModel) _then;

/// Create a copy of EdiblePreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? name = null,Object? description = null,Object? ownerId = null,Object? nutritionFactsPreview = freezed,Object? eatenAt = freezed,Object? touchedAt = freezed,Object? deletedAt = freezed,}) {
  return _then(_EdiblePreviewFirestoreModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EdibleType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,nutritionFactsPreview: freezed == nutritionFactsPreview ? _self.nutritionFactsPreview : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
as NutritionFactsPreviewFirestoreModel?,eatenAt: freezed == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,touchedAt: freezed == touchedAt ? _self.touchedAt : touchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of EdiblePreviewFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionFactsPreviewFirestoreModelCopyWith<$Res>? get nutritionFactsPreview {
    if (_self.nutritionFactsPreview == null) {
    return null;
  }

  return $NutritionFactsPreviewFirestoreModelCopyWith<$Res>(_self.nutritionFactsPreview!, (value) {
    return _then(_self.copyWith(nutritionFactsPreview: value));
  });
}
}

// dart format on
