import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/repositories/user_repository.dart';
import 'package:kcalculus/domain/_common/exceptions/too_many_requests_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/invalid_credentials_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/invalid_email_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/unverified_email_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/user_disabled_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/user_not_found_exception.dart';
import 'package:kcalculus/ui/auth/login/view_models/login_ui_state.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/view_models/ui_commander.dart';
import 'package:logging/logging.dart';

final _log = Logger('LoginViewModel');

enum LoginCommand {
  showUnknownErrorNotification,
  showUnverifiedEmailNotification,
  showTooManyRequestsNotification,
  exit,
}

class LoginViewModel extends AutoDisposeNotifier<LoginUiState> {
  UiCommander<LoginCommand>? _commander;

  @override
  LoginUiState build() {
    _commander = UiCommander<LoginCommand>(_commander);

    ref.onDispose(() {
      _commander?.dispose();
    });

    return LoginUiState();
  }

  StreamProvider<UiCommand> get commandProvider => _commander!.provider;

  void updateState({
    required String email,
    required String password,
    LoginValidationError? validationError,
  }) {
    state = state.copyWith(
      email: email,
      password: password,
      validationError: validationError,
    );
  }

  Future<void> login() async {
    _log.finer('login() START');

    try {
      _log.finest('login() Logging in: ${state.email}');

      await ref.read(userRepositoryProvider.notifier).login(
            state.email,
            state.password,
          );

      _log.info('Login');
      _log.finest('login() Logged in: ${state.email}');

      _commander!.send(LoginCommand.exit);
    } on InvalidEmailException {
      _log.finer('login() Invalid email');

      state = state.copyWith(
        validationError: LoginValidationError.invalidEmail,
      );
    } on UserNotFoundException {
      _log.finer('login() User not found');

      state = state.copyWith(
        validationError: LoginValidationError.userNotFound,
      );
    } on UserDisabledException {
      _log.finer('login() User disabled');

      state = state.copyWith(
        validationError: LoginValidationError.userDisabled,
      );
    } on InvalidCredentialsException {
      _log.finer('login() Invalid credentials');

      state = state.copyWith(
        validationError: LoginValidationError.invalidCredentials,
      );
    } on UnverifiedEmailException catch (e) {
      _log.finer('login() Unverified email');

      state = state.copyWith(
        validationError: LoginValidationError.unverifiedEmail,
        emailVerificationCooldownEnd: e.cooldownEnd,
      );

      _commander!.send(LoginCommand.showUnverifiedEmailNotification);
    } on TooManyRequestsException {
      _log.finer('login() Too many requests');

      _commander!.send(LoginCommand.showTooManyRequestsNotification);
    } catch (error, stackTrace) {
      _log.severe('Failed to login', error, stackTrace);

      _commander!.send(LoginCommand.showUnknownErrorNotification);
    }

    _log.finer('login() END');
  }

  Future<void> resendVerificationEmail() async {
    _log.finer('resendVerificationEmail() START');

    try {
      _log.finest(
        'resendVerificationEmail() Resending verification instructions for: ${state.email}',
      );

      final sent =
          await ref.read(userRepositoryProvider.notifier).sendEmailVerification(
                state.email,
                state.password,
              );

      if (sent) {
        _log.info('Verification email resent');
        _log.finest(
          'resendVerificationEmail() Resent verification instructions for: ${state.email}',
        );
      }
    } on InvalidEmailException {
      _log.finer('resendVerificationEmail() Invalid email');

      state = state.copyWith(
        validationError: LoginValidationError.invalidEmail,
      );
    } on UserNotFoundException {
      _log.finer('resendVerificationEmail() User not found');

      state = state.copyWith(
        validationError: LoginValidationError.userNotFound,
      );
    } on UserDisabledException {
      _log.finer('resendVerificationEmail() User disabled');

      state = state.copyWith(
        validationError: LoginValidationError.userDisabled,
      );
    } on InvalidCredentialsException {
      _log.finer('resendVerificationEmail() Invalid credentials');

      state = state.copyWith(
        validationError: LoginValidationError.invalidCredentials,
      );
    } on TooManyRequestsException {
      _log.finer('resendVerificationEmail() Too many requests');

      _commander!.send(LoginCommand.showTooManyRequestsNotification);
    } catch (error, stackTrace) {
      _log.severe('Failed to resend verification email', error, stackTrace);

      _commander!.send(LoginCommand.showUnknownErrorNotification);
    }

    _log.finer('resendVerificationEmail() END');
  }

  Future<void> selectAnonymousMode() async {
    await ref.read(userRepositoryProvider.notifier).selectAnonymousMode();
  }
}

final loginViewModel =
    NotifierProvider.autoDispose<LoginViewModel, LoginUiState>(
  LoginViewModel.new,
);
