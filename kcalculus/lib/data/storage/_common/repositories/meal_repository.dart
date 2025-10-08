import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/utils/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_type_router.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/meal_repository.dart';
import 'package:kcalculus/data/storage/local/meal/repositories/meal_repository.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';

abstract class MealRepository extends ChangeSignalNotifier {
  Future<List<Meal>> getByDate(DateTime date);

  Future<Meal> save(Meal meal);

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}

class _MealRepository extends MealRepository
    with StorageTypeRouter<MealRepository, ChangeSignal?> {
  @override
  ChangeSignal? build() {
    buildDependencies();

    return ChangeSignal();
  }

  @override
  NotifierProvider<MealRepository, ChangeSignal?> buildDelegateProvider(
    StorageType storageType,
  ) =>
      switch (storageType) {
        StorageType.local => localMealRepositoryProvider,
        StorageType.firestore => firestoreMealRepositoryProvider,
      };

  @override
  Future<List<Meal>> getByDate(DateTime date) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).getByDate(date);
  }

  @override
  Future<Meal> save(Meal meal) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).save(meal);
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

final mealRepositoryProvider = NotifierProvider<MealRepository, ChangeSignal?>(
  _MealRepository.new,
);
