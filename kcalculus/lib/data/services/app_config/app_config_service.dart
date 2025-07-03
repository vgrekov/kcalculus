import 'dart:async';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/services/app_config/app_config.dart';
import 'package:logging/logging.dart';

final _log = Logger('AppConfigService');

class AppConfigService extends FamilyAsyncNotifier<AppConfig?, String> {
  @override
  FutureOr<AppConfig?> build(String arg) async {
    try {
      // Make sure App Check is passed
      await FirebaseAppCheck.instance.getToken(false);

      final completer = Completer<AppConfig?>();

      final subscription =
          FirebaseDatabase.instance.ref('config/$arg').onValue.listen(
        (event) {
          AppConfig? config;
          if (event.snapshot.exists) {
            final data = Map<String, dynamic>.from(event.snapshot.value as Map);

            try {
              config = AppConfig.fromJson(data);

              _log.finest('App Config [$arg]: $config');
            } catch (error, stackTrace) {
              _log.severe(
                'Failed to parse [$arg] config from Firebase RTDB',
                error,
                stackTrace,
              );
            }
          } else {
            _log.severe('No [$arg] config found in Firebase RTDB');
          }

          if (!completer.isCompleted) {
            completer.complete(config);
          } else {
            state = AsyncData(config);
          }
        },
        onError: (error, stackTrace) {
          _log.severe(
            'Failed to load [$arg] config from Firebase RTDB',
            error,
            stackTrace,
          );

          if (!completer.isCompleted) {
            completer.complete(null);
          } else {
            state = AsyncData(null);
          }
        },
      );

      ref.onDispose(() {
        subscription.cancel();
      });

      return completer.future;
    } catch (error, stackTrace) {
      _log.severe(
        'Failed to load [$arg] config from Firebase RTDB',
        error,
        stackTrace,
      );

      return null;
    }
  }
}
