import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/user/repositories/app_settings_repository.dart';
import 'package:kcalculus/data/storage/local/app_settings/repositories/app_settings_repository.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';

abstract class AppSettingsRepository extends AsyncNotifier<AppSettings> {
  Future<void> saveSettings(AppSettings settings);
}

class _AppSettingsRepository extends AppSettingsRepository {
  @override
  FutureOr<AppSettings> build() async {
    ref.watch(storageTypeProvider);
    ref.watch(localAppSettingsRepositoryProvider);
    ref.watch(firestoreAppSettingsRepositoryProvider);

    final provider = await _providerImpl;

    final settings = await ref.read(provider.future);

    return settings;
  }

  Future<AsyncNotifierProvider<AppSettingsRepository, AppSettings>>
      get _providerImpl async {
    final storageType = await ref.read(storageTypeProvider.future);

    return switch (storageType) {
      StorageType.local => localAppSettingsRepositoryProvider,
      StorageType.firestore => firestoreAppSettingsRepositoryProvider,
    };
  }

  @override
  Future<void> saveSettings(AppSettings settings) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).saveSettings(settings);
  }
}

final appSettingsRepositoryProvider =
    AsyncNotifierProvider<AppSettingsRepository, AppSettings>(
  _AppSettingsRepository.new,
);
