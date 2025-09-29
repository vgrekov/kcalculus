import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/providers.dart';
import 'package:kcalculus/data/storage/_common/repositories/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/local/nutrient_goal/repositories/nutrient_goal_repository.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';
import 'package:kcalculus/domain/utils/change_signal.dart';

abstract class NutrientGoalRepository extends ChangeSignalNotifier {
  Future<List<NutrientGoal>> getActiveGoals(DateTime date);

  Future<String> save(NutrientGoal goal);

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}

class _NutrientGoalRepository extends NutrientGoalRepository {
  @override
  ChangeSignal? build() {
    ref.watch(storageTypeProvider);
    ref.watch(localNutrientGoalRepositoryProvider);
    // TODO: Firestore

    return ChangeSignal();
  }

  Future<NotifierProvider<NutrientGoalRepository, ChangeSignal?>>
      get _providerImpl async {
    final storageType = await ref.read(storageTypeProvider.future);

    return switch (storageType) {
      StorageType.local => localNutrientGoalRepositoryProvider,
      // TODO: Firestore
      StorageType.firestore => localNutrientGoalRepositoryProvider,
    };
  }

  @override
  Future<List<NutrientGoal>> getActiveGoals(DateTime date) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).getActiveGoals(date);
  }

  @override
  Future<String> save(NutrientGoal goal) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).save(goal);
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

final nutrientGoalRepositoryProvider =
    NotifierProvider<NutrientGoalRepository, ChangeSignal?>(
  _NutrientGoalRepository.new,
);
