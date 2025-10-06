import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/utils/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_type_router.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/food_repository.dart';
import 'package:kcalculus/data/storage/local/food/repositories/food_repository.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/food/models/food.dart';

abstract class FoodRepository extends ChangeSignalNotifier {
  Future<Food?> getById(String id);

  Future<Food> save(
    Food food, {
    bool skipAudit = false,
  });

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}

class _FoodRepository extends FoodRepository
    with StorageTypeRouter<FoodRepository, ChangeSignal?> {
  @override
  ChangeSignal? build() {
    buildDependencies();

    return ChangeSignal();
  }

  @override
  NotifierProvider<FoodRepository, ChangeSignal?> buildDelegateProvider(
    StorageType storageType,
  ) =>
      switch (storageType) {
        StorageType.local => localFoodRepositoryProvider,
        StorageType.firestore => firestoreFoodRepositoryProvider,
      };

  @override
  Future<Food?> getById(String id) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).getById(id);
  }

  @override
  Future<Food> save(
    Food food, {
    bool skipAudit = false,
  }) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).save(
          food,
          skipAudit: skipAudit,
        );
  }

  @override
  Future<bool> delete(String id) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).delete(id);
  }

  @override
  Future<bool> restore(String id) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).restore(id);
  }
}

final foodRepositoryProvider = NotifierProvider<FoodRepository, ChangeSignal?>(
  _FoodRepository.new,
);
