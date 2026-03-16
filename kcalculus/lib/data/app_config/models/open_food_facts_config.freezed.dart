// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_food_facts_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OpenFoodFactsConfig {

 String get baseUrl; int get timeoutMillis; String get contactEmail;
/// Create a copy of OpenFoodFactsConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenFoodFactsConfigCopyWith<OpenFoodFactsConfig> get copyWith => _$OpenFoodFactsConfigCopyWithImpl<OpenFoodFactsConfig>(this as OpenFoodFactsConfig, _$identity);

  /// Serializes this OpenFoodFactsConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenFoodFactsConfig&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.timeoutMillis, timeoutMillis) || other.timeoutMillis == timeoutMillis)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseUrl,timeoutMillis,contactEmail);

@override
String toString() {
  return 'OpenFoodFactsConfig(baseUrl: $baseUrl, timeoutMillis: $timeoutMillis, contactEmail: $contactEmail)';
}


}

/// @nodoc
abstract mixin class $OpenFoodFactsConfigCopyWith<$Res>  {
  factory $OpenFoodFactsConfigCopyWith(OpenFoodFactsConfig value, $Res Function(OpenFoodFactsConfig) _then) = _$OpenFoodFactsConfigCopyWithImpl;
@useResult
$Res call({
 String baseUrl, int timeoutMillis, String contactEmail
});




}
/// @nodoc
class _$OpenFoodFactsConfigCopyWithImpl<$Res>
    implements $OpenFoodFactsConfigCopyWith<$Res> {
  _$OpenFoodFactsConfigCopyWithImpl(this._self, this._then);

  final OpenFoodFactsConfig _self;
  final $Res Function(OpenFoodFactsConfig) _then;

/// Create a copy of OpenFoodFactsConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseUrl = null,Object? timeoutMillis = null,Object? contactEmail = null,}) {
  return _then(_self.copyWith(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,timeoutMillis: null == timeoutMillis ? _self.timeoutMillis : timeoutMillis // ignore: cast_nullable_to_non_nullable
as int,contactEmail: null == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenFoodFactsConfig].
extension OpenFoodFactsConfigPatterns on OpenFoodFactsConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenFoodFactsConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenFoodFactsConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenFoodFactsConfig value)  $default,){
final _that = this;
switch (_that) {
case _OpenFoodFactsConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenFoodFactsConfig value)?  $default,){
final _that = this;
switch (_that) {
case _OpenFoodFactsConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String baseUrl,  int timeoutMillis,  String contactEmail)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenFoodFactsConfig() when $default != null:
return $default(_that.baseUrl,_that.timeoutMillis,_that.contactEmail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String baseUrl,  int timeoutMillis,  String contactEmail)  $default,) {final _that = this;
switch (_that) {
case _OpenFoodFactsConfig():
return $default(_that.baseUrl,_that.timeoutMillis,_that.contactEmail);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String baseUrl,  int timeoutMillis,  String contactEmail)?  $default,) {final _that = this;
switch (_that) {
case _OpenFoodFactsConfig() when $default != null:
return $default(_that.baseUrl,_that.timeoutMillis,_that.contactEmail);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenFoodFactsConfig implements OpenFoodFactsConfig {
  const _OpenFoodFactsConfig({required this.baseUrl, required this.timeoutMillis, required this.contactEmail});
  factory _OpenFoodFactsConfig.fromJson(Map<String, dynamic> json) => _$OpenFoodFactsConfigFromJson(json);

@override final  String baseUrl;
@override final  int timeoutMillis;
@override final  String contactEmail;

/// Create a copy of OpenFoodFactsConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenFoodFactsConfigCopyWith<_OpenFoodFactsConfig> get copyWith => __$OpenFoodFactsConfigCopyWithImpl<_OpenFoodFactsConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenFoodFactsConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenFoodFactsConfig&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.timeoutMillis, timeoutMillis) || other.timeoutMillis == timeoutMillis)&&(identical(other.contactEmail, contactEmail) || other.contactEmail == contactEmail));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,baseUrl,timeoutMillis,contactEmail);

@override
String toString() {
  return 'OpenFoodFactsConfig(baseUrl: $baseUrl, timeoutMillis: $timeoutMillis, contactEmail: $contactEmail)';
}


}

/// @nodoc
abstract mixin class _$OpenFoodFactsConfigCopyWith<$Res> implements $OpenFoodFactsConfigCopyWith<$Res> {
  factory _$OpenFoodFactsConfigCopyWith(_OpenFoodFactsConfig value, $Res Function(_OpenFoodFactsConfig) _then) = __$OpenFoodFactsConfigCopyWithImpl;
@override @useResult
$Res call({
 String baseUrl, int timeoutMillis, String contactEmail
});




}
/// @nodoc
class __$OpenFoodFactsConfigCopyWithImpl<$Res>
    implements _$OpenFoodFactsConfigCopyWith<$Res> {
  __$OpenFoodFactsConfigCopyWithImpl(this._self, this._then);

  final _OpenFoodFactsConfig _self;
  final $Res Function(_OpenFoodFactsConfig) _then;

/// Create a copy of OpenFoodFactsConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseUrl = null,Object? timeoutMillis = null,Object? contactEmail = null,}) {
  return _then(_OpenFoodFactsConfig(
baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,timeoutMillis: null == timeoutMillis ? _self.timeoutMillis : timeoutMillis // ignore: cast_nullable_to_non_nullable
as int,contactEmail: null == contactEmail ? _self.contactEmail : contactEmail // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
