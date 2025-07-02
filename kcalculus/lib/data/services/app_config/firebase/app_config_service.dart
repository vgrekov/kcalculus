import 'package:firebase_database/firebase_database.dart';
import 'package:kcalculus/data/services/app_config/app_config.dart';
import 'package:kcalculus/data/services/app_config/local/app_config.dart';
import 'package:logging/logging.dart';

final _log = Logger('FirebaseAppConfigService');

class FirebaseAppConfigService {
  FirebaseAppConfigService({
    required String env,
  }) : _env = env;

  final String _env;

  Future<AppConfig> getAppConfig() async {
    // TODO: .off!!!
    try {
      final rtdb = FirebaseDatabase.instance;
      final configRef = rtdb.ref('config/$_env');
      final snapshot = await configRef.get();
      if (snapshot.exists) {
        final data = Map<String, dynamic>.from(snapshot.value as Map);
        final config = LocalAppConfig.fromJson(data);
        _log.finest('App Config: ${snapshot.value}');
        return config;
      } else {
        throw 'No config found in Firebase RTDB';
      }
    } catch (error, stackTrace) {
      _log.severe(
        'Failed to load config from Firebase RTDB',
        error,
        stackTrace,
      );
      rethrow;
    }
  }
}
