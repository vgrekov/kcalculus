import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/user/models/app_settings_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user/models/user_firestore_model.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/app_settings.dart';

class FirestoreAppSettingsRepository extends AppSettingsRepository {
  static const _kDefaultSettings = AppSettings(
    theme: AppTheme.system,
    scannerDisclaimerEnabled: true,
  );

  FirebaseFirestore get _db => FirebaseFirestore.instance;

  @override
  FutureOr<AppSettings> build() async {
    ref.watch(authServiceProvider);

    return Auth.guard(
      (user) async {
        final snapshot = await _db
            .collection(UserFirestoreModel.kCollection)
            .doc(user.uid)
            .get();

        final data = snapshot.data();

        AppSettings? settings;

        if (data != null) {
          settings = UserFirestoreModel.fromJson(
            {
              'id': snapshot.id,
              ...data,
            },
          ).settings?.toDomain();
        }

        return settings ?? _kDefaultSettings;
      },
      onNotAuthenticated: () => _kDefaultSettings,
    );
  }

  @override
  Future<void> saveSettings(AppSettings settings) {
    return Auth.guard((user) async {
      final docRef =
          _db.collection(UserFirestoreModel.kCollection).doc(user.uid);
      final snapshot = await docRef.get();
      final data = snapshot.data();

      if (data != null) {
        var fsModel = UserFirestoreModel.fromJson(
          {
            'id': snapshot.id,
            ...data,
          },
        );

        fsModel = fsModel.copyWith(
          settings: AppSettingsFirestoreModel.fromDomain(settings),
        );

        await docRef.update(
          {
            ...fsModel.toJson(),
            'updatedAt': FieldValue.serverTimestamp(),
          },
        );
      } else {
        final fsModel = UserFirestoreModel(
          id: snapshot.id,
          settings: AppSettingsFirestoreModel.fromDomain(settings),
        );

        await docRef.set(
          {
            ...fsModel.toJson(),
            'createdAt': FieldValue.serverTimestamp(),
            'updatedAt': FieldValue.serverTimestamp(),
            'deletedAt': null,
          },
        );
      }

      state = AsyncData(settings);
    });
  }
}

final firestoreAppSettingsRepositoryProvider =
    AsyncNotifierProvider<AppSettingsRepository, AppSettings>(
  FirestoreAppSettingsRepository.new,
);
