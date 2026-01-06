// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'model_l0.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ModelL0 {

 String? get id; String get name;@JsonKey(name: 'desc') String? get description; ModelL1? get child;@JsonKey(name: 'grand_child') ModelL2? get grandChild;
/// Create a copy of ModelL0
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ModelL0CopyWith<ModelL0> get copyWith => _$ModelL0CopyWithImpl<ModelL0>(this as ModelL0, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ModelL0&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.child, child) || other.child == child)&&(identical(other.grandChild, grandChild) || other.grandChild == grandChild));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,child,grandChild);

@override
String toString() {
  return 'ModelL0(id: $id, name: $name, description: $description, child: $child, grandChild: $grandChild)';
}


}

/// @nodoc
abstract mixin class $ModelL0CopyWith<$Res>  {
  factory $ModelL0CopyWith(ModelL0 value, $Res Function(ModelL0) _then) = _$ModelL0CopyWithImpl;
@useResult
$Res call({
 String? id, String name,@JsonKey(name: 'desc') String? description, ModelL1? child,@JsonKey(name: 'grand_child') ModelL2? grandChild
});


$ModelL1CopyWith<$Res>? get child;$ModelL2CopyWith<$Res>? get grandChild;

}
/// @nodoc
class _$ModelL0CopyWithImpl<$Res>
    implements $ModelL0CopyWith<$Res> {
  _$ModelL0CopyWithImpl(this._self, this._then);

  final ModelL0 _self;
  final $Res Function(ModelL0) _then;

/// Create a copy of ModelL0
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? child = freezed,Object? grandChild = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,child: freezed == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as ModelL1?,grandChild: freezed == grandChild ? _self.grandChild : grandChild // ignore: cast_nullable_to_non_nullable
as ModelL2?,
  ));
}
/// Create a copy of ModelL0
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelL1CopyWith<$Res>? get child {
    if (_self.child == null) {
    return null;
  }

  return $ModelL1CopyWith<$Res>(_self.child!, (value) {
    return _then(_self.copyWith(child: value));
  });
}/// Create a copy of ModelL0
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelL2CopyWith<$Res>? get grandChild {
    if (_self.grandChild == null) {
    return null;
  }

  return $ModelL2CopyWith<$Res>(_self.grandChild!, (value) {
    return _then(_self.copyWith(grandChild: value));
  });
}
}


/// Adds pattern-matching-related methods to [ModelL0].
extension ModelL0Patterns on ModelL0 {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ModelL0 value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ModelL0() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ModelL0 value)  $default,){
final _that = this;
switch (_that) {
case _ModelL0():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ModelL0 value)?  $default,){
final _that = this;
switch (_that) {
case _ModelL0() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String name, @JsonKey(name: 'desc')  String? description,  ModelL1? child, @JsonKey(name: 'grand_child')  ModelL2? grandChild)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ModelL0() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.child,_that.grandChild);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String name, @JsonKey(name: 'desc')  String? description,  ModelL1? child, @JsonKey(name: 'grand_child')  ModelL2? grandChild)  $default,) {final _that = this;
switch (_that) {
case _ModelL0():
return $default(_that.id,_that.name,_that.description,_that.child,_that.grandChild);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String name, @JsonKey(name: 'desc')  String? description,  ModelL1? child, @JsonKey(name: 'grand_child')  ModelL2? grandChild)?  $default,) {final _that = this;
switch (_that) {
case _ModelL0() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.child,_that.grandChild);case _:
  return null;

}
}

}

/// @nodoc


class _ModelL0 implements ModelL0 {
  const _ModelL0({this.id, required this.name, @JsonKey(name: 'desc') this.description, this.child, @JsonKey(name: 'grand_child') this.grandChild});
  

@override final  String? id;
@override final  String name;
@override@JsonKey(name: 'desc') final  String? description;
@override final  ModelL1? child;
@override@JsonKey(name: 'grand_child') final  ModelL2? grandChild;

/// Create a copy of ModelL0
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ModelL0CopyWith<_ModelL0> get copyWith => __$ModelL0CopyWithImpl<_ModelL0>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ModelL0&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.child, child) || other.child == child)&&(identical(other.grandChild, grandChild) || other.grandChild == grandChild));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,description,child,grandChild);

@override
String toString() {
  return 'ModelL0(id: $id, name: $name, description: $description, child: $child, grandChild: $grandChild)';
}


}

/// @nodoc
abstract mixin class _$ModelL0CopyWith<$Res> implements $ModelL0CopyWith<$Res> {
  factory _$ModelL0CopyWith(_ModelL0 value, $Res Function(_ModelL0) _then) = __$ModelL0CopyWithImpl;
@override @useResult
$Res call({
 String? id, String name,@JsonKey(name: 'desc') String? description, ModelL1? child,@JsonKey(name: 'grand_child') ModelL2? grandChild
});


@override $ModelL1CopyWith<$Res>? get child;@override $ModelL2CopyWith<$Res>? get grandChild;

}
/// @nodoc
class __$ModelL0CopyWithImpl<$Res>
    implements _$ModelL0CopyWith<$Res> {
  __$ModelL0CopyWithImpl(this._self, this._then);

  final _ModelL0 _self;
  final $Res Function(_ModelL0) _then;

/// Create a copy of ModelL0
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? description = freezed,Object? child = freezed,Object? grandChild = freezed,}) {
  return _then(_ModelL0(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,child: freezed == child ? _self.child : child // ignore: cast_nullable_to_non_nullable
as ModelL1?,grandChild: freezed == grandChild ? _self.grandChild : grandChild // ignore: cast_nullable_to_non_nullable
as ModelL2?,
  ));
}

/// Create a copy of ModelL0
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelL1CopyWith<$Res>? get child {
    if (_self.child == null) {
    return null;
  }

  return $ModelL1CopyWith<$Res>(_self.child!, (value) {
    return _then(_self.copyWith(child: value));
  });
}/// Create a copy of ModelL0
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ModelL2CopyWith<$Res>? get grandChild {
    if (_self.grandChild == null) {
    return null;
  }

  return $ModelL2CopyWith<$Res>(_self.grandChild!, (value) {
    return _then(_self.copyWith(grandChild: value));
  });
}
}

// dart format on
