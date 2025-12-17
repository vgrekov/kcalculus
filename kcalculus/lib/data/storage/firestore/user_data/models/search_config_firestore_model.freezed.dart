// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_config_firestore_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchConfigFirestoreModel {

 String get appId; String get apiKey;
/// Create a copy of SearchConfigFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchConfigFirestoreModelCopyWith<SearchConfigFirestoreModel> get copyWith => _$SearchConfigFirestoreModelCopyWithImpl<SearchConfigFirestoreModel>(this as SearchConfigFirestoreModel, _$identity);

  /// Serializes this SearchConfigFirestoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchConfigFirestoreModel&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appId,apiKey);

@override
String toString() {
  return 'SearchConfigFirestoreModel(appId: $appId, apiKey: $apiKey)';
}


}

/// @nodoc
abstract mixin class $SearchConfigFirestoreModelCopyWith<$Res>  {
  factory $SearchConfigFirestoreModelCopyWith(SearchConfigFirestoreModel value, $Res Function(SearchConfigFirestoreModel) _then) = _$SearchConfigFirestoreModelCopyWithImpl;
@useResult
$Res call({
 String appId, String apiKey
});




}
/// @nodoc
class _$SearchConfigFirestoreModelCopyWithImpl<$Res>
    implements $SearchConfigFirestoreModelCopyWith<$Res> {
  _$SearchConfigFirestoreModelCopyWithImpl(this._self, this._then);

  final SearchConfigFirestoreModel _self;
  final $Res Function(SearchConfigFirestoreModel) _then;

/// Create a copy of SearchConfigFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? appId = null,Object? apiKey = null,}) {
  return _then(_self.copyWith(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchConfigFirestoreModel].
extension SearchConfigFirestoreModelPatterns on SearchConfigFirestoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchConfigFirestoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchConfigFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchConfigFirestoreModel value)  $default,){
final _that = this;
switch (_that) {
case _SearchConfigFirestoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchConfigFirestoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _SearchConfigFirestoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String appId,  String apiKey)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchConfigFirestoreModel() when $default != null:
return $default(_that.appId,_that.apiKey);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String appId,  String apiKey)  $default,) {final _that = this;
switch (_that) {
case _SearchConfigFirestoreModel():
return $default(_that.appId,_that.apiKey);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String appId,  String apiKey)?  $default,) {final _that = this;
switch (_that) {
case _SearchConfigFirestoreModel() when $default != null:
return $default(_that.appId,_that.apiKey);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SearchConfigFirestoreModel implements SearchConfigFirestoreModel {
  const _SearchConfigFirestoreModel({required this.appId, required this.apiKey});
  factory _SearchConfigFirestoreModel.fromJson(Map<String, dynamic> json) => _$SearchConfigFirestoreModelFromJson(json);

@override final  String appId;
@override final  String apiKey;

/// Create a copy of SearchConfigFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchConfigFirestoreModelCopyWith<_SearchConfigFirestoreModel> get copyWith => __$SearchConfigFirestoreModelCopyWithImpl<_SearchConfigFirestoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SearchConfigFirestoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchConfigFirestoreModel&&(identical(other.appId, appId) || other.appId == appId)&&(identical(other.apiKey, apiKey) || other.apiKey == apiKey));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,appId,apiKey);

@override
String toString() {
  return 'SearchConfigFirestoreModel(appId: $appId, apiKey: $apiKey)';
}


}

/// @nodoc
abstract mixin class _$SearchConfigFirestoreModelCopyWith<$Res> implements $SearchConfigFirestoreModelCopyWith<$Res> {
  factory _$SearchConfigFirestoreModelCopyWith(_SearchConfigFirestoreModel value, $Res Function(_SearchConfigFirestoreModel) _then) = __$SearchConfigFirestoreModelCopyWithImpl;
@override @useResult
$Res call({
 String appId, String apiKey
});




}
/// @nodoc
class __$SearchConfigFirestoreModelCopyWithImpl<$Res>
    implements _$SearchConfigFirestoreModelCopyWith<$Res> {
  __$SearchConfigFirestoreModelCopyWithImpl(this._self, this._then);

  final _SearchConfigFirestoreModel _self;
  final $Res Function(_SearchConfigFirestoreModel) _then;

/// Create a copy of SearchConfigFirestoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? appId = null,Object? apiKey = null,}) {
  return _then(_SearchConfigFirestoreModel(
appId: null == appId ? _self.appId : appId // ignore: cast_nullable_to_non_nullable
as String,apiKey: null == apiKey ? _self.apiKey : apiKey // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
