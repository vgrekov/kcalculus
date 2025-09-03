// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_account_ui_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NewAccountUiState {
  String get displayName;
  String get email;
  String get password;
  String get passwordConfirmation;
  NewAccountValidationError? get validationError;

  /// Create a copy of NewAccountUiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewAccountUiStateCopyWith<NewAccountUiState> get copyWith =>
      _$NewAccountUiStateCopyWithImpl<NewAccountUiState>(
          this as NewAccountUiState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewAccountUiState &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayName, email, password,
      passwordConfirmation, validationError);

  @override
  String toString() {
    return 'NewAccountUiState(displayName: $displayName, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, validationError: $validationError)';
  }
}

/// @nodoc
abstract mixin class $NewAccountUiStateCopyWith<$Res> {
  factory $NewAccountUiStateCopyWith(
          NewAccountUiState value, $Res Function(NewAccountUiState) _then) =
      _$NewAccountUiStateCopyWithImpl;
  @useResult
  $Res call(
      {String displayName,
      String email,
      String password,
      String passwordConfirmation,
      NewAccountValidationError? validationError});
}

/// @nodoc
class _$NewAccountUiStateCopyWithImpl<$Res>
    implements $NewAccountUiStateCopyWith<$Res> {
  _$NewAccountUiStateCopyWithImpl(this._self, this._then);

  final NewAccountUiState _self;
  final $Res Function(NewAccountUiState) _then;

  /// Create a copy of NewAccountUiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? validationError = freezed,
  }) {
    return _then(_self.copyWith(
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _self.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      validationError: freezed == validationError
          ? _self.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as NewAccountValidationError?,
    ));
  }
}

/// @nodoc

class _NewAccountUiState implements NewAccountUiState {
  const _NewAccountUiState(
      {this.displayName = '',
      this.email = '',
      this.password = '',
      this.passwordConfirmation = '',
      this.validationError});

  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final String passwordConfirmation;
  @override
  final NewAccountValidationError? validationError;

  /// Create a copy of NewAccountUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewAccountUiStateCopyWith<_NewAccountUiState> get copyWith =>
      __$NewAccountUiStateCopyWithImpl<_NewAccountUiState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewAccountUiState &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation) &&
            (identical(other.validationError, validationError) ||
                other.validationError == validationError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayName, email, password,
      passwordConfirmation, validationError);

  @override
  String toString() {
    return 'NewAccountUiState(displayName: $displayName, email: $email, password: $password, passwordConfirmation: $passwordConfirmation, validationError: $validationError)';
  }
}

/// @nodoc
abstract mixin class _$NewAccountUiStateCopyWith<$Res>
    implements $NewAccountUiStateCopyWith<$Res> {
  factory _$NewAccountUiStateCopyWith(
          _NewAccountUiState value, $Res Function(_NewAccountUiState) _then) =
      __$NewAccountUiStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String displayName,
      String email,
      String password,
      String passwordConfirmation,
      NewAccountValidationError? validationError});
}

/// @nodoc
class __$NewAccountUiStateCopyWithImpl<$Res>
    implements _$NewAccountUiStateCopyWith<$Res> {
  __$NewAccountUiStateCopyWithImpl(this._self, this._then);

  final _NewAccountUiState _self;
  final $Res Function(_NewAccountUiState) _then;

  /// Create a copy of NewAccountUiState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? displayName = null,
    Object? email = null,
    Object? password = null,
    Object? passwordConfirmation = null,
    Object? validationError = freezed,
  }) {
    return _then(_NewAccountUiState(
      displayName: null == displayName
          ? _self.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      passwordConfirmation: null == passwordConfirmation
          ? _self.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String,
      validationError: freezed == validationError
          ? _self.validationError
          : validationError // ignore: cast_nullable_to_non_nullable
              as NewAccountValidationError?,
    ));
  }
}

// dart format on
