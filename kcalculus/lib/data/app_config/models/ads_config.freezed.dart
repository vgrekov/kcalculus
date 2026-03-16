// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ads_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdsConfig {

 bool get enabled; InterstitialAdsConfig get interstitial; UnlockAdsConfig get unlock;
/// Create a copy of AdsConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdsConfigCopyWith<AdsConfig> get copyWith => _$AdsConfigCopyWithImpl<AdsConfig>(this as AdsConfig, _$identity);

  /// Serializes this AdsConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdsConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.interstitial, interstitial) || other.interstitial == interstitial)&&(identical(other.unlock, unlock) || other.unlock == unlock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,interstitial,unlock);

@override
String toString() {
  return 'AdsConfig(enabled: $enabled, interstitial: $interstitial, unlock: $unlock)';
}


}

/// @nodoc
abstract mixin class $AdsConfigCopyWith<$Res>  {
  factory $AdsConfigCopyWith(AdsConfig value, $Res Function(AdsConfig) _then) = _$AdsConfigCopyWithImpl;
@useResult
$Res call({
 bool enabled, InterstitialAdsConfig interstitial, UnlockAdsConfig unlock
});


$InterstitialAdsConfigCopyWith<$Res> get interstitial;$UnlockAdsConfigCopyWith<$Res> get unlock;

}
/// @nodoc
class _$AdsConfigCopyWithImpl<$Res>
    implements $AdsConfigCopyWith<$Res> {
  _$AdsConfigCopyWithImpl(this._self, this._then);

  final AdsConfig _self;
  final $Res Function(AdsConfig) _then;

/// Create a copy of AdsConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? enabled = null,Object? interstitial = null,Object? unlock = null,}) {
  return _then(_self.copyWith(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,interstitial: null == interstitial ? _self.interstitial : interstitial // ignore: cast_nullable_to_non_nullable
as InterstitialAdsConfig,unlock: null == unlock ? _self.unlock : unlock // ignore: cast_nullable_to_non_nullable
as UnlockAdsConfig,
  ));
}
/// Create a copy of AdsConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterstitialAdsConfigCopyWith<$Res> get interstitial {
  
  return $InterstitialAdsConfigCopyWith<$Res>(_self.interstitial, (value) {
    return _then(_self.copyWith(interstitial: value));
  });
}/// Create a copy of AdsConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnlockAdsConfigCopyWith<$Res> get unlock {
  
  return $UnlockAdsConfigCopyWith<$Res>(_self.unlock, (value) {
    return _then(_self.copyWith(unlock: value));
  });
}
}


/// Adds pattern-matching-related methods to [AdsConfig].
extension AdsConfigPatterns on AdsConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdsConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdsConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdsConfig value)  $default,){
final _that = this;
switch (_that) {
case _AdsConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdsConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AdsConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool enabled,  InterstitialAdsConfig interstitial,  UnlockAdsConfig unlock)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdsConfig() when $default != null:
return $default(_that.enabled,_that.interstitial,_that.unlock);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool enabled,  InterstitialAdsConfig interstitial,  UnlockAdsConfig unlock)  $default,) {final _that = this;
switch (_that) {
case _AdsConfig():
return $default(_that.enabled,_that.interstitial,_that.unlock);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool enabled,  InterstitialAdsConfig interstitial,  UnlockAdsConfig unlock)?  $default,) {final _that = this;
switch (_that) {
case _AdsConfig() when $default != null:
return $default(_that.enabled,_that.interstitial,_that.unlock);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdsConfig implements AdsConfig {
  const _AdsConfig({this.enabled = true, required this.interstitial, required this.unlock});
  factory _AdsConfig.fromJson(Map<String, dynamic> json) => _$AdsConfigFromJson(json);

@override@JsonKey() final  bool enabled;
@override final  InterstitialAdsConfig interstitial;
@override final  UnlockAdsConfig unlock;

/// Create a copy of AdsConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdsConfigCopyWith<_AdsConfig> get copyWith => __$AdsConfigCopyWithImpl<_AdsConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdsConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdsConfig&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.interstitial, interstitial) || other.interstitial == interstitial)&&(identical(other.unlock, unlock) || other.unlock == unlock));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,enabled,interstitial,unlock);

@override
String toString() {
  return 'AdsConfig(enabled: $enabled, interstitial: $interstitial, unlock: $unlock)';
}


}

/// @nodoc
abstract mixin class _$AdsConfigCopyWith<$Res> implements $AdsConfigCopyWith<$Res> {
  factory _$AdsConfigCopyWith(_AdsConfig value, $Res Function(_AdsConfig) _then) = __$AdsConfigCopyWithImpl;
@override @useResult
$Res call({
 bool enabled, InterstitialAdsConfig interstitial, UnlockAdsConfig unlock
});


@override $InterstitialAdsConfigCopyWith<$Res> get interstitial;@override $UnlockAdsConfigCopyWith<$Res> get unlock;

}
/// @nodoc
class __$AdsConfigCopyWithImpl<$Res>
    implements _$AdsConfigCopyWith<$Res> {
  __$AdsConfigCopyWithImpl(this._self, this._then);

  final _AdsConfig _self;
  final $Res Function(_AdsConfig) _then;

/// Create a copy of AdsConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? enabled = null,Object? interstitial = null,Object? unlock = null,}) {
  return _then(_AdsConfig(
enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,interstitial: null == interstitial ? _self.interstitial : interstitial // ignore: cast_nullable_to_non_nullable
as InterstitialAdsConfig,unlock: null == unlock ? _self.unlock : unlock // ignore: cast_nullable_to_non_nullable
as UnlockAdsConfig,
  ));
}

/// Create a copy of AdsConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InterstitialAdsConfigCopyWith<$Res> get interstitial {
  
  return $InterstitialAdsConfigCopyWith<$Res>(_self.interstitial, (value) {
    return _then(_self.copyWith(interstitial: value));
  });
}/// Create a copy of AdsConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UnlockAdsConfigCopyWith<$Res> get unlock {
  
  return $UnlockAdsConfigCopyWith<$Res>(_self.unlock, (value) {
    return _then(_self.copyWith(unlock: value));
  });
}
}

// dart format on
