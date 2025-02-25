import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:kcalculus/data/services/app_config/app_config.dart';
import 'package:kcalculus/data/services/app_config/local/app_config.dart';

class LocalAppConfigService {
  LocalAppConfigService({
    required String env,
  }) : _env = env;

  final String _env;

  Future<AppConfig> getAppConfig() async {
    final configAsset = 'assets/config-$_env.json';
    final configString = await rootBundle.loadString(configAsset);
    final Map<String, dynamic> configJson = jsonDecode(configString);

    return LocalAppConfig.fromJson(configJson);
  }
}
