import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/utils/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_type_router.dart';
import 'package:kcalculus/data/storage/local/dish/repositories/dish_repository.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';

abstract class DishRepository extends ChangeSignalNotifier {
  Future<Dish?> getById(String id);

  Future<Dish> save(
    Dish dish, {
    bool skipAudit = false,
  });

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}

class _DishRepository extends DishRepository
    with StorageTypeRouter<DishRepository, ChangeSignal?> {
  @override
  ChangeSignal? build() {
    buildDependencies();

    return ChangeSignal();
  }

  @override
  NotifierProvider<DishRepository, ChangeSignal?> buildDelegateProvider(
    StorageType storageType,
  ) =>
      switch (storageType) {
        StorageType.local => localDishRepositoryProvider,
        // TODO: Firestore
        StorageType.firestore => localDishRepositoryProvider,
      };

  @override
  Future<Dish?> getById(String id) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).getById(id);
  }

  @override
  Future<Dish> save(
    Dish dish, {
    bool skipAudit = false,
  }) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).save(
          dish,
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

final dishRepositoryProvider = NotifierProvider<DishRepository, ChangeSignal?>(
  _DishRepository.new,
);
