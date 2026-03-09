import 'dart:async';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/app_config/services/app_config_service.dart';
import 'package:kcalculus/domain/_common/exceptions/too_many_requests_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/email_already_in_use_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/invalid_credentials_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/invalid_email_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/unverified_email_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/user_disabled_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/user_not_found_exception.dart';
import 'package:kcalculus/domain/auth/exceptions/weak_password_exception.dart';
import 'package:kcalculus/utils/datetime.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _log = Logger('AuthService');

class AuthService extends AsyncNotifier<User?> {
  static const _kVerificationSentAtPrefix = 'VerificationSentAt_';

  static const _kAnonymousModeSelectedKey = 'AnonymousModeSelected';

  StreamSubscription<User?>? _userSubscription;

  @override
  FutureOr<User?> build() {
    final completer = Completer<User?>();

    _userSubscription = _subscribeToUser(completer);
    ref.onDispose(() {
      _stopUserSubscription();
    });

    return completer.future;
  }

  Future<void> createAccount(
    String displayName,
    String email,
    String password,
  ) async {
    try {
      _stopUserSubscription();

      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

      if (credential.user != null) {
        await credential.user!.updateDisplayName(displayName);

        await _sendEmailVerification(credential.user!);
      }

      await FirebaseAuth.instance.signOut();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw WeakPasswordException();
        case 'email-already-in-use':
          throw EmailAlreadyInUseException();
        case 'invalid-email':
          throw InvalidEmailException();
        default:
          rethrow;
      }
    } finally {
      _restartUserSubscription();
    }
  }

  Future<User> login(
    String email,
    String password,
  ) async {
    try {
      _stopUserSubscription();

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!credential.user!.emailVerified) {
        await FirebaseAuth.instance.signOut();

        final cooldownEnd = await _getEmailVerificationCooldownEnd(email);
        throw UnverifiedEmailException(cooldownEnd);
      }

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw InvalidEmailException();
        case 'user-not-found':
          throw UserNotFoundException();
        case 'user-disabled':
          throw UserDisabledException();
        case 'wrong-password':
        case 'invalid-credential':
        case 'INVALID_LOGIN_CREDENTIALS':
          throw InvalidCredentialsException();
        case 'too-many-requests':
          throw TooManyRequestsException();
        default:
          rethrow;
      }
    } finally {
      _restartUserSubscription();
    }
  }

  Future<bool> sendEmailVerification(
    String email,
    String password,
  ) async {
    try {
      _stopUserSubscription();

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!credential.user!.emailVerified) {
        final cooldownEnd = await _getEmailVerificationCooldownEnd(email);

        if (!(cooldownEnd?.isAfter(DateTime.now()) ?? false)) {
          await _sendEmailVerification(credential.user!);
        } else {
          return false;
        }
      }

      await FirebaseAuth.instance.signOut();

      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw InvalidEmailException();
        case 'user-not-found':
          throw UserNotFoundException();
        case 'user-disabled':
          throw UserDisabledException();
        case 'wrong-password':
        case 'invalid-credential':
        case 'INVALID_LOGIN_CREDENTIALS':
          throw InvalidCredentialsException();
        case 'too-many-requests':
          throw TooManyRequestsException();
        default:
          rethrow;
      }
    } finally {
      _restartUserSubscription();
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      final functions = FirebaseFunctions.instance;

      final callable = functions.httpsCallable('sendPasswordResetEmail');

      await callable.call({
        'email': email,
      });
    } on FirebaseFunctionsException catch (e) {
      final causeCode = e.details is Map
          ? e.details['causeCode'] as String?
          : null;

      switch (causeCode) {
        case 'auth/invalid-email':
          throw InvalidEmailException();
        case 'auth/user-not-found':
          throw UserNotFoundException();
        default:
          rethrow;
      }
    }
  }

  Future<void> selectAnonymousMode() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setBool(_kAnonymousModeSelectedKey, true);

    state = AsyncValue.data(null);
  }

  Future<bool> isAnonymousModeSelected() async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getBool(_kAnonymousModeSelectedKey) ?? false;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();

    await _unselectAnonymousMode();
  }

  Future<void> deleteAccount() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.delete();

      await _unselectAnonymousMode();
    }
  }

  Future<void> _unselectAnonymousMode() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_kAnonymousModeSelectedKey);
  }

  Future<void> _sendEmailVerification(User user) async {
    if (user.email != null) {
      final functions = FirebaseFunctions.instance;

      final callable = functions.httpsCallable('sendEmailVerification');

      await callable.call({
        'email': user.email,
      });

      await _startEmailVerificationCooldown(user.email!);
    }
  }

  Future<void> _startEmailVerificationCooldown(String email) async {
    final now = DateTime.now();

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(
      '$_kVerificationSentAtPrefix$email',
      formatISO8601(now),
    );
  }

  Future<DateTime?> _getEmailVerificationCooldownEnd(String email) async {
    final appConfig = await ref.read(appConfigServiceProvider.future);

    final prefs = await SharedPreferences.getInstance();

    final sentAtStr = prefs.getString('$_kVerificationSentAtPrefix$email');

    if (sentAtStr != null) {
      final sentAt = parseISO8601(sentAtStr);

      return sentAt.add(
        Duration(
          seconds: appConfig?.emailVerificationCooldownDurationSecs ?? 60,
        ),
      );
    }

    return null;
  }

  void _stopUserSubscription() {
    _userSubscription?.cancel();
  }

  void _restartUserSubscription() {
    _userSubscription = _subscribeToUser();
  }

  StreamSubscription<User?> _subscribeToUser([
    Completer<User?>? completer,
  ]) {
    return FirebaseAuth.instance.userChanges().listen(
      (user) {
        if (completer?.isCompleted ?? true) {
          _updateState(user);
        } else {
          _log.finest('Firebase user: $user');

          completer!.complete(user);
        }
      },
      onError: (error, stackTrace) {
        _log.severe(
          'Failed to load a user from Firebase',
          error,
          stackTrace,
        );

        _updateState(null);
      },
    );
  }

  void _updateState(User? value) {
    if (state.valueOrNull != value) {
      state = AsyncData(value);

      _log.finest('Firebase user: $value');
    }
  }
}

final authServiceProvider = AsyncNotifierProvider<AuthService, User?>(
  AuthService.new,
);
