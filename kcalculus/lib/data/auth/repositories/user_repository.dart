import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/domain/models/user.dart';

class UserRepository extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() async {
    final firebaseUser = await ref.watch(authServiceProvider.future);
    return firebaseUser == null
        ? null
        : User(
            id: firebaseUser.uid,
            displayName: firebaseUser.displayName,
            email: firebaseUser.email!,
          );
  }

  Future<void> createAccount(
    String displayName,
    String email,
    String password,
  ) {
    return ref.read(authServiceProvider.notifier).createAccount(
          displayName,
          email,
          password,
        );
  }

  Future<User> login(
    String email,
    String password,
  ) async {
    final firebaseUser = await ref.read(authServiceProvider.notifier).login(
          email,
          password,
        );

    return User(
      id: firebaseUser.uid,
      displayName: firebaseUser.displayName,
      email: firebaseUser.email!,
    );
  }

  Future<bool> sendEmailVerification(
    String email,
    String password,
  ) {
    return ref.read(authServiceProvider.notifier).sendEmailVerification(
          email,
          password,
        );
  }

  Future<void> sendPasswordResetEmail(String email) {
    return ref.read(authServiceProvider.notifier).sendPasswordResetEmail(email);
  }

  Future<void> selectAnonymousMode() {
    return ref.read(authServiceProvider.notifier).selectAnonymousMode();
  }

  Future<bool> isAnonymousModeSelected() {
    return ref.read(authServiceProvider.notifier).isAnonymousModeSelected();
  }

  Future<void> logout() {
    return ref.read(authServiceProvider.notifier).logout();
  }
}

final userRepositoryProvider = AsyncNotifierProvider<UserRepository, User?>(
  UserRepository.new,
);
