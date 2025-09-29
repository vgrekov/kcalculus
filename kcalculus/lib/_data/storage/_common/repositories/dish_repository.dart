import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/_data/storage/_common/providers.dart';
import 'package:kcalculus/_data/storage/_common/repositories/change_signal_notifier.dart';
import 'package:kcalculus/_data/storage/local/dish/repositories/dish_repository.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/utils/change_signal.dart';

abstract class DishRepository extends ChangeSignalNotifier {
  Future<Dish?> getById(String id);

  Future<Dish> save(
    Dish dish, {
    bool skipAudit = false,
  });

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}

class _DishRepository extends DishRepository {
  @override
  ChangeSignal? build() {
    ref.watch(storageTypeProvider);
    ref.watch(localDishRepositoryProvider);
    // TODO: Firestore

    return ChangeSignal();
  }

  Future<NotifierProvider<DishRepository, ChangeSignal?>>
      get _providerImpl async {
    final storageType = await ref.read(storageTypeProvider.future);

    return switch (storageType) {
      StorageType.local => localDishRepositoryProvider,
      // TODO: Firestore
      StorageType.firestore => localDishRepositoryProvider,
    };
  }

  @override
  Future<Dish?> getById(String id) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).getById(id);
  }

  @override
  Future<Dish> save(
    Dish dish, {
    bool skipAudit = false,
  }) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).save(
          dish,
          skipAudit: skipAudit,
        );
  }

  @override
  Future<bool> delete(String id) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).delete(id);
  }

  @override
  Future<bool> restore(String id) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).restore(id);
  }
}

final dishRepositoryProvider = NotifierProvider<DishRepository, ChangeSignal?>(
  _DishRepository.new,
);
