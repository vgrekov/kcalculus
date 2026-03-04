// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'import_lock_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ImportLockFirestoreModel {

 String get deviceId;
/// Create a copy of ImportLockFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImportLockFirestoreModelCopyWith<ImportLockFirestoreModel> get copyWith => _$ImportLockFirestoreModelCopyWithImpl<ImportLockFirestoreModel>(this as ImportLockFirestoreModel, _$identity);

  /// Serializes this ImportLockFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ImportLockFirestoreModel&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString() {
  return 'ImportLockFirestoreModel(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class $ImportLockFirestoreModelCopyWith<$Res>  {
  factory $ImportLockFirestoreModelCopyWith(ImportLockFirestoreModel value, $Res Function(ImportLockFirestoreModel) _then) = _$ImportLockFirestoreModelCopyWithImpl;
@useResult
$Res call({
 String deviceId
});




}
/// @nodoc
class _$ImportLockFirestoreModelCopyWithImpl<$Res>
    implements $ImportLockFirestoreModelCopyWith<$Res> {
  _$ImportLockFirestoreModelCopyWithImpl(this._self, this._then);

  final ImportLockFirestoreModel _self;
  final $Res Function(ImportLockFirestoreModel) _then;

/// Create a copy of ImportLockFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deviceId = null,}) {
  return _then(_self.copyWith(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ImportLockFirestoreModel].
extension ImportLockFirestoreModelPatterns on ImportLockFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ImportLockFirestoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ImportLockFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ImportLockFirestoreModel value)  $default,){
final _that = this;
switch (_that) {
case _ImportLockFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ImportLockFirestoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _ImportLockFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String deviceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ImportLockFirestoreModel() when $default != null:
return $default(_that.deviceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String deviceId)  $default,) {final _that = this;
switch (_that) {
case _ImportLockFirestoreModel():
return $default(_that.deviceId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String deviceId)?  $default,) {final _that = this;
switch (_that) {
case _ImportLockFirestoreModel() when $default != null:
return $default(_that.deviceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ImportLockFirestoreModel implements ImportLockFirestoreModel {
  const _ImportLockFirestoreModel({required this.deviceId});
  factory _ImportLockFirestoreModel.fromJson(Map<String, dynamic> json) => _$ImportLockFirestoreModelFromJson(json);

@override final  String deviceId;

/// Create a copy of ImportLockFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImportLockFirestoreModelCopyWith<_ImportLockFirestoreModel> get copyWith => __$ImportLockFirestoreModelCopyWithImpl<_ImportLockFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImportLockFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ImportLockFirestoreModel&&(identical(other.deviceId, deviceId) || other.deviceId == deviceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deviceId);

@override
String toString() {
  return 'ImportLockFirestoreModel(deviceId: $deviceId)';
}


}

/// @nodoc
abstract mixin class _$ImportLockFirestoreModelCopyWith<$Res> implements $ImportLockFirestoreModelCopyWith<$Res> {
  factory _$ImportLockFirestoreModelCopyWith(_ImportLockFirestoreModel value, $Res Function(_ImportLockFirestoreModel) _then) = __$ImportLockFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
 String deviceId
});




}
/// @nodoc
class __$ImportLockFirestoreModelCopyWithImpl<$Res>
    implements _$ImportLockFirestoreModelCopyWith<$Res> {
  __$ImportLockFirestoreModelCopyWithImpl(this._self, this._then);

  final _ImportLockFirestoreModel _self;
  final $Res Function(_ImportLockFirestoreModel) _then;

/// Create a copy of ImportLockFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deviceId = null,}) {
  return _then(_ImportLockFirestoreModel(
deviceId: null == deviceId ? _self.deviceId : deviceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
