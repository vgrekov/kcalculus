import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/domain/auth/exceptions/auth_required_exception.dart';

class Auth {
  static Future<T> guard<T>(
    Ref ref,
    FutureOr<T> Function(User user) fun, {
    FutureOr<T> Function()? onNotAuthenticated,
  }) async {
    final currentUser = await ref.read(authServiceProvider.future);
    if (currentUser == null) {
      if (onNotAuthenticated != null) {
        return onNotAuthenticated();
      } else {
        throw AuthRequiredException();
      }
    }

    return fun(currentUser);
  }
}
