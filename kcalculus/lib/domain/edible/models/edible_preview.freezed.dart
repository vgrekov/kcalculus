// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edible_preview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EdiblePreview {

 String get id; String get name; String get description; EdiblePreviewType get type; NutritionFactsPreview? get nutritionFactsPreview; DateTime? get lastEatenAt; DateTime? get touchedAt; DateTime? get deletedAt; bool get isRecent;
/// Create a copy of EdiblePreview
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EdiblePreviewCopyWith<EdiblePreview> get copyWith => _$EdiblePreviewCopyWithImpl<EdiblePreview>(this as EdiblePreview, _$identity);

  /// Serializes this EdiblePreview to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EdiblePreview&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.nutritionFactsPreview, nutritionFactsPreview) || other.nutritionFactsPreview == nutritionFactsPreview)&&(identical(other.lastEatenAt, lastEatenAt) || other.lastEatenAt == lastEatenAt)&&(identical(other.touchedAt, touchedAt) || other.touchedAt == touchedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isRecent, isRecent) || other.isRecent == isRecent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,type,nutritionFactsPreview,lastEatenAt,touchedAt,deletedAt,isRecent);

@override
String toString() {
  return 'EdiblePreview(id: $id, name: $name, description: $description, type: $type, nutritionFactsPreview: $nutritionFactsPreview, lastEatenAt: $lastEatenAt, touchedAt: $touchedAt, deletedAt: $deletedAt, isRecent: $isRecent)';
}


}

/// @nodoc
abstract mixin class $EdiblePreviewCopyWith<$Res>  {
  factory $EdiblePreviewCopyWith(EdiblePreview value, $Res Function(EdiblePreview) _then) = _$EdiblePreviewCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description, EdiblePreviewType type, NutritionFactsPreview? nutritionFactsPreview, DateTime? lastEatenAt, DateTime? touchedAt, DateTime? deletedAt, bool isRecent
});


$NutritionFactsPreviewCopyWith<$Res>? get nutritionFactsPreview;

}
/// @nodoc
class _$EdiblePreviewCopyWithImpl<$Res>
    implements $EdiblePreviewCopyWith<$Res> {
  _$EdiblePreviewCopyWithImpl(this._self, this._then);

  final EdiblePreview _self;
  final $Res Function(EdiblePreview) _then;

/// Create a copy of EdiblePreview
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? type = null,Object? nutritionFactsPreview = freezed,Object? lastEatenAt = freezed,Object? touchedAt = freezed,Object? deletedAt = freezed,Object? isRecent = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EdiblePreviewType,nutritionFactsPreview: freezed == nutritionFactsPreview ? _self.nutritionFactsPreview : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
as NutritionFactsPreview?,lastEatenAt: freezed == lastEatenAt ? _self.lastEatenAt : lastEatenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,touchedAt: freezed == touchedAt ? _self.touchedAt : touchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isRecent: null == isRecent ? _self.isRecent : isRecent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of EdiblePreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionFactsPreviewCopyWith<$Res>? get nutritionFactsPreview {
    if (_self.nutritionFactsPreview == null) {
    return null;
  }

  return $NutritionFactsPreviewCopyWith<$Res>(_self.nutritionFactsPreview!, (value) {
    return _then(_self.copyWith(nutritionFactsPreview: value));
  });
}
}


/// Adds pattern-matching-related methods to [EdiblePreview].
extension EdiblePreviewPatterns on EdiblePreview {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EdiblePreview value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EdiblePreview() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EdiblePreview value)  $default,){
final _that = this;
switch (_that) {
case _EdiblePreview():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EdiblePreview value)?  $default,){
final _that = this;
switch (_that) {
case _EdiblePreview() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description,  EdiblePreviewType type,  NutritionFactsPreview? nutritionFactsPreview,  DateTime? lastEatenAt,  DateTime? touchedAt,  DateTime? deletedAt,  bool isRecent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EdiblePreview() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.type,_that.nutritionFactsPreview,_that.lastEatenAt,_that.touchedAt,_that.deletedAt,_that.isRecent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description,  EdiblePreviewType type,  NutritionFactsPreview? nutritionFactsPreview,  DateTime? lastEatenAt,  DateTime? touchedAt,  DateTime? deletedAt,  bool isRecent)  $default,) {final _that = this;
switch (_that) {
case _EdiblePreview():
return $default(_that.id,_that.name,_that.description,_that.type,_that.nutritionFactsPreview,_that.lastEatenAt,_that.touchedAt,_that.deletedAt,_that.isRecent);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description,  EdiblePreviewType type,  NutritionFactsPreview? nutritionFactsPreview,  DateTime? lastEatenAt,  DateTime? touchedAt,  DateTime? deletedAt,  bool isRecent)?  $default,) {final _that = this;
switch (_that) {
case _EdiblePreview() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.type,_that.nutritionFactsPreview,_that.lastEatenAt,_that.touchedAt,_that.deletedAt,_that.isRecent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EdiblePreview implements EdiblePreview {
  const _EdiblePreview({required this.id, required this.name, required this.description, required this.type, this.nutritionFactsPreview, this.lastEatenAt, this.touchedAt, this.deletedAt, this.isRecent = false});
  factory _EdiblePreview.fromJson(Map<String, dynamic> json) => _$EdiblePreviewFromJson(json);

@override final  String id;
@override final  String name;
@override final  String description;
@override final  EdiblePreviewType type;
@override final  NutritionFactsPreview? nutritionFactsPreview;
@override final  DateTime? lastEatenAt;
@override final  DateTime? touchedAt;
@override final  DateTime? deletedAt;
@override@JsonKey() final  bool isRecent;

/// Create a copy of EdiblePreview
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EdiblePreviewCopyWith<_EdiblePreview> get copyWith => __$EdiblePreviewCopyWithImpl<_EdiblePreview>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EdiblePreviewToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EdiblePreview&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.nutritionFactsPreview, nutritionFactsPreview) || other.nutritionFactsPreview == nutritionFactsPreview)&&(identical(other.lastEatenAt, lastEatenAt) || other.lastEatenAt == lastEatenAt)&&(identical(other.touchedAt, touchedAt) || other.touchedAt == touchedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.isRecent, isRecent) || other.isRecent == isRecent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,type,nutritionFactsPreview,lastEatenAt,touchedAt,deletedAt,isRecent);

@override
String toString() {
  return 'EdiblePreview(id: $id, name: $name, description: $description, type: $type, nutritionFactsPreview: $nutritionFactsPreview, lastEatenAt: $lastEatenAt, touchedAt: $touchedAt, deletedAt: $deletedAt, isRecent: $isRecent)';
}


}

/// @nodoc
abstract mixin class _$EdiblePreviewCopyWith<$Res> implements $EdiblePreviewCopyWith<$Res> {
  factory _$EdiblePreviewCopyWith(_EdiblePreview value, $Res Function(_EdiblePreview) _then) = __$EdiblePreviewCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description, EdiblePreviewType type, NutritionFactsPreview? nutritionFactsPreview, DateTime? lastEatenAt, DateTime? touchedAt, DateTime? deletedAt, bool isRecent
});


@override $NutritionFactsPreviewCopyWith<$Res>? get nutritionFactsPreview;

}
/// @nodoc
class __$EdiblePreviewCopyWithImpl<$Res>
    implements _$EdiblePreviewCopyWith<$Res> {
  __$EdiblePreviewCopyWithImpl(this._self, this._then);

  final _EdiblePreview _self;
  final $Res Function(_EdiblePreview) _then;

/// Create a copy of EdiblePreview
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? type = null,Object? nutritionFactsPreview = freezed,Object? lastEatenAt = freezed,Object? touchedAt = freezed,Object? deletedAt = freezed,Object? isRecent = null,}) {
  return _then(_EdiblePreview(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as EdiblePreviewType,nutritionFactsPreview: freezed == nutritionFactsPreview ? _self.nutritionFactsPreview : nutritionFactsPreview // ignore: cast_nullable_to_non_nullable
as NutritionFactsPreview?,lastEatenAt: freezed == lastEatenAt ? _self.lastEatenAt : lastEatenAt // ignore: cast_nullable_to_non_nullable
as DateTime?,touchedAt: freezed == touchedAt ? _self.touchedAt : touchedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isRecent: null == isRecent ? _self.isRecent : isRecent // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of EdiblePreview
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NutritionFactsPreviewCopyWith<$Res>? get nutritionFactsPreview {
    if (_self.nutritionFactsPreview == null) {
    return null;
  }

  return $NutritionFactsPreviewCopyWith<$Res>(_self.nutritionFactsPreview!, (value) {
    return _then(_self.copyWith(nutritionFactsPreview: value));
  });
}
}

// dart format on
