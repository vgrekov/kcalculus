import 'package:kcalculus/_data/storage/local/nutrient_goal/converters/nutrient_goal_converter.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalNutrientGoalDao {
  LocalNutrientGoalDao({
    required DatabaseService dbService,
    required LocalNutrientGoalConverter nutrientGoalConverter,
  })  : _dbService = dbService,
        _nutrientGoalConverter = nutrientGoalConverter;

  final DatabaseService _dbService;

  final LocalNutrientGoalConverter _nutrientGoalConverter;

  Future<List<NutrientGoal>> getActiveGoals(
    DateTime date, {
    Transaction? txn,
  }) {
    return _dbService.nutrientGoal.getActive(date, txn: txn).then(
          (data) => data
              .map((dbModel) => _nutrientGoalConverter.toModel(dbModel))
              .toList(),
        );
  }

  Future<String> save(
    NutrientGoal goal, {
    Transaction? txn,
  }) {
    if (txn != null) {
      return _save(goal, txn: txn);
    } else {
      return _dbService.transaction(
        (txn) => _save(goal, txn: txn),
      );
    }
  }

  Future<String> _save(
    NutrientGoal goal, {
    required Transaction txn,
  }) async {
    if (goal.id != null) {
      await _dbService.nutrientGoal.delete(goal.id!, txn: txn);
    }

    final id = generateId();

    await _dbService.nutrientGoal.add(
      _nutrientGoalConverter.toDbModel(goal, id),
      txn: txn,
    );

    return id;
  }

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) {
    return _dbService.nutrientGoal.delete(id, txn: txn);
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) {
    return _dbService.nutrientGoal.restore(id, txn: txn);
  }
}
