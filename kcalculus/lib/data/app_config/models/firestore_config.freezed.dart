// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firestore_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FirestoreConfig {

 int get deleteBatchSize; int get importBatchSize;
/// Create a copy of FirestoreConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirestoreConfigCopyWith<FirestoreConfig> get copyWith => _$FirestoreConfigCopyWithImpl<FirestoreConfig>(this as FirestoreConfig, _$identity);

  /// Serializes this FirestoreConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirestoreConfig&&(identical(other.deleteBatchSize, deleteBatchSize) || other.deleteBatchSize == deleteBatchSize)&&(identical(other.importBatchSize, importBatchSize) || other.importBatchSize == importBatchSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deleteBatchSize,importBatchSize);

@override
String toString() {
  return 'FirestoreConfig(deleteBatchSize: $deleteBatchSize, importBatchSize: $importBatchSize)';
}


}

/// @nodoc
abstract mixin class $FirestoreConfigCopyWith<$Res>  {
  factory $FirestoreConfigCopyWith(FirestoreConfig value, $Res Function(FirestoreConfig) _then) = _$FirestoreConfigCopyWithImpl;
@useResult
$Res call({
 int deleteBatchSize, int importBatchSize
});




}
/// @nodoc
class _$FirestoreConfigCopyWithImpl<$Res>
    implements $FirestoreConfigCopyWith<$Res> {
  _$FirestoreConfigCopyWithImpl(this._self, this._then);

  final FirestoreConfig _self;
  final $Res Function(FirestoreConfig) _then;

/// Create a copy of FirestoreConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? deleteBatchSize = null,Object? importBatchSize = null,}) {
  return _then(_self.copyWith(
deleteBatchSize: null == deleteBatchSize ? _self.deleteBatchSize : deleteBatchSize // ignore: cast_nullable_to_non_nullable
as int,importBatchSize: null == importBatchSize ? _self.importBatchSize : importBatchSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [FirestoreConfig].
extension FirestoreConfigPatterns on FirestoreConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FirestoreConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FirestoreConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FirestoreConfig value)  $default,){
final _that = this;
switch (_that) {
case _FirestoreConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FirestoreConfig value)?  $default,){
final _that = this;
switch (_that) {
case _FirestoreConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int deleteBatchSize,  int importBatchSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FirestoreConfig() when $default != null:
return $default(_that.deleteBatchSize,_that.importBatchSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int deleteBatchSize,  int importBatchSize)  $default,) {final _that = this;
switch (_that) {
case _FirestoreConfig():
return $default(_that.deleteBatchSize,_that.importBatchSize);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int deleteBatchSize,  int importBatchSize)?  $default,) {final _that = this;
switch (_that) {
case _FirestoreConfig() when $default != null:
return $default(_that.deleteBatchSize,_that.importBatchSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FirestoreConfig implements FirestoreConfig {
  const _FirestoreConfig({this.deleteBatchSize = kDefaultDeleteBatchSize, this.importBatchSize = kDefaultImportBatchSize});
  factory _FirestoreConfig.fromJson(Map<String, dynamic> json) => _$FirestoreConfigFromJson(json);

@override@JsonKey() final  int deleteBatchSize;
@override@JsonKey() final  int importBatchSize;

/// Create a copy of FirestoreConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FirestoreConfigCopyWith<_FirestoreConfig> get copyWith => __$FirestoreConfigCopyWithImpl<_FirestoreConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FirestoreConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FirestoreConfig&&(identical(other.deleteBatchSize, deleteBatchSize) || other.deleteBatchSize == deleteBatchSize)&&(identical(other.importBatchSize, importBatchSize) || other.importBatchSize == importBatchSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,deleteBatchSize,importBatchSize);

@override
String toString() {
  return 'FirestoreConfig(deleteBatchSize: $deleteBatchSize, importBatchSize: $importBatchSize)';
}


}

/// @nodoc
abstract mixin class _$FirestoreConfigCopyWith<$Res> implements $FirestoreConfigCopyWith<$Res> {
  factory _$FirestoreConfigCopyWith(_FirestoreConfig value, $Res Function(_FirestoreConfig) _then) = __$FirestoreConfigCopyWithImpl;
@override @useResult
$Res call({
 int deleteBatchSize, int importBatchSize
});




}
/// @nodoc
class __$FirestoreConfigCopyWithImpl<$Res>
    implements _$FirestoreConfigCopyWith<$Res> {
  __$FirestoreConfigCopyWithImpl(this._self, this._then);

  final _FirestoreConfig _self;
  final $Res Function(_FirestoreConfig) _then;

/// Create a copy of FirestoreConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? deleteBatchSize = null,Object? importBatchSize = null,}) {
  return _then(_FirestoreConfig(
deleteBatchSize: null == deleteBatchSize ? _self.deleteBatchSize : deleteBatchSize // ignore: cast_nullable_to_non_nullable
as int,importBatchSize: null == importBatchSize ? _self.importBatchSize : importBatchSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
