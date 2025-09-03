import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_reset_ui_state.freezed.dart';

enum PasswordResetValidationError {
  invalidEmail,
  userNotFound,
}

@freezed
sealed class PasswordResetUiState with _$PasswordResetUiState {
  const factory PasswordResetUiState({
    @Default('') String email,
    PasswordResetValidationError? validationError,
  }) = _PasswordResetUiState;
}
