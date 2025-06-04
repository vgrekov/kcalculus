import 'package:kcalculus/data/services/local/database/nutrient_goal/nutrient_goal_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_goal.dart';
import 'package:kcalculus/domain/models/units.dart';

class LocalNutrientGoalConverter {
  NutrientGoalDbModel toDbModel(NutrientGoal model, [String? id]) {
    return NutrientGoalDbModel(
      id: (id ?? model.id)!,
      nutrient: model.nutrient.name,
      amount_unit: model.amount.unit.name,
      amount_value: model.amount.value,
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
    );
  }
}
