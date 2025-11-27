import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/nutrient_goal_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/services/nutrient_goal_service.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';

class FirestoreNutrientGoalRepository extends NutrientGoalRepository {
  FirestoreNutrientGoalService get _nutrientGoalService =>
      ref.read(firestoreNutrientGoalServiceProvider.notifier);

  @override
  Future<bool> isEmpty() => Auth.guard(
        (user) => _nutrientGoalService.isEmpty(user.uid),
      );

  @override
  Future<List<NutrientGoal>> getActiveGoals(DateTime date) {
    return Auth.guard((user) async {
      final fsModels = await _nutrientGoalService.getActiveGoals(
        date,
        user.uid,
      );

      return fsModels.map((g) => g.toDomain()).toList();
    });
  }

  @override
  Future<String> save(NutrientGoal goal) {
    return Auth.guard((user) async {
      final result = await _nutrientGoalService.save(
        NutrientGoalFirestoreModel.fromDomain(goal),
        user.uid,
      );

      emitChangeSignal();

      return result;
    });
  }

  @override
  Future<bool> delete(String id) {
    return Auth.guard((user) async {
      final result = await _nutrientGoalService.delete(
        id,
        user.uid,
      );

      emitChangeSignal();

      return result;
    });
  }

  @override
  Future<bool> restore(String id) {
    return Auth.guard((user) async {
      final result = await _nutrientGoalService.restore(
        id,
        user.uid,
      );

      emitChangeSignal();

      return result;
    });
  }

  Future<void> purge() => Auth.guard(
        (user) => _nutrientGoalService.purge(userId: user.uid),
      );
}

final firestoreNutrientGoalRepositoryProvider =
    NotifierProvider<NutrientGoalRepository, ChangeSignal?>(
  FirestoreNutrientGoalRepository.new,
);
