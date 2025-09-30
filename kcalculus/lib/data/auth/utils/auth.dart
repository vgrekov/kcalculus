import 'package:firebase_auth/firebase_auth.dart';
import 'package:kcalculus/domain/auth/exceptions/auth_required_exception.dart';

class Auth {
  static T guard<T>(
    T Function(User user) fun, {
    T Function()? onNotAuthenticated,
  }) {
    final auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      if (onNotAuthenticated != null) {
        return onNotAuthenticated();
      } else {
        throw AuthRequiredException();
      }
    }

    return fun(auth.currentUser!);
  }
}
