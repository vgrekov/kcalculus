import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/utils/async_storage_type_router.dart';
import 'package:kcalculus/data/storage/firestore/user_data/repositories/default_nutrient_repository.dart';
import 'package:kcalculus/data/storage/local/default_nutrient/repositories/default_nutrient_repository.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';

abstract class DefaultNutrientRepository extends AsyncNotifier<List<Nutrient>> {
  Future<void> saveAll(List<Nutrient> nutrients);
}

class _DefaultNutrientRepository extends DefaultNutrientRepository
    with AsyncStorageTypeRouter<DefaultNutrientRepository, List<Nutrient>> {
  @override
  FutureOr<List<Nutrient>> build() async {
    buildDependencies();

    final provider = await delegateProvider;

    return ref.read(provider.future);
  }

  @override
  AsyncNotifierProvider<DefaultNutrientRepository, List<Nutrient>>
      buildDelegateProvider(
    StorageType storageType,
  ) =>
          switch (storageType) {
            StorageType.local => localDefaultNutrientRepositoryProvider,
            StorageType.firestore => firestoreDefaultNutrientRepositoryProvider,
          };

  @override
  Future<void> saveAll(List<Nutrient> nutrients) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).saveAll(nutrients);
  }
}

final defaultNutrientRepositoryProvider =
    AsyncNotifierProvider<DefaultNutrientRepository, List<Nutrient>>(
  _DefaultNutrientRepository.new,
);
