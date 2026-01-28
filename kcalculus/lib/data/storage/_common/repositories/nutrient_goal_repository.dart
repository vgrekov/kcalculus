import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/utils/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_type_router.dart';
import 'package:kcalculus/data/storage/firestore/user_data/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/data/storage/local/nutrient_goal/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';

abstract class NutrientGoalRepository extends ChangeSignalNotifier {
  Future<bool> isEmpty();

  Future<List<NutrientGoal>> getAll({
    bool includeDeleted = false,
    PageConfig<NutrientGoal>? pageConfig,
  });

  Future<List<NutrientGoal>> getActiveGoals(DateTime date);

  Future<String> save(NutrientGoal goal);

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}

class _NutrientGoalRepository extends NutrientGoalRepository
    with StorageTypeRouter<NutrientGoalRepository, ChangeSignal?> {
  @override
  ChangeSignal? build() {
    buildDependencies();

    return ChangeSignal();
  }

  @override
  NotifierProvider<NutrientGoalRepository, ChangeSignal?> buildDelegateProvider(
    StorageType storageType,
  ) => switch (storageType) {
    StorageType.local => localNutrientGoalRepositoryProvider,
    StorageType.firestore => firestoreNutrientGoalRepositoryProvider,
  };

  @override
  Future<bool> isEmpty() async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).isEmpty();
  }

  @override
  Future<List<NutrientGoal>> getAll({
    bool includeDeleted = false,
    PageConfig<NutrientGoal>? pageConfig,
  }) async {
    final provider = await delegateProvider;

    return ref
        .read(provider.notifier)
        .getAll(
          includeDeleted: includeDeleted,
          pageConfig: pageConfig,
        );
  }

  @override
  Future<List<NutrientGoal>> getActiveGoals(DateTime date) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).getActiveGoals(date);
  }

  @override
  Future<String> save(NutrientGoal goal) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).save(goal);
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

final nutrientGoalRepositoryProvider =
    NotifierProvider<NutrientGoalRepository, ChangeSignal?>(
      _NutrientGoalRepository.new,
    );
