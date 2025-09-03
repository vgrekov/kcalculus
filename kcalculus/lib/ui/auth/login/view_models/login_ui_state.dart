import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_ui_state.freezed.dart';

enum LoginValidationError {
  invalidEmail,
  invalidCredentials,
  userNotFound,
  userDisabled,
  unverifiedEmail,
}

@freezed
sealed class LoginUiState with _$LoginUiState {
  const factory LoginUiState({
    @Default('') String email,
    @Default('') String password,
    DateTime? emailVerificationCooldownEnd,
    LoginValidationError? validationError,
  }) = _LoginUiState;
}
