// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interstitial_ads_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InterstitialAdsConfig {

 String get unitId; int get timeoutMillis; int get cooldownDurationMins; double get probability;
/// Create a copy of InterstitialAdsConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InterstitialAdsConfigCopyWith<InterstitialAdsConfig> get copyWith => _$InterstitialAdsConfigCopyWithImpl<InterstitialAdsConfig>(this as InterstitialAdsConfig, _$identity);

  /// Serializes this InterstitialAdsConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InterstitialAdsConfig&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.timeoutMillis, timeoutMillis) || other.timeoutMillis == timeoutMillis)&&(identical(other.cooldownDurationMins, cooldownDurationMins) || other.cooldownDurationMins == cooldownDurationMins)&&(identical(other.probability, probability) || other.probability == probability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitId,timeoutMillis,cooldownDurationMins,probability);

@override
String toString() {
  return 'InterstitialAdsConfig(unitId: $unitId, timeoutMillis: $timeoutMillis, cooldownDurationMins: $cooldownDurationMins, probability: $probability)';
}


}

/// @nodoc
abstract mixin class $InterstitialAdsConfigCopyWith<$Res>  {
  factory $InterstitialAdsConfigCopyWith(InterstitialAdsConfig value, $Res Function(InterstitialAdsConfig) _then) = _$InterstitialAdsConfigCopyWithImpl;
@useResult
$Res call({
 String unitId, int timeoutMillis, int cooldownDurationMins, double probability
});




}
/// @nodoc
class _$InterstitialAdsConfigCopyWithImpl<$Res>
    implements $InterstitialAdsConfigCopyWith<$Res> {
  _$InterstitialAdsConfigCopyWithImpl(this._self, this._then);

  final InterstitialAdsConfig _self;
  final $Res Function(InterstitialAdsConfig) _then;

/// Create a copy of InterstitialAdsConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unitId = null,Object? timeoutMillis = null,Object? cooldownDurationMins = null,Object? probability = null,}) {
  return _then(_self.copyWith(
unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,timeoutMillis: null == timeoutMillis ? _self.timeoutMillis : timeoutMillis // ignore: cast_nullable_to_non_nullable
as int,cooldownDurationMins: null == cooldownDurationMins ? _self.cooldownDurationMins : cooldownDurationMins // ignore: cast_nullable_to_non_nullable
as int,probability: null == probability ? _self.probability : probability // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [InterstitialAdsConfig].
extension InterstitialAdsConfigPatterns on InterstitialAdsConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InterstitialAdsConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InterstitialAdsConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InterstitialAdsConfig value)  $default,){
final _that = this;
switch (_that) {
case _InterstitialAdsConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InterstitialAdsConfig value)?  $default,){
final _that = this;
switch (_that) {
case _InterstitialAdsConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String unitId,  int timeoutMillis,  int cooldownDurationMins,  double probability)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InterstitialAdsConfig() when $default != null:
return $default(_that.unitId,_that.timeoutMillis,_that.cooldownDurationMins,_that.probability);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String unitId,  int timeoutMillis,  int cooldownDurationMins,  double probability)  $default,) {final _that = this;
switch (_that) {
case _InterstitialAdsConfig():
return $default(_that.unitId,_that.timeoutMillis,_that.cooldownDurationMins,_that.probability);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String unitId,  int timeoutMillis,  int cooldownDurationMins,  double probability)?  $default,) {final _that = this;
switch (_that) {
case _InterstitialAdsConfig() when $default != null:
return $default(_that.unitId,_that.timeoutMillis,_that.cooldownDurationMins,_that.probability);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InterstitialAdsConfig implements InterstitialAdsConfig {
  const _InterstitialAdsConfig({required this.unitId, required this.timeoutMillis, required this.cooldownDurationMins, required this.probability});
  factory _InterstitialAdsConfig.fromJson(Map<String, dynamic> json) => _$InterstitialAdsConfigFromJson(json);

@override final  String unitId;
@override final  int timeoutMillis;
@override final  int cooldownDurationMins;
@override final  double probability;

/// Create a copy of InterstitialAdsConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InterstitialAdsConfigCopyWith<_InterstitialAdsConfig> get copyWith => __$InterstitialAdsConfigCopyWithImpl<_InterstitialAdsConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InterstitialAdsConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InterstitialAdsConfig&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.timeoutMillis, timeoutMillis) || other.timeoutMillis == timeoutMillis)&&(identical(other.cooldownDurationMins, cooldownDurationMins) || other.cooldownDurationMins == cooldownDurationMins)&&(identical(other.probability, probability) || other.probability == probability));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitId,timeoutMillis,cooldownDurationMins,probability);

@override
String toString() {
  return 'InterstitialAdsConfig(unitId: $unitId, timeoutMillis: $timeoutMillis, cooldownDurationMins: $cooldownDurationMins, probability: $probability)';
}


}

/// @nodoc
abstract mixin class _$InterstitialAdsConfigCopyWith<$Res> implements $InterstitialAdsConfigCopyWith<$Res> {
  factory _$InterstitialAdsConfigCopyWith(_InterstitialAdsConfig value, $Res Function(_InterstitialAdsConfig) _then) = __$InterstitialAdsConfigCopyWithImpl;
@override @useResult
$Res call({
 String unitId, int timeoutMillis, int cooldownDurationMins, double probability
});




}
/// @nodoc
class __$InterstitialAdsConfigCopyWithImpl<$Res>
    implements _$InterstitialAdsConfigCopyWith<$Res> {
  __$InterstitialAdsConfigCopyWithImpl(this._self, this._then);

  final _InterstitialAdsConfig _self;
  final $Res Function(_InterstitialAdsConfig) _then;

/// Create a copy of InterstitialAdsConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unitId = null,Object? timeoutMillis = null,Object? cooldownDurationMins = null,Object? probability = null,}) {
  return _then(_InterstitialAdsConfig(
unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,timeoutMillis: null == timeoutMillis ? _self.timeoutMillis : timeoutMillis // ignore: cast_nullable_to_non_nullable
as int,cooldownDurationMins: null == cooldownDurationMins ? _self.cooldownDurationMins : cooldownDurationMins // ignore: cast_nullable_to_non_nullable
as int,probability: null == probability ? _self.probability : probability // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
