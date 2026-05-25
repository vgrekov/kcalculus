// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'password_reset_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PasswordResetUiState {

 String get email; PasswordResetValidationError? get validationError;
/// Create a copy of PasswordResetUiState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PasswordResetUiStateCopyWith<PasswordResetUiState> get copyWith => _$PasswordResetUiStateCopyWithImpl<PasswordResetUiState>(this as PasswordResetUiState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PasswordResetUiState&&(identical(other.email, email) || other.email == email)&&(identical(other.validationError, validationError) || other.validationError == validationError));
}


@override
int get hashCode => Object.hash(runtimeType,email,validationError);

@override
String toString() {
  return 'PasswordResetUiState(email: $email, validationError: $validationError)';
}


}

/// @nodoc
abstract mixin class $PasswordResetUiStateCopyWith<$Res>  {
  factory $PasswordResetUiStateCopyWith(PasswordResetUiState value, $Res Function(PasswordResetUiState) _then) = _$PasswordResetUiStateCopyWithImpl;
@useResult
$Res call({
 String email, PasswordResetValidationError? validationError
});




}
/// @nodoc
class _$PasswordResetUiStateCopyWithImpl<$Res>
    implements $PasswordResetUiStateCopyWith<$Res> {
  _$PasswordResetUiStateCopyWithImpl(this._self, this._then);

  final PasswordResetUiState _self;
  final $Res Function(PasswordResetUiState) _then;

/// Create a copy of PasswordResetUiState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? validationError = freezed,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,validationError: freezed == validationError ? _self.validationError : validationError // ignore: cast_nullable_to_non_nullable
as PasswordResetValidationError?,
  ));
}

}


/// Adds pattern-matching-related methods to [PasswordResetUiState].
extension PasswordResetUiStatePatterns on PasswordResetUiState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PasswordResetUiState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PasswordResetUiState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PasswordResetUiState value)  $default,){
final _that = this;
switch (_that) {
case _PasswordResetUiState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PasswordResetUiState value)?  $default,){
final _that = this;
switch (_that) {
case _PasswordResetUiState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  PasswordResetValidationError? validationError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PasswordResetUiState() when $default != null:
return $default(_that.email,_that.validationError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  PasswordResetValidationError? validationError)  $default,) {final _that = this;
switch (_that) {
case _PasswordResetUiState():
return $default(_that.email,_that.validationError);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  PasswordResetValidationError? validationError)?  $default,) {final _that = this;
switch (_that) {
case _PasswordResetUiState() when $default != null:
return $default(_that.email,_that.validationError);case _:
  return null;

}
}

}

/// @nodoc


class _PasswordResetUiState implements PasswordResetUiState {
  const _PasswordResetUiState({this.email = '', this.validationError});
  

@override@JsonKey() final  String email;
@override final  PasswordResetValidationError? validationError;

/// Create a copy of PasswordResetUiState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PasswordResetUiStateCopyWith<_PasswordResetUiState> get copyWith => __$PasswordResetUiStateCopyWithImpl<_PasswordResetUiState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PasswordResetUiState&&(identical(other.email, email) || other.email == email)&&(identical(other.validationError, validationError) || other.validationError == validationError));
}


@override
int get hashCode => Object.hash(runtimeType,email,validationError);

@override
String toString() {
  return 'PasswordResetUiState(email: $email, validationError: $validationError)';
}


}

/// @nodoc
abstract mixin class _$PasswordResetUiStateCopyWith<$Res> implements $PasswordResetUiStateCopyWith<$Res> {
  factory _$PasswordResetUiStateCopyWith(_PasswordResetUiState value, $Res Function(_PasswordResetUiState) _then) = __$PasswordResetUiStateCopyWithImpl;
@override @useResult
$Res call({
 String email, PasswordResetValidationError? validationError
});




}
/// @nodoc
class __$PasswordResetUiStateCopyWithImpl<$Res>
    implements _$PasswordResetUiStateCopyWith<$Res> {
  __$PasswordResetUiStateCopyWithImpl(this._self, this._then);

  final _PasswordResetUiState _self;
  final $Res Function(_PasswordResetUiState) _then;

/// Create a copy of PasswordResetUiState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? validationError = freezed,}) {
  return _then(_PasswordResetUiState(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,validationError: freezed == validationError ? _self.validationError : validationError // ignore: cast_nullable_to_non_nullable
as PasswordResetValidationError?,
  ));
}


}

// dart format on
