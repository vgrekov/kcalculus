import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/app_config/models/app_config.dart';
import 'package:kcalculus/data/app_config/services/app_config_service.dart';
import 'package:mocktail/mocktail.dart';

class MockAppConfigService extends AsyncNotifier<AppConfig?>
    with Mock
    implements AppConfigService {}
