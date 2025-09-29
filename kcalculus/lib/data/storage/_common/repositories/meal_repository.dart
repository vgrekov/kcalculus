import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/providers.dart';
import 'package:kcalculus/data/storage/_common/repositories/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/local/meal/repositories/meal_repository.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';

abstract class MealRepository extends ChangeSignalNotifier {
  Future<List<Meal>> getByDate(DateTime date);

  Future<Meal> save(Meal meal);

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}

class _MealRepository extends MealRepository {
  @override
  ChangeSignal? build() {
    ref.watch(storageTypeProvider);
    ref.watch(localMealRepositoryProvider);
    // TODO: Firestore

    return ChangeSignal();
  }

  Future<NotifierProvider<MealRepository, ChangeSignal?>>
      get _providerImpl async {
    final storageType = await ref.read(storageTypeProvider.future);

    return switch (storageType) {
      StorageType.local => localMealRepositoryProvider,
      // TODO: Firestore
      StorageType.firestore => localMealRepositoryProvider,
    };
  }

  @override
  Future<List<Meal>> getByDate(DateTime date) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).getByDate(date);
  }

  @override
  Future<Meal> save(Meal meal) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).save(meal);
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

final mealRepositoryProvider = NotifierProvider<MealRepository, ChangeSignal?>(
  _MealRepository.new,
);
