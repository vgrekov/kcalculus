import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_account_ui_state.freezed.dart';

enum NewAccountValidationError {
  invalidEmail,
  emailAlreadyInUse,
  weakPassword,
}

@freezed
sealed class NewAccountUiState with _$NewAccountUiState {
  const factory NewAccountUiState({
    @Default('') String displayName,
    @Default('') String email,
    @Default('') String password,
    @Default('') String passwordConfirmation,
    NewAccountValidationError? validationError,
  }) = _NewAccountUiState;
}
