// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_v1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FoodV1 {

 String? get id; String get name; String get description; List<NutritionFactsV1> get nutritionFacts; DateTime? get createdAt; DateTime? get updatedAt;
/// Create a copy of FoodV1
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FoodV1CopyWith<FoodV1> get copyWith => _$FoodV1CopyWithImpl<FoodV1>(this as FoodV1, _$identity);

  /// Serializes this FoodV1 to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FoodV1&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.nutritionFacts, nutritionFacts)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(nutritionFacts),createdAt,updatedAt);

@override
String toString() {
  return 'FoodV1(id: $id, name: $name, description: $description, nutritionFacts: $nutritionFacts, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class $FoodV1CopyWith<$Res>  {
  factory $FoodV1CopyWith(FoodV1 value, $Res Function(FoodV1) _then) = _$FoodV1CopyWithImpl;
@useResult
$Res call({
 String? id, String name, String description, List<NutritionFactsV1> nutritionFacts, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class _$FoodV1CopyWithImpl<$Res>
    implements $FoodV1CopyWith<$Res> {
  _$FoodV1CopyWithImpl(this._self, this._then);

  final FoodV1 _self;
  final $Res Function(FoodV1) _then;

/// Create a copy of FoodV1
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? nutritionFacts = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,nutritionFacts: null == nutritionFacts ? _self.nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFactsV1>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [FoodV1].
extension FoodV1Patterns on FoodV1 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FoodV1 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FoodV1() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FoodV1 value)  $default,){
final _that = this;
switch (_that) {
case _FoodV1():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FoodV1 value)?  $default,){
final _that = this;
switch (_that) {
case _FoodV1() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name,  String description,  List<NutritionFactsV1> nutritionFacts,  DateTime? createdAt,  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FoodV1() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.nutritionFacts,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name,  String description,  List<NutritionFactsV1> nutritionFacts,  DateTime? createdAt,  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _FoodV1():
return $default(_that.id,_that.name,_that.description,_that.nutritionFacts,_that.createdAt,_that.updatedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name,  String description,  List<NutritionFactsV1> nutritionFacts,  DateTime? createdAt,  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _FoodV1() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.nutritionFacts,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FoodV1 extends FoodV1 {
  const _FoodV1({this.id, required this.name, required this.description, required final  List<NutritionFactsV1> nutritionFacts, this.createdAt, this.updatedAt}): _nutritionFacts = nutritionFacts,super._();
  factory _FoodV1.fromJson(Map<String, dynamic> json) => _$FoodV1FromJson(json);

@override final  String? id;
@override final  String name;
@override final  String description;
 final  List<NutritionFactsV1> _nutritionFacts;
@override List<NutritionFactsV1> get nutritionFacts {
  if (_nutritionFacts is EqualUnmodifiableListView) return _nutritionFacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_nutritionFacts);
}

@override final  DateTime? createdAt;
@override final  DateTime? updatedAt;

/// Create a copy of FoodV1
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoodV1CopyWith<_FoodV1> get copyWith => __$FoodV1CopyWithImpl<_FoodV1>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FoodV1ToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FoodV1&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._nutritionFacts, _nutritionFacts)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,const DeepCollectionEquality().hash(_nutritionFacts),createdAt,updatedAt);

@override
String toString() {
  return 'FoodV1(id: $id, name: $name, description: $description, nutritionFacts: $nutritionFacts, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$FoodV1CopyWith<$Res> implements $FoodV1CopyWith<$Res> {
  factory _$FoodV1CopyWith(_FoodV1 value, $Res Function(_FoodV1) _then) = __$FoodV1CopyWithImpl;
@override @useResult
$Res call({
 String? id, String name, String description, List<NutritionFactsV1> nutritionFacts, DateTime? createdAt, DateTime? updatedAt
});




}
/// @nodoc
class __$FoodV1CopyWithImpl<$Res>
    implements _$FoodV1CopyWith<$Res> {
  __$FoodV1CopyWithImpl(this._self, this._then);

  final _FoodV1 _self;
  final $Res Function(_FoodV1) _then;

/// Create a copy of FoodV1
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = null,Object? nutritionFacts = null,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_FoodV1(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,nutritionFacts: null == nutritionFacts ? _self._nutritionFacts : nutritionFacts // ignore: cast_nullable_to_non_nullable
as List<NutritionFactsV1>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
