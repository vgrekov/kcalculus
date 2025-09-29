import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/repositories/user_repository.dart';
import 'package:kcalculus/domain/auth/exceptions/invalid_email_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/user_not_found_exception.dart';
import 'package:kcalculus/ui/auth/password_reset/view_models/password_reset_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:logging/logging.dart';

final _log = Logger('PasswordResetViewModel');

enum PasswordResetCommand {
  showUnknownErrorNotification,
  showPasswordResetEmailNotification,
  exit,
}

class PasswordResetViewModel
    extends AutoDisposeFamilyNotifier<PasswordResetUiState, String?> {
  UiCommander<PasswordResetCommand>? _commander;

  @override
  PasswordResetUiState build(String? arg) {
    _commander = UiCommander<PasswordResetCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return PasswordResetUiState(email: arg ?? '');
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void updateState({
    required String email,
    PasswordResetValidationError? validationError,
  }) {
    state = state.copyWith(
      email: email,
      validationError: validationError,
    );
  }

  Future<void> sendPasswordResetEmail() async {
    _log.finer('sendPasswordResetEmail() START');

    try {
      _log.finest(
          'sendPasswordResetEmail() Sending password reset email for: ${state.email}');

      await ref.read(userRepositoryProvider.notifier).sendPasswordResetEmail(
            state.email,
          );

      _log.info('Password reset email sent');
      _log.finest(
          'sendPasswordResetEmail() Sent password reset email for: ${state.email}');

      _commander!.send<String, void>(
        PasswordResetCommand.showPasswordResetEmailNotification,
        payload: state.email,
      );

      _commander!.send(PasswordResetCommand.exit);
    } on InvalidEmailException {
      _log.finer('sendPasswordResetEmail() Invalid email');

      state = state.copyWith(
        validationError: PasswordResetValidationError.invalidEmail,
      );
    } on UserNotFoundException {
      _log.finer('sendPasswordResetEmail() User not found');

      state = state.copyWith(
        validationError: PasswordResetValidationError.userNotFound,
      );
    } catch (error, stackTrace) {
      _log.severe('Failed to send password reset email', error, stackTrace);

      _commander!.send(PasswordResetCommand.showUnknownErrorNotification);
    }

    _log.finer('sendPasswordResetEmail() END');
  }
}

final passwordResetViewModel = NotifierProvider.family
    .autoDispose<PasswordResetViewModel, PasswordResetUiState, String?>(
  PasswordResetViewModel.new,
);
