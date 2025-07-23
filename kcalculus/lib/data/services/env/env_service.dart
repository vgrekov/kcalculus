import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

final _log = Logger('EnvService');

class EnvService extends AsyncNotifier<String?> {
  static const _kEnvArg = 'ENV';

  @override
  FutureOr<String?> build() async {
    final passedArg = const String.fromEnvironment(_kEnvArg);
    if (passedArg.isNotEmpty) {
      return passedArg;
    }

    String? value;

    final packageInfo = await PackageInfo.fromPlatform();
    final buildNumber = packageInfo.buildNumber;

    try {
      final valueRef = FirebaseDatabase.instance.ref('releases/$buildNumber');

      final snapshot = await valueRef.get();
      value = _parseValue(snapshot, buildNumber);

      final subscription = _subscribeToValue(valueRef, buildNumber);
      ref.onDispose(() {
        subscription.cancel();
      });
    } catch (error, stackTrace) {
      _log.severe(
        'Failed to load env for release [$buildNumber] from Firebase RTDB',
        error,
        stackTrace,
      );
    }

    _log.finest('Env for release [$buildNumber]: $value');

    return value;
  }

  StreamSubscription<DatabaseEvent> _subscribeToValue(
    DatabaseReference envRef,
    String buildNumber,
  ) {
    return envRef.onValue.listen(
      (event) {
        String? value = _parseValue(event.snapshot, buildNumber);

        _updateState(value, buildNumber);
      },
      onError: (error, stackTrace) {
        _log.severe(
          'Failed to load env for release [$buildNumber] from Firebase RTDB',
          error,
          stackTrace,
        );

        _updateState(null, buildNumber);
      },
    );
  }

  String? _parseValue(DataSnapshot snapshot, String buildNumber) {
    String? value;

    if (snapshot.exists) {
      try {
        value = snapshot.value as String?;
      } catch (error, stackTrace) {
        _log.severe(
          'Failed to parse env for release [$buildNumber] from Firebase RTDB',
          error,
          stackTrace,
        );
      }
    } else {
      _log.severe(
        'No env for release [$buildNumber] found in Firebase RTDB',
      );
    }

    return value;
  }

  void _updateState(String? value, String buildNumber) {
    if (state.valueOrNull != value) {
      state = AsyncData(value);

      _log.finest('Env for release [$buildNumber]: $value');
    }
  }
}
