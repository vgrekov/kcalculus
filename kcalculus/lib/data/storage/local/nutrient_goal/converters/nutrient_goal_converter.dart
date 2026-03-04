import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/nutrient_goal/models/nutrient_goal_db_model.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalNutrientGoalConverter extends Notifier<void> {
  @override
  void build() {}

  NutrientGoalDbModel toDbModel(NutrientGoal model, [String? id]) {
    return NutrientGoalDbModel(
      id: (id ?? model.id)!,
      nutrient: model.nutrient.name,
      amount_unit: model.amount.unit.name,
      amount_value: model.amount.value,
      created_at: model.createdAt != null
          ? dt.formatISO8601(model.createdAt!)
          : null,
      deleted_at: model.deletedAt != null
          ? dt.formatISO8601(model.deletedAt!)
          : null,
    );
  }

  NutrientGoal toModel(NutrientGoalDbModel dbModel) {
    return NutrientGoal(
      id: dbModel.id,
      nutrient: Nutrient.of(dbModel.nutrient),
      amount: Amount(
        unit: Unit.of(dbModel.amount_unit),
        value: dbModel.amount_value,
      ),
      createdAt: (dbModel.created_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.created_at!)
          : null,
      deletedAt: (dbModel.deleted_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.deleted_at!)
          : null,
    );
  }
}

final localNutrientGoalConverterProvider =
    NotifierProvider<LocalNutrientGoalConverter, void>(
      LocalNutrientGoalConverter.new,
    );
