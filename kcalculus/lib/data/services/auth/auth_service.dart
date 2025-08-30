import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/exceptions/email_already_in_use_exception.dart';
import 'package:kcalculus/data/exceptions/invalid_email_exception.dart';
import 'package:kcalculus/data/exceptions/weak_password_exception.dart';
import 'package:logging/logging.dart';

final _log = Logger('AuthService');

class AuthService extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() {
    final completer = Completer<User?>();

    final subscription = _subscribeToValue(completer);
    ref.onDispose(() {
      subscription.cancel();
    });

    return completer.future;
  }

  Future<void> createAccount(
    String displayName,
    String email,
    String password,
  ) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await credential.user?.updateDisplayName(displayName);

      await credential.user?.sendEmailVerification();

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
    }
  }

  StreamSubscription<User?> _subscribeToValue(
    Completer<User?> completer,
  ) {
    return FirebaseAuth.instance.userChanges().listen(
      (user) {
        if (completer.isCompleted) {
          _updateState(user);
        } else {
          _log.finest('Firebase user: $user');

          completer.complete(user);
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
