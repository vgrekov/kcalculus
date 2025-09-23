import 'package:firebase_auth/firebase_auth.dart';
import 'package:kcalculus/data/exceptions/auth_required_exception.dart';

class Auth {
  static T guard<T>(T Function(User user) fun) {
    final auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      throw AuthRequiredException();
    }

    return fun(auth.currentUser!);
  }
}
