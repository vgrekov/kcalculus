import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/auth/exceptions/email_already_in_use_exception.dart';
import 'package:kcalculus/_data/auth/exceptions/invalid_email_exception.dart';
import 'package:kcalculus/_data/auth/exceptions/weak_password_exception.dart';
import 'package:kcalculus/_data/auth/repositories/user_repository.dart';
import 'package:kcalculus/ui/auth/new_account/view_models/new_account_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:kcalculus/utils/logging_analytics.dart';
import 'package:logging/logging.dart';

final Logger _log = Logger('NewAccountViewModel');

enum NewAccountCommand {
  showUnknownErrorNotification,
  showEmailVerificationNotification,
  exit,
}

class NewAccountViewModel extends AutoDisposeNotifier<NewAccountUiState> {
  UiCommander<NewAccountCommand>? _commander;

  @override
  NewAccountUiState build() {
    _commander = UiCommander<NewAccountCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return NewAccountUiState();
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void updateState({
    required String displayName,
    required String email,
    required String password,
    required String passwordConfirmation,
    NewAccountValidationError? validationError,
  }) {
    state = state.copyWith(
      displayName: displayName,
      email: email,
      password: password,
      passwordConfirmation: passwordConfirmation,
      validationError: validationError,
    );
  }

  Future<void> createAccount() async {
    _log.finer('createAccount() START');

    try {
      _log.finest('createAccount() Creating account for: ${state.email}');

      await ref.read(userRepositoryProvider.notifier).createAccount(
            state.displayName,
            state.email,
            state.password,
          );

      _log.info('Account created');
      _log.finest('createAccount() Created account for: ${state.email}');
      _log.eventNewAccount();

      _commander!.send<String, void>(
        NewAccountCommand.showEmailVerificationNotification,
        payload: state.email,
      );

      _commander!.send<String?, void>(
        NewAccountCommand.exit,
        payload: state.email,
      );
    } on WeakPasswordException {
      _log.finer('createAccount() Password provided is too weak.');

      state = state.copyWith(
        validationError: NewAccountValidationError.weakPassword,
      );
    } on EmailAlreadyInUseException {
      _log.finer('createAccount() Account already exists for that email');

      state = state.copyWith(
        validationError: NewAccountValidationError.emailAlreadyInUse,
      );
    } on InvalidEmailException {
      _log.finer('createAccount() Invalid email');

      state = state.copyWith(
        validationError: NewAccountValidationError.invalidEmail,
      );
    } catch (error, stackTrace) {
      _log.severe('Failed to create account', error, stackTrace);

      _commander!.send(NewAccountCommand.showUnknownErrorNotification);
    }

    _log.finer('createAccount() END');
  }
}

final newAccountViewModel =
    NotifierProvider.autoDispose<NewAccountViewModel, NewAccountUiState>(
  NewAccountViewModel.new,
);
