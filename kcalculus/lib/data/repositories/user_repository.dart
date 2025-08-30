import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/user.dart';

class UserRepository extends AsyncNotifier<User?> {
  @override
  FutureOr<User?> build() async {
    final firebaseUser = await ref.watch(authServiceProvider.future);
    return firebaseUser == null
        ? null
        : User(
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
}
