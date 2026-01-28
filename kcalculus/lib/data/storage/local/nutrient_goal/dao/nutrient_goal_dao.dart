import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/data/storage/local/nutrient_goal/converters/nutrient_goal_converter.dart';
import 'package:kcalculus/data/storage/local/nutrient_goal/services/nutrient_goal_service.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalNutrientGoalDao extends Notifier<void> {
  @override
  void build() {}

  LocalNutrientGoalService get _nutrientGoalService =>
      ref.read(localNutrientGoalServiceProvider.notifier);

  LocalNutrientGoalConverter get _nutrientGoalConverter =>
      ref.read(localNutrientGoalConverterProvider.notifier);

  Future<bool> isEmpty({
    Transaction? txn,
  }) => _nutrientGoalService.isEmpty(
    txn: txn,
  );

  Future<List<NutrientGoal>> getAll({
    bool includeDeleted = false,
    int? limit,
    int? offset,
    Transaction? txn,
  }) {
    return _nutrientGoalService
        .all(
          includeDeleted: includeDeleted,
          limit: limit,
          offset: offset,
          txn: txn,
        )
        .then(
          (data) => data
              .map((dbModel) => _nutrientGoalConverter.toModel(dbModel))
              .toList(),
        );
  }

  Future<List<NutrientGoal>> getActiveGoals(
    DateTime date, {
    Transaction? txn,
  }) {
    return _nutrientGoalService
        .getActive(date, txn: txn)
        .then(
          (data) => data
              .map((dbModel) => _nutrientGoalConverter.toModel(dbModel))
              .toList(),
        );
  }

  Future<String> save(
    NutrientGoal goal, {
    Transaction? txn,
  }) async {
    if (txn != null) {
      return _save(goal, txn: txn);
    } else {
      final db = await ref.read(localStorageServiceProvider.future);

      return db.transaction(
        (txn) => _save(goal, txn: txn),
      );
    }
  }

  Future<String> _save(
    NutrientGoal goal, {
    required Transaction txn,
  }) async {
    if (goal.id != null) {
      await _nutrientGoalService.delete(goal.id!, txn: txn);
    }

    final id = generateId();

    await _nutrientGoalService.add(
      _nutrientGoalConverter.toDbModel(goal, id),
      txn: txn,
    );

    return id;
  }

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) {
    return _nutrientGoalService.delete(id, txn: txn);
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) {
    return _nutrientGoalService.restore(id, txn: txn);
  }
}

final localNutrientGoalDaoProvider =
    NotifierProvider<LocalNutrientGoalDao, void>(
      LocalNutrientGoalDao.new,
    );
