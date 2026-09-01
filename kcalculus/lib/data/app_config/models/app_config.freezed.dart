// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppConfig {

 AuthConfig get auth; SearchConfig get search; OpenFoodFactsConfig get openFoodFacts; FirestoreConfig get firestore; RevenueCatConfig get revenueCat;
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppConfigCopyWith<AppConfig> get copyWith => _$AppConfigCopyWithImpl<AppConfig>(this as AppConfig, _$identity);

  /// Serializes this AppConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppConfig&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.search, search) || other.search == search)&&(identical(other.openFoodFacts, openFoodFacts) || other.openFoodFacts == openFoodFacts)&&(identical(other.firestore, firestore) || other.firestore == firestore)&&(identical(other.revenueCat, revenueCat) || other.revenueCat == revenueCat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auth,search,openFoodFacts,firestore,revenueCat);

@override
String toString() {
  return 'AppConfig(auth: $auth, search: $search, openFoodFacts: $openFoodFacts, firestore: $firestore, revenueCat: $revenueCat)';
}


}

/// @nodoc
abstract mixin class $AppConfigCopyWith<$Res>  {
  factory $AppConfigCopyWith(AppConfig value, $Res Function(AppConfig) _then) = _$AppConfigCopyWithImpl;
@useResult
$Res call({
 AuthConfig auth, SearchConfig search, OpenFoodFactsConfig openFoodFacts, FirestoreConfig firestore, RevenueCatConfig revenueCat
});


$AuthConfigCopyWith<$Res> get auth;$SearchConfigCopyWith<$Res> get search;$OpenFoodFactsConfigCopyWith<$Res> get openFoodFacts;$FirestoreConfigCopyWith<$Res> get firestore;$RevenueCatConfigCopyWith<$Res> get revenueCat;

}
/// @nodoc
class _$AppConfigCopyWithImpl<$Res>
    implements $AppConfigCopyWith<$Res> {
  _$AppConfigCopyWithImpl(this._self, this._then);

  final AppConfig _self;
  final $Res Function(AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? auth = null,Object? search = null,Object? openFoodFacts = null,Object? firestore = null,Object? revenueCat = null,}) {
  return _then(_self.copyWith(
auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as AuthConfig,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as SearchConfig,openFoodFacts: null == openFoodFacts ? _self.openFoodFacts : openFoodFacts // ignore: cast_nullable_to_non_nullable
as OpenFoodFactsConfig,firestore: null == firestore ? _self.firestore : firestore // ignore: cast_nullable_to_non_nullable
as FirestoreConfig,revenueCat: null == revenueCat ? _self.revenueCat : revenueCat // ignore: cast_nullable_to_non_nullable
as RevenueCatConfig,
  ));
}
/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthConfigCopyWith<$Res> get auth {
  
  return $AuthConfigCopyWith<$Res>(_self.auth, (value) {
    return _then(_self.copyWith(auth: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchConfigCopyWith<$Res> get search {
  
  return $SearchConfigCopyWith<$Res>(_self.search, (value) {
    return _then(_self.copyWith(search: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpenFoodFactsConfigCopyWith<$Res> get openFoodFacts {
  
  return $OpenFoodFactsConfigCopyWith<$Res>(_self.openFoodFacts, (value) {
    return _then(_self.copyWith(openFoodFacts: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirestoreConfigCopyWith<$Res> get firestore {
  
  return $FirestoreConfigCopyWith<$Res>(_self.firestore, (value) {
    return _then(_self.copyWith(firestore: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevenueCatConfigCopyWith<$Res> get revenueCat {
  
  return $RevenueCatConfigCopyWith<$Res>(_self.revenueCat, (value) {
    return _then(_self.copyWith(revenueCat: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppConfig].
extension AppConfigPatterns on AppConfig {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppConfig value)  $default,){
final _that = this;
switch (_that) {
case _AppConfig():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppConfig value)?  $default,){
final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AuthConfig auth,  SearchConfig search,  OpenFoodFactsConfig openFoodFacts,  FirestoreConfig firestore,  RevenueCatConfig revenueCat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.auth,_that.search,_that.openFoodFacts,_that.firestore,_that.revenueCat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AuthConfig auth,  SearchConfig search,  OpenFoodFactsConfig openFoodFacts,  FirestoreConfig firestore,  RevenueCatConfig revenueCat)  $default,) {final _that = this;
switch (_that) {
case _AppConfig():
return $default(_that.auth,_that.search,_that.openFoodFacts,_that.firestore,_that.revenueCat);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AuthConfig auth,  SearchConfig search,  OpenFoodFactsConfig openFoodFacts,  FirestoreConfig firestore,  RevenueCatConfig revenueCat)?  $default,) {final _that = this;
switch (_that) {
case _AppConfig() when $default != null:
return $default(_that.auth,_that.search,_that.openFoodFacts,_that.firestore,_that.revenueCat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppConfig implements AppConfig {
  const _AppConfig({required this.auth, required this.search, required this.openFoodFacts, required this.firestore, required this.revenueCat});
  factory _AppConfig.fromJson(Map<String, dynamic> json) => _$AppConfigFromJson(json);

@override final  AuthConfig auth;
@override final  SearchConfig search;
@override final  OpenFoodFactsConfig openFoodFacts;
@override final  FirestoreConfig firestore;
@override final  RevenueCatConfig revenueCat;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppConfigCopyWith<_AppConfig> get copyWith => __$AppConfigCopyWithImpl<_AppConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppConfig&&(identical(other.auth, auth) || other.auth == auth)&&(identical(other.search, search) || other.search == search)&&(identical(other.openFoodFacts, openFoodFacts) || other.openFoodFacts == openFoodFacts)&&(identical(other.firestore, firestore) || other.firestore == firestore)&&(identical(other.revenueCat, revenueCat) || other.revenueCat == revenueCat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,auth,search,openFoodFacts,firestore,revenueCat);

@override
String toString() {
  return 'AppConfig(auth: $auth, search: $search, openFoodFacts: $openFoodFacts, firestore: $firestore, revenueCat: $revenueCat)';
}


}

/// @nodoc
abstract mixin class _$AppConfigCopyWith<$Res> implements $AppConfigCopyWith<$Res> {
  factory _$AppConfigCopyWith(_AppConfig value, $Res Function(_AppConfig) _then) = __$AppConfigCopyWithImpl;
@override @useResult
$Res call({
 AuthConfig auth, SearchConfig search, OpenFoodFactsConfig openFoodFacts, FirestoreConfig firestore, RevenueCatConfig revenueCat
});


@override $AuthConfigCopyWith<$Res> get auth;@override $SearchConfigCopyWith<$Res> get search;@override $OpenFoodFactsConfigCopyWith<$Res> get openFoodFacts;@override $FirestoreConfigCopyWith<$Res> get firestore;@override $RevenueCatConfigCopyWith<$Res> get revenueCat;

}
/// @nodoc
class __$AppConfigCopyWithImpl<$Res>
    implements _$AppConfigCopyWith<$Res> {
  __$AppConfigCopyWithImpl(this._self, this._then);

  final _AppConfig _self;
  final $Res Function(_AppConfig) _then;

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? auth = null,Object? search = null,Object? openFoodFacts = null,Object? firestore = null,Object? revenueCat = null,}) {
  return _then(_AppConfig(
auth: null == auth ? _self.auth : auth // ignore: cast_nullable_to_non_nullable
as AuthConfig,search: null == search ? _self.search : search // ignore: cast_nullable_to_non_nullable
as SearchConfig,openFoodFacts: null == openFoodFacts ? _self.openFoodFacts : openFoodFacts // ignore: cast_nullable_to_non_nullable
as OpenFoodFactsConfig,firestore: null == firestore ? _self.firestore : firestore // ignore: cast_nullable_to_non_nullable
as FirestoreConfig,revenueCat: null == revenueCat ? _self.revenueCat : revenueCat // ignore: cast_nullable_to_non_nullable
as RevenueCatConfig,
  ));
}

/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AuthConfigCopyWith<$Res> get auth {
  
  return $AuthConfigCopyWith<$Res>(_self.auth, (value) {
    return _then(_self.copyWith(auth: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SearchConfigCopyWith<$Res> get search {
  
  return $SearchConfigCopyWith<$Res>(_self.search, (value) {
    return _then(_self.copyWith(search: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OpenFoodFactsConfigCopyWith<$Res> get openFoodFacts {
  
  return $OpenFoodFactsConfigCopyWith<$Res>(_self.openFoodFacts, (value) {
    return _then(_self.copyWith(openFoodFacts: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FirestoreConfigCopyWith<$Res> get firestore {
  
  return $FirestoreConfigCopyWith<$Res>(_self.firestore, (value) {
    return _then(_self.copyWith(firestore: value));
  });
}/// Create a copy of AppConfig
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RevenueCatConfigCopyWith<$Res> get revenueCat {
  
  return $RevenueCatConfigCopyWith<$Res>(_self.revenueCat, (value) {
    return _then(_self.copyWith(revenueCat: value));
  });
}
}

// dart format on
