// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchConfig {

 String get ediblesIndexName; String get foodContainersIndexName; int get recentLookbackDurationSecs;
/// Create a copy of SearchConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchConfigCopyWith<SearchConfig> get copyWith => _$SearchConfigCopyWithImpl<SearchConfig>(this as SearchConfig, _$identity);

  /// Serializes this SearchConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchConfig&&(identical(other.ediblesIndexName, ediblesIndexName) || other.ediblesIndexName == ediblesIndexName)&&(identical(other.foodContainersIndexName, foodContainersIndexName) || other.foodContainersIndexName == foodContainersIndexName)&&(identical(other.recentLookbackDurationSecs, recentLookbackDurationSecs) || other.recentLookbackDurationSecs == recentLookbackDurationSecs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ediblesIndexName,foodContainersIndexName,recentLookbackDurationSecs);

@override
String toString() {
  return 'SearchConfig(ediblesIndexName: $ediblesIndexName, foodContainersIndexName: $foodContainersIndexName, recentLookbackDurationSecs: $recentLookbackDurationSecs)';
}


}

/// @nodoc
abstract mixin class $SearchConfigCopyWith<$Res>  {
  factory $SearchConfigCopyWith(SearchConfig value, $Res Function(SearchConfig) _then) = _$SearchConfigCopyWithImpl;
@useResult
$Res call({
 String ediblesIndexName, String foodContainersIndexName, int recentLookbackDurationSecs
});




}
/// @nodoc
class _$SearchConfigCopyWithImpl<$Res>
    implements $SearchConfigCopyWith<$Res> {
  _$SearchConfigCopyWithImpl(this._self, this._then);

  final SearchConfig _self;
  final $Res Function(SearchConfig) _then;

/// Create a copy of SearchConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ediblesIndexName = null,Object? foodContainersIndexName = null,Object? recentLookbackDurationSecs = null,}) {
  return _then(_self.copyWith(
ediblesIndexName: null == ediblesIndexName ? _self.ediblesIndexName : ediblesIndexName // ignore: cast_nullable_to_non_nullable
as String,foodContainersIndexName: null == foodContainersIndexName ? _self.foodContainersIndexName : foodContainersIndexName // ignore: cast_nullable_to_non_nullable
as String,recentLookbackDurationSecs: null == recentLookbackDurationSecs ? _self.recentLookbackDurationSecs : recentLookbackDurationSecs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchConfig].
extension SearchConfigPatterns on SearchConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchConfig value)  $default,){
final _that = this;
switch (_that) {
case _SearchConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchConfig value)?  $default,){
final _that = this;
switch (_that) {
case _SearchConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ediblesIndexName,  String foodContainersIndexName,  int recentLookbackDurationSecs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchConfig() when $default != null:
return $default(_that.ediblesIndexName,_that.foodContainersIndexName,_that.recentLookbackDurationSecs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ediblesIndexName,  String foodContainersIndexName,  int recentLookbackDurationSecs)  $default,) {final _that = this;
switch (_that) {
case _SearchConfig():
return $default(_that.ediblesIndexName,_that.foodContainersIndexName,_that.recentLookbackDurationSecs);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ediblesIndexName,  String foodContainersIndexName,  int recentLookbackDurationSecs)?  $default,) {final _that = this;
switch (_that) {
case _SearchConfig() when $default != null:
return $default(_that.ediblesIndexName,_that.foodContainersIndexName,_that.recentLookbackDurationSecs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchConfig implements SearchConfig {
  const _SearchConfig({required this.ediblesIndexName, required this.foodContainersIndexName, this.recentLookbackDurationSecs = kDefaultRecentLookbackDurationSecs});
  factory _SearchConfig.fromJson(Map<String, dynamic> json) => _$SearchConfigFromJson(json);

@override final  String ediblesIndexName;
@override final  String foodContainersIndexName;
@override@JsonKey() final  int recentLookbackDurationSecs;

/// Create a copy of SearchConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchConfigCopyWith<_SearchConfig> get copyWith => __$SearchConfigCopyWithImpl<_SearchConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchConfig&&(identical(other.ediblesIndexName, ediblesIndexName) || other.ediblesIndexName == ediblesIndexName)&&(identical(other.foodContainersIndexName, foodContainersIndexName) || other.foodContainersIndexName == foodContainersIndexName)&&(identical(other.recentLookbackDurationSecs, recentLookbackDurationSecs) || other.recentLookbackDurationSecs == recentLookbackDurationSecs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ediblesIndexName,foodContainersIndexName,recentLookbackDurationSecs);

@override
String toString() {
  return 'SearchConfig(ediblesIndexName: $ediblesIndexName, foodContainersIndexName: $foodContainersIndexName, recentLookbackDurationSecs: $recentLookbackDurationSecs)';
}


}

/// @nodoc
abstract mixin class _$SearchConfigCopyWith<$Res> implements $SearchConfigCopyWith<$Res> {
  factory _$SearchConfigCopyWith(_SearchConfig value, $Res Function(_SearchConfig) _then) = __$SearchConfigCopyWithImpl;
@override @useResult
$Res call({
 String ediblesIndexName, String foodContainersIndexName, int recentLookbackDurationSecs
});




}
/// @nodoc
class __$SearchConfigCopyWithImpl<$Res>
    implements _$SearchConfigCopyWith<$Res> {
  __$SearchConfigCopyWithImpl(this._self, this._then);

  final _SearchConfig _self;
  final $Res Function(_SearchConfig) _then;

/// Create a copy of SearchConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ediblesIndexName = null,Object? foodContainersIndexName = null,Object? recentLookbackDurationSecs = null,}) {
  return _then(_SearchConfig(
ediblesIndexName: null == ediblesIndexName ? _self.ediblesIndexName : ediblesIndexName // ignore: cast_nullable_to_non_nullable
as String,foodContainersIndexName: null == foodContainersIndexName ? _self.foodContainersIndexName : foodContainersIndexName // ignore: cast_nullable_to_non_nullable
as String,recentLookbackDurationSecs: null == recentLookbackDurationSecs ? _self.recentLookbackDurationSecs : recentLookbackDurationSecs // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
