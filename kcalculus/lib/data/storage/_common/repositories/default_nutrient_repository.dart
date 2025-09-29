import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/providers.dart';
import 'package:kcalculus/data/storage/local/default_nutrient/repositories/default_nutrient_repository.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

abstract class DefaultNutrientRepository extends AsyncNotifier<List<Nutrient>> {
  Future<void> saveAll(List<Nutrient> nutrients);
}

class _DefaultNutrientRepository extends DefaultNutrientRepository {
  @override
  FutureOr<List<Nutrient>> build() async {
    ref.watch(storageTypeProvider);
    ref.watch(localDefaultNutrientRepositoryProvider);
    // TODO: Firestore

    final provider = await _providerImpl;

    return ref.read(provider.future);
  }

  Future<AsyncNotifierProvider<DefaultNutrientRepository, List<Nutrient>>>
      get _providerImpl async {
    final storageType = await ref.read(storageTypeProvider.future);

    return switch (storageType) {
      StorageType.local => localDefaultNutrientRepositoryProvider,
      // TODO: Firestore
      StorageType.firestore => localDefaultNutrientRepositoryProvider,
    };
  }

  @override
  Future<void> saveAll(List<Nutrient> nutrients) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).saveAll(nutrients);
  }
}

final defaultNutrientRepositoryProvider =
    AsyncNotifierProvider<DefaultNutrientRepository, List<Nutrient>>(
  _DefaultNutrientRepository.new,
);
