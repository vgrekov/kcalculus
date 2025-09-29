import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/providers.dart';
import 'package:kcalculus/data/storage/_common/repositories/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/local/food/repositories/food_repository.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/utils/change_signal.dart';

abstract class FoodRepository extends ChangeSignalNotifier {
  Future<Food?> getById(String id);

  Future<Food> save(
    Food food, {
    bool skipAudit = false,
  });

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}

class _FoodRepository extends FoodRepository {
  @override
  ChangeSignal? build() {
    ref.watch(storageTypeProvider);
    ref.watch(localFoodRepositoryProvider);
    // TODO: Firestore

    return ChangeSignal();
  }

  Future<NotifierProvider<FoodRepository, ChangeSignal?>>
      get _providerImpl async {
    final storageType = await ref.read(storageTypeProvider.future);

    return switch (storageType) {
      StorageType.local => localFoodRepositoryProvider,
      // TODO: Firestore
      StorageType.firestore => localFoodRepositoryProvider,
    };
  }

  @override
  Future<Food?> getById(String id) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).getById(id);
  }

  @override
  Future<Food> save(
    Food food, {
    bool skipAudit = false,
  }) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).save(
          food,
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

final foodRepositoryProvider = NotifierProvider<FoodRepository, ChangeSignal?>(
  _FoodRepository.new,
);
