// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_l1.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModelL1 {

 String? get id; String get name;@JsonKey(name: 'desc') String? get description; ModelL2? get child;
/// Create a copy of ModelL1
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelL1CopyWith<ModelL1> get copyWith => _$ModelL1CopyWithImpl<ModelL1>(this as ModelL1, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelL1&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.child, child) || other.child == child));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,child);

@override
String toString() {
  return 'ModelL1(id: $id, name: $name, description: $description, child: $child)';
}


}

/// @nodoc
abstract mixin class $ModelL1CopyWith<$Res>  {
  factory $ModelL1CopyWith(ModelL1 value, $Res Function(ModelL1) _then) = _$ModelL1CopyWithImpl;
@useResult
$Res call({
 String? id, String name,@JsonKey(name: 'desc') String? description, ModelL2? child
});


$ModelL2CopyWith<$Res>? get child;

}
/// @nodoc
class _$ModelL1CopyWithImpl<$Res>
    implements $ModelL1CopyWith<$Res> {
  _$ModelL1CopyWithImpl(this._self, this._then);

  final ModelL1 _self;
  final $Res Function(ModelL1) _then;

/// Create a copy of ModelL1
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? child = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,child: freezed == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as ModelL2?,
  ));
}
/// Create a copy of ModelL1
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelL2CopyWith<$Res>? get child {
    if (_self.child == null) {
    return null;
  }

  return $ModelL2CopyWith<$Res>(_self.child!, (value) {
    return _then(_self.copyWith(child: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModelL1].
extension ModelL1Patterns on ModelL1 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelL1 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelL1() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelL1 value)  $default,){
final _that = this;
switch (_that) {
case _ModelL1():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelL1 value)?  $default,){
final _that = this;
switch (_that) {
case _ModelL1() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name, @JsonKey(name: 'desc')  String? description,  ModelL2? child)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelL1() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.child);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name, @JsonKey(name: 'desc')  String? description,  ModelL2? child)  $default,) {final _that = this;
switch (_that) {
case _ModelL1():
return $default(_that.id,_that.name,_that.description,_that.child);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name, @JsonKey(name: 'desc')  String? description,  ModelL2? child)?  $default,) {final _that = this;
switch (_that) {
case _ModelL1() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.child);case _:
  return null;

}
}

}

/// @nodoc


class _ModelL1 implements ModelL1 {
  const _ModelL1({this.id, required this.name, @JsonKey(name: 'desc') this.description, this.child});
  

@override final  String? id;
@override final  String name;
@override@JsonKey(name: 'desc') final  String? description;
@override final  ModelL2? child;

/// Create a copy of ModelL1
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelL1CopyWith<_ModelL1> get copyWith => __$ModelL1CopyWithImpl<_ModelL1>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelL1&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.child, child) || other.child == child));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,child);

@override
String toString() {
  return 'ModelL1(id: $id, name: $name, description: $description, child: $child)';
}


}

/// @nodoc
abstract mixin class _$ModelL1CopyWith<$Res> implements $ModelL1CopyWith<$Res> {
  factory _$ModelL1CopyWith(_ModelL1 value, $Res Function(_ModelL1) _then) = __$ModelL1CopyWithImpl;
@override @useResult
$Res call({
 String? id, String name,@JsonKey(name: 'desc') String? description, ModelL2? child
});


@override $ModelL2CopyWith<$Res>? get child;

}
/// @nodoc
class __$ModelL1CopyWithImpl<$Res>
    implements _$ModelL1CopyWith<$Res> {
  __$ModelL1CopyWithImpl(this._self, this._then);

  final _ModelL1 _self;
  final $Res Function(_ModelL1) _then;

/// Create a copy of ModelL1
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? child = freezed,}) {
  return _then(_ModelL1(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,child: freezed == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as ModelL2?,
  ));
}

/// Create a copy of ModelL1
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelL2CopyWith<$Res>? get child {
    if (_self.child == null) {
    return null;
  }

  return $ModelL2CopyWith<$Res>(_self.child!, (value) {
    return _then(_self.copyWith(child: value));
  });
}
}

// dart format on
