// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchUiState<Model> {

 String get query; FutureOr<List<Model>> get data;
/// Create a copy of SearchUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchUiStateCopyWith<Model, SearchUiState<Model>> get copyWith => _$SearchUiStateCopyWithImpl<Model, SearchUiState<Model>>(this as SearchUiState<Model>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchUiState<Model>&&(identical(other.query, query) || other.query == query)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,query,data);

@override
String toString() {
  return 'SearchUiState<$Model>(query: $query, data: $data)';
}


}

/// @nodoc
abstract mixin class $SearchUiStateCopyWith<Model,$Res>  {
  factory $SearchUiStateCopyWith(SearchUiState<Model> value, $Res Function(SearchUiState<Model>) _then) = _$SearchUiStateCopyWithImpl;
@useResult
$Res call({
 String query, FutureOr<List<Model>> data
});




}
/// @nodoc
class _$SearchUiStateCopyWithImpl<Model,$Res>
    implements $SearchUiStateCopyWith<Model, $Res> {
  _$SearchUiStateCopyWithImpl(this._self, this._then);

  final SearchUiState<Model> _self;
  final $Res Function(SearchUiState<Model>) _then;

/// Create a copy of SearchUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? query = null,Object? data = null,}) {
  return _then(_self.copyWith(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FutureOr<List<Model>>,
  ));
}

}


/// Adds pattern-matching-related methods to [SearchUiState].
extension SearchUiStatePatterns<Model> on SearchUiState<Model> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SearchUiState<Model> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SearchUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SearchUiState<Model> value)  $default,){
final _that = this;
switch (_that) {
case _SearchUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SearchUiState<Model> value)?  $default,){
final _that = this;
switch (_that) {
case _SearchUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String query,  FutureOr<List<Model>> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SearchUiState() when $default != null:
return $default(_that.query,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String query,  FutureOr<List<Model>> data)  $default,) {final _that = this;
switch (_that) {
case _SearchUiState():
return $default(_that.query,_that.data);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String query,  FutureOr<List<Model>> data)?  $default,) {final _that = this;
switch (_that) {
case _SearchUiState() when $default != null:
return $default(_that.query,_that.data);case _:
  return null;

}
}

}

/// @nodoc


class _SearchUiState<Model> implements SearchUiState<Model> {
  const _SearchUiState({required this.query, required this.data});
  

@override final  String query;
@override final  FutureOr<List<Model>> data;

/// Create a copy of SearchUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchUiStateCopyWith<Model, _SearchUiState<Model>> get copyWith => __$SearchUiStateCopyWithImpl<Model, _SearchUiState<Model>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchUiState<Model>&&(identical(other.query, query) || other.query == query)&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,query,data);

@override
String toString() {
  return 'SearchUiState<$Model>(query: $query, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SearchUiStateCopyWith<Model,$Res> implements $SearchUiStateCopyWith<Model, $Res> {
  factory _$SearchUiStateCopyWith(_SearchUiState<Model> value, $Res Function(_SearchUiState<Model>) _then) = __$SearchUiStateCopyWithImpl;
@override @useResult
$Res call({
 String query, FutureOr<List<Model>> data
});




}
/// @nodoc
class __$SearchUiStateCopyWithImpl<Model,$Res>
    implements _$SearchUiStateCopyWith<Model, $Res> {
  __$SearchUiStateCopyWithImpl(this._self, this._then);

  final _SearchUiState<Model> _self;
  final $Res Function(_SearchUiState<Model>) _then;

/// Create a copy of SearchUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? query = null,Object? data = null,}) {
  return _then(_SearchUiState<Model>(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as FutureOr<List<Model>>,
  ));
}


}

// dart format on
