import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/providers.dart';
import 'package:kcalculus/data/storage/local/app_settings/repositories/app_settings_repository.dart';
import 'package:kcalculus/domain/models/app_settings.dart';

abstract class AppSettingsRepository extends AsyncNotifier<AppSettings> {
  Future<void> saveSettings(AppSettings settings);
}

class _AppSettingsRepository extends AppSettingsRepository {
  @override
  FutureOr<AppSettings> build() async {
    ref.watch(storageTypeProvider);
    ref.watch(localAppSettingsRepositoryProvider);
    // TODO: Firestore

    final provider = await _providerImpl;

    return ref.read(provider.future);
  }

  @override
  Future<void> saveSettings(AppSettings settings) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).saveSettings(settings);
  }

  Future<AsyncNotifierProvider<AppSettingsRepository, AppSettings>>
      get _providerImpl async {
    final storageType = await ref.read(storageTypeProvider.future);

    return switch (storageType) {
      StorageType.local => localAppSettingsRepositoryProvider,
      // TODO: Firestore
      StorageType.firestore => localAppSettingsRepositoryProvider,
    };
  }
}

final appSettingsRepositoryProvider =
    AsyncNotifierProvider<AppSettingsRepository, AppSettings>(
  _AppSettingsRepository.new,
);
