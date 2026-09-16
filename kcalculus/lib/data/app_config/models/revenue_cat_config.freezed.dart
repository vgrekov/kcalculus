// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'revenue_cat_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RevenueCatConfig {

 String get sdkApiKey;
/// Create a copy of RevenueCatConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RevenueCatConfigCopyWith<RevenueCatConfig> get copyWith => _$RevenueCatConfigCopyWithImpl<RevenueCatConfig>(this as RevenueCatConfig, _$identity);

  /// Serializes this RevenueCatConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RevenueCatConfig&&(identical(other.sdkApiKey, sdkApiKey) || other.sdkApiKey == sdkApiKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sdkApiKey);

@override
String toString() {
  return 'RevenueCatConfig(sdkApiKey: $sdkApiKey)';
}


}

/// @nodoc
abstract mixin class $RevenueCatConfigCopyWith<$Res>  {
  factory $RevenueCatConfigCopyWith(RevenueCatConfig value, $Res Function(RevenueCatConfig) _then) = _$RevenueCatConfigCopyWithImpl;
@useResult
$Res call({
 String sdkApiKey
});




}
/// @nodoc
class _$RevenueCatConfigCopyWithImpl<$Res>
    implements $RevenueCatConfigCopyWith<$Res> {
  _$RevenueCatConfigCopyWithImpl(this._self, this._then);

  final RevenueCatConfig _self;
  final $Res Function(RevenueCatConfig) _then;

/// Create a copy of RevenueCatConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sdkApiKey = null,}) {
  return _then(_self.copyWith(
sdkApiKey: null == sdkApiKey ? _self.sdkApiKey : sdkApiKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RevenueCatConfig].
extension RevenueCatConfigPatterns on RevenueCatConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RevenueCatConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RevenueCatConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RevenueCatConfig value)  $default,){
final _that = this;
switch (_that) {
case _RevenueCatConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RevenueCatConfig value)?  $default,){
final _that = this;
switch (_that) {
case _RevenueCatConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sdkApiKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RevenueCatConfig() when $default != null:
return $default(_that.sdkApiKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sdkApiKey)  $default,) {final _that = this;
switch (_that) {
case _RevenueCatConfig():
return $default(_that.sdkApiKey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sdkApiKey)?  $default,) {final _that = this;
switch (_that) {
case _RevenueCatConfig() when $default != null:
return $default(_that.sdkApiKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RevenueCatConfig implements RevenueCatConfig {
  const _RevenueCatConfig({required this.sdkApiKey});
  factory _RevenueCatConfig.fromJson(Map<String, dynamic> json) => _$RevenueCatConfigFromJson(json);

@override final  String sdkApiKey;

/// Create a copy of RevenueCatConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RevenueCatConfigCopyWith<_RevenueCatConfig> get copyWith => __$RevenueCatConfigCopyWithImpl<_RevenueCatConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RevenueCatConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RevenueCatConfig&&(identical(other.sdkApiKey, sdkApiKey) || other.sdkApiKey == sdkApiKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sdkApiKey);

@override
String toString() {
  return 'RevenueCatConfig(sdkApiKey: $sdkApiKey)';
}


}

/// @nodoc
abstract mixin class _$RevenueCatConfigCopyWith<$Res> implements $RevenueCatConfigCopyWith<$Res> {
  factory _$RevenueCatConfigCopyWith(_RevenueCatConfig value, $Res Function(_RevenueCatConfig) _then) = __$RevenueCatConfigCopyWithImpl;
@override @useResult
$Res call({
 String sdkApiKey
});




}
/// @nodoc
class __$RevenueCatConfigCopyWithImpl<$Res>
    implements _$RevenueCatConfigCopyWith<$Res> {
  __$RevenueCatConfigCopyWithImpl(this._self, this._then);

  final _RevenueCatConfig _self;
  final $Res Function(_RevenueCatConfig) _then;

/// Create a copy of RevenueCatConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sdkApiKey = null,}) {
  return _then(_RevenueCatConfig(
sdkApiKey: null == sdkApiKey ? _self.sdkApiKey : sdkApiKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
