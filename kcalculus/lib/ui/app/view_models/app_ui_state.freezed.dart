// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppUiState {

 AppTheme get theme; AppStage get stage;
/// Create a copy of AppUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUiStateCopyWith<AppUiState> get copyWith => _$AppUiStateCopyWithImpl<AppUiState>(this as AppUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppUiState&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.stage, stage) || other.stage == stage));
}


@override
int get hashCode => Object.hash(runtimeType,theme,stage);

@override
String toString() {
  return 'AppUiState(theme: $theme, stage: $stage)';
}


}

/// @nodoc
abstract mixin class $AppUiStateCopyWith<$Res>  {
  factory $AppUiStateCopyWith(AppUiState value, $Res Function(AppUiState) _then) = _$AppUiStateCopyWithImpl;
@useResult
$Res call({
 AppTheme theme, AppStage stage
});




}
/// @nodoc
class _$AppUiStateCopyWithImpl<$Res>
    implements $AppUiStateCopyWith<$Res> {
  _$AppUiStateCopyWithImpl(this._self, this._then);

  final AppUiState _self;
  final $Res Function(AppUiState) _then;

/// Create a copy of AppUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? theme = null,Object? stage = null,}) {
  return _then(_self.copyWith(
theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppTheme,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as AppStage,
  ));
}

}


/// Adds pattern-matching-related methods to [AppUiState].
extension AppUiStatePatterns on AppUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUiState value)  $default,){
final _that = this;
switch (_that) {
case _AppUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUiState value)?  $default,){
final _that = this;
switch (_that) {
case _AppUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( AppTheme theme,  AppStage stage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUiState() when $default != null:
return $default(_that.theme,_that.stage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( AppTheme theme,  AppStage stage)  $default,) {final _that = this;
switch (_that) {
case _AppUiState():
return $default(_that.theme,_that.stage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( AppTheme theme,  AppStage stage)?  $default,) {final _that = this;
switch (_that) {
case _AppUiState() when $default != null:
return $default(_that.theme,_that.stage);case _:
  return null;

}
}

}

/// @nodoc


class _AppUiState implements AppUiState {
  const _AppUiState({required this.theme, required this.stage});
  

@override final  AppTheme theme;
@override final  AppStage stage;

/// Create a copy of AppUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUiStateCopyWith<_AppUiState> get copyWith => __$AppUiStateCopyWithImpl<_AppUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppUiState&&(identical(other.theme, theme) || other.theme == theme)&&(identical(other.stage, stage) || other.stage == stage));
}


@override
int get hashCode => Object.hash(runtimeType,theme,stage);

@override
String toString() {
  return 'AppUiState(theme: $theme, stage: $stage)';
}


}

/// @nodoc
abstract mixin class _$AppUiStateCopyWith<$Res> implements $AppUiStateCopyWith<$Res> {
  factory _$AppUiStateCopyWith(_AppUiState value, $Res Function(_AppUiState) _then) = __$AppUiStateCopyWithImpl;
@override @useResult
$Res call({
 AppTheme theme, AppStage stage
});




}
/// @nodoc
class __$AppUiStateCopyWithImpl<$Res>
    implements _$AppUiStateCopyWith<$Res> {
  __$AppUiStateCopyWithImpl(this._self, this._then);

  final _AppUiState _self;
  final $Res Function(_AppUiState) _then;

/// Create a copy of AppUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? theme = null,Object? stage = null,}) {
  return _then(_AppUiState(
theme: null == theme ? _self.theme : theme // ignore: cast_nullable_to_non_nullable
as AppTheme,stage: null == stage ? _self.stage : stage // ignore: cast_nullable_to_non_nullable
as AppStage,
  ));
}


}

// dart format on
