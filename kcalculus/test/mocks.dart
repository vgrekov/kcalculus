import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/_common/database/models/database_config.dart';
import 'package:kcalculus/data/_common/database/services/database_service.dart';
import 'package:kcalculus/data/app_config/models/app_config.dart';
import 'package:kcalculus/data/app_config/services/app_config_service.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/data/storage/local/edible/dao/nutrition_facts_dao.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sqflite/sqflite.dart';

class MockAppConfigService extends AsyncNotifier<AppConfig?>
    with Mock
    implements AppConfigService {}

class MockDatabaseService extends FamilyAsyncNotifier<Database, DatabaseConfig>
    with Mock
    implements DatabaseService {}

class MockDatabase with Mock implements Database {}

class MockLocalNutritionFactsDao extends Notifier<void>
    with Mock
    implements LocalNutritionFactsDao {}

class MockFirestoreEdibleService extends Notifier<void>
    with Mock
    implements FirestoreEdibleService {}

class MockAuthService extends AsyncNotifier<User?>
    with Mock
    implements AuthService {}

class MockUser with Mock implements User {
  MockUser({
    required this.uid,
    this.email,
    this.displayName,
  });

  @override
  final String uid;

  @override
  final String? email;

  @override
  final String? displayName;
}
