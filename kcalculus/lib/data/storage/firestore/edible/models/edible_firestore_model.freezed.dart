// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdibleFirestoreModel {

@JsonKey(includeToJson: false) String? get id;@CreateOnly() EdibleType get type; String get name;@JsonKey(name: 'name_lower') String get nameLower; String get description;@JsonKey(name: 'description_lower') String get descriptionLower;@CreateOnly() String get ownerId; NutritionFactsPreviewFirestoreModel? get nutritionFactsPreview; List<NutritionFactsFirestoreModel>? get nutritionFacts; Map<Measure, NutritionRatioFirestoreModel>? get nutritionRatios; List<IngredientFirestoreModel>? get ingredients; List<String>? get ingredientIds;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? get createdAt;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() DateTime? get updatedAt;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) DateTime? get eatenAt;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreTouchedAt() DateTime? get touchedAt;@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) DateTime? get deletedAt;@CreateOnly.overrideValue(false) bool? get deleted;
/// Create a copy of EdibleFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EdibleFirestoreModelCopyWith<EdibleFirestoreModel> get copyWith => _$EdibleFirestoreModelCopyWithImpl<EdibleFirestoreModel>(this as EdibleFirestoreModel, _$identity);

  /// Serializes this EdibleFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EdibleFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameLower, nameLower) || other.nameLower == nameLower)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionLower, descriptionLower) || other.descriptionLower == descriptionLower)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.nutritionFactsPreview, nutritionFactsPreview) || other.nutritionFactsPreview == nutritionFactsPreview)&&const DeepCollectionEquality().equals(other.nutritionFacts, nutritionFacts)&&const DeepCollectionEquality().equals(other.nutritionRatios, nutritionRatios)&&const DeepCollectionEquality().equals(other.ingredients, ingredients)&&const DeepCollectionEquality().equals(other.ingredientIds, ingredientIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.touchedAt, touchedAt) || other.touchedAt == touchedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,nameLower,description,descriptionLower,ownerId,nutritionFactsPreview,const DeepCollectionEquality().hash(nutritionFacts),const DeepCollectionEquality().hash(nutritionRatios),const DeepCollectionEquality().hash(ingredients),const DeepCollectionEquality().hash(ingredientIds),createdAt,updatedAt,eatenAt,touchedAt,deletedAt,deleted);

@override
String toString() {
  return 'EdibleFirestoreModel(id: $id, type: $type, name: $name, nameLower: $nameLower, description: $description, descriptionLower: $descriptionLower, ownerId: $ownerId, nutritionFactsPreview: $nutritionFactsPreview, nutritionFacts: $nutritionFacts, nutritionRatios: $nutritionRatios, ingredients: $ingredients, ingredientIds: $ingredientIds, createdAt: $createdAt, updatedAt: $updatedAt, eatenAt: $eatenAt, touchedAt: $touchedAt, deletedAt: $deletedAt, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class $EdibleFirestoreModelCopyWith<$Res>  {
  factory $EdibleFirestoreModelCopyWith(EdibleFirestoreModel value, $Res Function(EdibleFirestoreModel) _then) = _$EdibleFirestoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String? id,@CreateOnly() EdibleType type, String name,@JsonKey(name: 'name_lower') String nameLower, String description,@JsonKey(name: 'description_lower') String descriptionLower,@CreateOnly() String ownerId, NutritionFactsPreviewFirestoreModel? nutritionFactsPreview, List<NutritionFactsFirestoreModel>? nutritionFacts, Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios, List<IngredientFirestoreModel>? ingredients, List<String>? ingredientIds,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? createdAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() DateTime? updatedAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) DateTime? eatenAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreTouchedAt() DateTime? touchedAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) DateTime? deletedAt,@CreateOnly.overrideValue(false) bool? deleted
});


$NutritionFactsPreviewFirestoreModelCopyWith<$Res>? get nutritionFactsPreview;

}
/// @nodoc
class _$EdibleFirestoreModelCopyWithImpl<$Res>
    implements $EdibleFirestoreModelCopyWith<$Res> {
  _$EdibleFirestoreModelCopyWithImpl(this._self, this._then);

  final EdibleFirestoreModel _self;
  final $Res Function(EdibleFirestoreModel) _then;

/// Create a copy of EdibleFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? type = null,Object? name = null,Object? nameLower = null,Object? description = null,Object? descriptionLower = null,Object? ownerId = null,Object? nutritionFactsPreview = freezed,Object? nutritionFacts = freezed,Object? nutritionRatios = freezed,Object? ingredients = freezed,Object? ingredientIds = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? eatenAt = freezed,Object? touchedAt = freezed,Object? deletedAt = freezed,Object? deleted = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EdibleType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameLower: null == nameLower ? _self.nameLower : nameLower // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,descriptionLower: null == descriptionLower ? _self.descriptionLower : descriptionLower // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,nutritionFactsPreview: freezed == nutritionFactsPreview ? _self.nutritionFactsPreview : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
as NutritionFactsPreviewFirestoreModel?,nutritionFacts: freezed == nutritionFacts ? _self.nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFactsFirestoreModel>?,nutritionRatios: freezed == nutritionRatios ? _self.nutritionRatios : nutritionRatios // ignore: cast_nullable_to_non_nullable
as Map<Measure, NutritionRatioFirestoreModel>?,ingredients: freezed == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientFirestoreModel>?,ingredientIds: freezed == ingredientIds ? _self.ingredientIds : ingredientIds // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,eatenAt: freezed == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,touchedAt: freezed == touchedAt ? _self.touchedAt : touchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deleted: freezed == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of EdibleFirestoreModel
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


/// Adds pattern-matching-related methods to [EdibleFirestoreModel].
extension EdibleFirestoreModelPatterns on EdibleFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EdibleFirestoreModel value)?  $default,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EdibleFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EdibleFirestoreModel value)  $default,}){
final _that = this;
switch (_that) {
case _EdibleFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EdibleFirestoreModel value)?  $default,}){
final _that = this;
switch (_that) {
case _EdibleFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@JsonKey(includeToJson: false)  String? id, @CreateOnly()  EdibleType type,  String name, @JsonKey(name: 'name_lower')  String nameLower,  String description, @JsonKey(name: 'description_lower')  String descriptionLower, @CreateOnly()  String ownerId,  NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,  List<NutritionFactsFirestoreModel>? nutritionFacts,  Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios,  List<IngredientFirestoreModel>? ingredients,  List<String>? ingredientIds, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt()  DateTime? updatedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null)  DateTime? eatenAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreTouchedAt()  DateTime? touchedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null)  DateTime? deletedAt, @CreateOnly.overrideValue(false)  bool? deleted)?  $default,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EdibleFirestoreModel() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.nameLower,_that.description,_that.descriptionLower,_that.ownerId,_that.nutritionFactsPreview,_that.nutritionFacts,_that.nutritionRatios,_that.ingredients,_that.ingredientIds,_that.createdAt,_that.updatedAt,_that.eatenAt,_that.touchedAt,_that.deletedAt,_that.deleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@JsonKey(includeToJson: false)  String? id, @CreateOnly()  EdibleType type,  String name, @JsonKey(name: 'name_lower')  String nameLower,  String description, @JsonKey(name: 'description_lower')  String descriptionLower, @CreateOnly()  String ownerId,  NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,  List<NutritionFactsFirestoreModel>? nutritionFacts,  Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios,  List<IngredientFirestoreModel>? ingredients,  List<String>? ingredientIds, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt()  DateTime? updatedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null)  DateTime? eatenAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreTouchedAt()  DateTime? touchedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null)  DateTime? deletedAt, @CreateOnly.overrideValue(false)  bool? deleted)  $default,}) {final _that = this;
switch (_that) {
case _EdibleFirestoreModel():
return $default(_that.id,_that.type,_that.name,_that.nameLower,_that.description,_that.descriptionLower,_that.ownerId,_that.nutritionFactsPreview,_that.nutritionFacts,_that.nutritionRatios,_that.ingredients,_that.ingredientIds,_that.createdAt,_that.updatedAt,_that.eatenAt,_that.touchedAt,_that.deletedAt,_that.deleted);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@JsonKey(includeToJson: false)  String? id, @CreateOnly()  EdibleType type,  String name, @JsonKey(name: 'name_lower')  String nameLower,  String description, @JsonKey(name: 'description_lower')  String descriptionLower, @CreateOnly()  String ownerId,  NutritionFactsPreviewFirestoreModel? nutritionFactsPreview,  List<NutritionFactsFirestoreModel>? nutritionFacts,  Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios,  List<IngredientFirestoreModel>? ingredients,  List<String>? ingredientIds, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt()  DateTime? createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt()  DateTime? updatedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null)  DateTime? eatenAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreTouchedAt()  DateTime? touchedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null)  DateTime? deletedAt, @CreateOnly.overrideValue(false)  bool? deleted)?  $default,}) {final _that = this;
switch (_that) {
case _EdibleFirestoreModel() when $default != null:
return $default(_that.id,_that.type,_that.name,_that.nameLower,_that.description,_that.descriptionLower,_that.ownerId,_that.nutritionFactsPreview,_that.nutritionFacts,_that.nutritionRatios,_that.ingredients,_that.ingredientIds,_that.createdAt,_that.updatedAt,_that.eatenAt,_that.touchedAt,_that.deletedAt,_that.deleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EdibleFirestoreModel extends EdibleFirestoreModel {
  const _EdibleFirestoreModel({@JsonKey(includeToJson: false) this.id, @CreateOnly() required this.type, required this.name, @JsonKey(name: 'name_lower') required this.nameLower, required this.description, @JsonKey(name: 'description_lower') required this.descriptionLower, @CreateOnly() required this.ownerId, this.nutritionFactsPreview, final  List<NutritionFactsFirestoreModel>? nutritionFacts, final  Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios, final  List<IngredientFirestoreModel>? ingredients, final  List<String>? ingredientIds, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() this.createdAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() this.updatedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) this.eatenAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreTouchedAt() this.touchedAt, @JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) this.deletedAt, @CreateOnly.overrideValue(false) this.deleted}): _nutritionFacts = nutritionFacts,_nutritionRatios = nutritionRatios,_ingredients = ingredients,_ingredientIds = ingredientIds,super._();
  factory _EdibleFirestoreModel.fromJson(Map<String, dynamic> json) => _$EdibleFirestoreModelFromJson(json);

@override@JsonKey(includeToJson: false) final  String? id;
@override@CreateOnly() final  EdibleType type;
@override final  String name;
@override@JsonKey(name: 'name_lower') final  String nameLower;
@override final  String description;
@override@JsonKey(name: 'description_lower') final  String descriptionLower;
@override@CreateOnly() final  String ownerId;
@override final  NutritionFactsPreviewFirestoreModel? nutritionFactsPreview;
 final  List<NutritionFactsFirestoreModel>? _nutritionFacts;
@override List<NutritionFactsFirestoreModel>? get nutritionFacts {
  final value = _nutritionFacts;
  if (value == null) return null;
  if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<Measure, NutritionRatioFirestoreModel>? _nutritionRatios;
@override Map<Measure, NutritionRatioFirestoreModel>? get nutritionRatios {
  final value = _nutritionRatios;
  if (value == null) return null;
  if (_nutritionRatios is EqualUnmodifiableMapView) return _nutritionRatios;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<IngredientFirestoreModel>? _ingredients;
@override List<IngredientFirestoreModel>? get ingredients {
  final value = _ingredients;
  if (value == null) return null;
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _ingredientIds;
@override List<String>? get ingredientIds {
  final value = _ingredientIds;
  if (value == null) return null;
  if (_ingredientIds is EqualUnmodifiableListView) return _ingredientIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() final  DateTime? createdAt;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() final  DateTime? updatedAt;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) final  DateTime? eatenAt;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreTouchedAt() final  DateTime? touchedAt;
@override@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) final  DateTime? deletedAt;
@override@CreateOnly.overrideValue(false) final  bool? deleted;

/// Create a copy of EdibleFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EdibleFirestoreModelCopyWith<_EdibleFirestoreModel> get copyWith => __$EdibleFirestoreModelCopyWithImpl<_EdibleFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EdibleFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EdibleFirestoreModel&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameLower, nameLower) || other.nameLower == nameLower)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionLower, descriptionLower) || other.descriptionLower == descriptionLower)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.nutritionFactsPreview, nutritionFactsPreview) || other.nutritionFactsPreview == nutritionFactsPreview)&&const DeepCollectionEquality().equals(other._nutritionFacts, _nutritionFacts)&&const DeepCollectionEquality().equals(other._nutritionRatios, _nutritionRatios)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients)&&const DeepCollectionEquality().equals(other._ingredientIds, _ingredientIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.eatenAt, eatenAt) || other.eatenAt == eatenAt)&&(identical(other.touchedAt, touchedAt) || other.touchedAt == touchedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.deleted, deleted) || other.deleted == deleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,name,nameLower,description,descriptionLower,ownerId,nutritionFactsPreview,const DeepCollectionEquality().hash(_nutritionFacts),const DeepCollectionEquality().hash(_nutritionRatios),const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_ingredientIds),createdAt,updatedAt,eatenAt,touchedAt,deletedAt,deleted);

@override
String toString() {
  return 'EdibleFirestoreModel.\$default(id: $id, type: $type, name: $name, nameLower: $nameLower, description: $description, descriptionLower: $descriptionLower, ownerId: $ownerId, nutritionFactsPreview: $nutritionFactsPreview, nutritionFacts: $nutritionFacts, nutritionRatios: $nutritionRatios, ingredients: $ingredients, ingredientIds: $ingredientIds, createdAt: $createdAt, updatedAt: $updatedAt, eatenAt: $eatenAt, touchedAt: $touchedAt, deletedAt: $deletedAt, deleted: $deleted)';
}


}

/// @nodoc
abstract mixin class _$EdibleFirestoreModelCopyWith<$Res> implements $EdibleFirestoreModelCopyWith<$Res> {
  factory _$EdibleFirestoreModelCopyWith(_EdibleFirestoreModel value, $Res Function(_EdibleFirestoreModel) _then) = __$EdibleFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String? id,@CreateOnly() EdibleType type, String name,@JsonKey(name: 'name_lower') String nameLower, String description,@JsonKey(name: 'description_lower') String descriptionLower,@CreateOnly() String ownerId, NutritionFactsPreviewFirestoreModel? nutritionFactsPreview, List<NutritionFactsFirestoreModel>? nutritionFacts, Map<Measure, NutritionRatioFirestoreModel>? nutritionRatios, List<IngredientFirestoreModel>? ingredients, List<String>? ingredientIds,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreCreatedAt() DateTime? createdAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreUpdatedAt() DateTime? updatedAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) DateTime? eatenAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@FirestoreTouchedAt() DateTime? touchedAt,@JsonKey(fromJson: timestampToDate, toJson: dateToTimestamp)@CreateOnly.overrideValue(null) DateTime? deletedAt,@CreateOnly.overrideValue(false) bool? deleted
});


@override $NutritionFactsPreviewFirestoreModelCopyWith<$Res>? get nutritionFactsPreview;

}
/// @nodoc
class __$EdibleFirestoreModelCopyWithImpl<$Res>
    implements _$EdibleFirestoreModelCopyWith<$Res> {
  __$EdibleFirestoreModelCopyWithImpl(this._self, this._then);

  final _EdibleFirestoreModel _self;
  final $Res Function(_EdibleFirestoreModel) _then;

/// Create a copy of EdibleFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? type = null,Object? name = null,Object? nameLower = null,Object? description = null,Object? descriptionLower = null,Object? ownerId = null,Object? nutritionFactsPreview = freezed,Object? nutritionFacts = freezed,Object? nutritionRatios = freezed,Object? ingredients = freezed,Object? ingredientIds = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? eatenAt = freezed,Object? touchedAt = freezed,Object? deletedAt = freezed,Object? deleted = freezed,}) {
  return _then(_EdibleFirestoreModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EdibleType,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameLower: null == nameLower ? _self.nameLower : nameLower // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,descriptionLower: null == descriptionLower ? _self.descriptionLower : descriptionLower // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,nutritionFactsPreview: freezed == nutritionFactsPreview ? _self.nutritionFactsPreview : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
as NutritionFactsPreviewFirestoreModel?,nutritionFacts: freezed == nutritionFacts ? _self._nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFactsFirestoreModel>?,nutritionRatios: freezed == nutritionRatios ? _self._nutritionRatios : nutritionRatios // ignore: cast_nullable_to_non_nullable
as Map<Measure, NutritionRatioFirestoreModel>?,ingredients: freezed == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientFirestoreModel>?,ingredientIds: freezed == ingredientIds ? _self._ingredientIds : ingredientIds // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,eatenAt: freezed == eatenAt ? _self.eatenAt : eatenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,touchedAt: freezed == touchedAt ? _self.touchedAt : touchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deleted: freezed == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of EdibleFirestoreModel
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
