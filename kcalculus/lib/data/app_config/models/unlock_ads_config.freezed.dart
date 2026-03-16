// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unlock_ads_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UnlockAdsConfig {

 String get unitId; int get timeoutMillis; int get rewardDurationMins;
/// Create a copy of UnlockAdsConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnlockAdsConfigCopyWith<UnlockAdsConfig> get copyWith => _$UnlockAdsConfigCopyWithImpl<UnlockAdsConfig>(this as UnlockAdsConfig, _$identity);

  /// Serializes this UnlockAdsConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnlockAdsConfig&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.timeoutMillis, timeoutMillis) || other.timeoutMillis == timeoutMillis)&&(identical(other.rewardDurationMins, rewardDurationMins) || other.rewardDurationMins == rewardDurationMins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitId,timeoutMillis,rewardDurationMins);

@override
String toString() {
  return 'UnlockAdsConfig(unitId: $unitId, timeoutMillis: $timeoutMillis, rewardDurationMins: $rewardDurationMins)';
}


}

/// @nodoc
abstract mixin class $UnlockAdsConfigCopyWith<$Res>  {
  factory $UnlockAdsConfigCopyWith(UnlockAdsConfig value, $Res Function(UnlockAdsConfig) _then) = _$UnlockAdsConfigCopyWithImpl;
@useResult
$Res call({
 String unitId, int timeoutMillis, int rewardDurationMins
});




}
/// @nodoc
class _$UnlockAdsConfigCopyWithImpl<$Res>
    implements $UnlockAdsConfigCopyWith<$Res> {
  _$UnlockAdsConfigCopyWithImpl(this._self, this._then);

  final UnlockAdsConfig _self;
  final $Res Function(UnlockAdsConfig) _then;

/// Create a copy of UnlockAdsConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? unitId = null,Object? timeoutMillis = null,Object? rewardDurationMins = null,}) {
  return _then(_self.copyWith(
unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,timeoutMillis: null == timeoutMillis ? _self.timeoutMillis : timeoutMillis // ignore: cast_nullable_to_non_nullable
as int,rewardDurationMins: null == rewardDurationMins ? _self.rewardDurationMins : rewardDurationMins // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UnlockAdsConfig].
extension UnlockAdsConfigPatterns on UnlockAdsConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnlockAdsConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnlockAdsConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnlockAdsConfig value)  $default,){
final _that = this;
switch (_that) {
case _UnlockAdsConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnlockAdsConfig value)?  $default,){
final _that = this;
switch (_that) {
case _UnlockAdsConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String unitId,  int timeoutMillis,  int rewardDurationMins)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnlockAdsConfig() when $default != null:
return $default(_that.unitId,_that.timeoutMillis,_that.rewardDurationMins);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String unitId,  int timeoutMillis,  int rewardDurationMins)  $default,) {final _that = this;
switch (_that) {
case _UnlockAdsConfig():
return $default(_that.unitId,_that.timeoutMillis,_that.rewardDurationMins);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String unitId,  int timeoutMillis,  int rewardDurationMins)?  $default,) {final _that = this;
switch (_that) {
case _UnlockAdsConfig() when $default != null:
return $default(_that.unitId,_that.timeoutMillis,_that.rewardDurationMins);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnlockAdsConfig implements UnlockAdsConfig {
  const _UnlockAdsConfig({required this.unitId, required this.timeoutMillis, required this.rewardDurationMins});
  factory _UnlockAdsConfig.fromJson(Map<String, dynamic> json) => _$UnlockAdsConfigFromJson(json);

@override final  String unitId;
@override final  int timeoutMillis;
@override final  int rewardDurationMins;

/// Create a copy of UnlockAdsConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnlockAdsConfigCopyWith<_UnlockAdsConfig> get copyWith => __$UnlockAdsConfigCopyWithImpl<_UnlockAdsConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnlockAdsConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnlockAdsConfig&&(identical(other.unitId, unitId) || other.unitId == unitId)&&(identical(other.timeoutMillis, timeoutMillis) || other.timeoutMillis == timeoutMillis)&&(identical(other.rewardDurationMins, rewardDurationMins) || other.rewardDurationMins == rewardDurationMins));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unitId,timeoutMillis,rewardDurationMins);

@override
String toString() {
  return 'UnlockAdsConfig(unitId: $unitId, timeoutMillis: $timeoutMillis, rewardDurationMins: $rewardDurationMins)';
}


}

/// @nodoc
abstract mixin class _$UnlockAdsConfigCopyWith<$Res> implements $UnlockAdsConfigCopyWith<$Res> {
  factory _$UnlockAdsConfigCopyWith(_UnlockAdsConfig value, $Res Function(_UnlockAdsConfig) _then) = __$UnlockAdsConfigCopyWithImpl;
@override @useResult
$Res call({
 String unitId, int timeoutMillis, int rewardDurationMins
});




}
/// @nodoc
class __$UnlockAdsConfigCopyWithImpl<$Res>
    implements _$UnlockAdsConfigCopyWith<$Res> {
  __$UnlockAdsConfigCopyWithImpl(this._self, this._then);

  final _UnlockAdsConfig _self;
  final $Res Function(_UnlockAdsConfig) _then;

/// Create a copy of UnlockAdsConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? unitId = null,Object? timeoutMillis = null,Object? rewardDurationMins = null,}) {
  return _then(_UnlockAdsConfig(
unitId: null == unitId ? _self.unitId : unitId // ignore: cast_nullable_to_non_nullable
as String,timeoutMillis: null == timeoutMillis ? _self.timeoutMillis : timeoutMillis // ignore: cast_nullable_to_non_nullable
as int,rewardDurationMins: null == rewardDurationMins ? _self.rewardDurationMins : rewardDurationMins // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
