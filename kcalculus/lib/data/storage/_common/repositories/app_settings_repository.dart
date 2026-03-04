import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/utils/async_storage_type_router.dart';
import 'package:kcalculus/data/storage/firestore/user_data/repositories/app_settings_repository.dart';
import 'package:kcalculus/data/storage/local/app_settings/repositories/app_settings_repository.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';

abstract class AppSettingsRepository extends AsyncNotifier<AppSettings> {
  Future<void> saveSettings(AppSettings settings);
}

class _AppSettingsRepository extends AppSettingsRepository
    with AsyncStorageTypeRouter<AppSettingsRepository, AppSettings> {
  @override
  FutureOr<AppSettings> build() async {
    buildDependencies();

    final provider = await delegateProvider;

    final settings = await ref.read(provider.future);

    return settings;
  }

  @override
  AsyncNotifierProvider<AppSettingsRepository, AppSettings>
      buildDelegateProvider(
    StorageType storageType,
  ) =>
          switch (storageType) {
            StorageType.local => localAppSettingsRepositoryProvider,
            StorageType.firestore => firestoreAppSettingsRepositoryProvider,
          };

  @override
  Future<void> saveSettings(AppSettings settings) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).saveSettings(settings);
  }
}

final appSettingsRepositoryProvider =
    AsyncNotifierProvider<AppSettingsRepository, AppSettings>(
  _AppSettingsRepository.new,
);
