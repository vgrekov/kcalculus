import 'dart:async';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/app_config/models/app_config.dart';
import 'package:kcalculus/_data/env/services/env_service.dart';
import 'package:logging/logging.dart';

final _log = Logger('AppConfigService');

class AppConfigService extends AsyncNotifier<AppConfig?> {
  static final _kPlatform = Platform.isAndroid ? 'android' : 'ios';

  @override
  FutureOr<AppConfig?> build() async {
    final env = await ref.watch(envProvider.future);
    if (env == null) {
      return null;
    }

    AppConfig? value;

    try {
      final valueRef = FirebaseDatabase.instance.ref('config/$env/$_kPlatform');

      final snapshot = await valueRef.get();
      value = _parseValue(snapshot, env);

      final subscription = _subscribeToValue(valueRef, env);
      ref.onDispose(() {
        subscription.cancel();
      });
    } catch (error, stackTrace) {
      _log.severe(
        'Failed to load [$env/$_kPlatform] config from Firebase RTDB',
        error,
        stackTrace,
      );
    }

    _log.finest('App Config [$env/$_kPlatform]: $value');

    return value;
  }

  StreamSubscription<DatabaseEvent> _subscribeToValue(
    DatabaseReference envRef,
    String env,
  ) {
    return envRef.onValue.listen(
      (event) {
        AppConfig? value = _parseValue(event.snapshot, env);

        _updateState(value, env);
      },
      onError: (error, stackTrace) {
        _log.severe(
          'Failed to load [$env/$_kPlatform] config from Firebase RTDB',
          error,
          stackTrace,
        );

        _updateState(null, env);
      },
    );
  }

  AppConfig? _parseValue(DataSnapshot snapshot, String env) {
    AppConfig? value;

    if (snapshot.exists) {
      try {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        value = AppConfig.fromJson(data);
      } catch (error, stackTrace) {
        _log.severe(
          'Failed to parse [$env/$_kPlatform] config from Firebase RTDB',
          error,
          stackTrace,
        );
      }
    } else {
      _log.severe('No [$env/$_kPlatform] config found in Firebase RTDB');
    }

    return value;
  }

  void _updateState(AppConfig? value, String env) {
    if (state.valueOrNull != value) {
      state = AsyncData(value);

      _log.finest('App Config [$env/$_kPlatform]: $value');
    }
  }
}

final appConfigServiceProvider =
    AsyncNotifierProvider<AppConfigService, AppConfig?>(
  AppConfigService.new,
);
