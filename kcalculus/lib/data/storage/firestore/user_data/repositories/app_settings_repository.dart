import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/app_settings_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/user_data_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/services/user_data_service.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';

class FirestoreAppSettingsRepository extends AppSettingsRepository {
  static const _kDefaultSettings = AppSettings(
    theme: AppTheme.system,
    scannerDisclaimerEnabled: true,
  );

  @override
  FutureOr<AppSettings> build() async {
    ref.watch(authServiceProvider);

    return Auth.guard(
      (user) async {
        final userData = await _userDataService.getById(user.uid);

        return userData?.settings?.toDomain() ?? _kDefaultSettings;
      },
      onNotAuthenticated: () => _kDefaultSettings,
    );
  }

  FirestoreUserDataService get _userDataService =>
      ref.read(firestoreUserDataServiceProvider.notifier);

  @override
  Future<void> saveSettings(AppSettings settings) {
    return Auth.guard((user) async {
      var userData = await _userDataService.getById(user.uid);

      if (userData == null) {
        await _userDataService.add(
          UserDataFirestoreModel(
            id: user.uid,
            settings: AppSettingsFirestoreModel.fromDomain(settings),
          ),
        );
      } else {
        await _userDataService.update(
          userData.copyWith(
            settings: AppSettingsFirestoreModel.fromDomain(settings),
          ),
        );
      }

      state = AsyncData(settings);
    });
  }

  Future<void> purge() => Auth.guard(
        (user) => _userDataService.purge(userId: user.uid),
      );
}

final firestoreAppSettingsRepositoryProvider =
    AsyncNotifierProvider<AppSettingsRepository, AppSettings>(
  FirestoreAppSettingsRepository.new,
);
