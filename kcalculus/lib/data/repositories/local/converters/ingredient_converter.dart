import 'package:kcalculus/data/services/local/database/ingredient/ingredient_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/dish/ingredient.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/units.dart';

class LocalIngredientConverter {
  IngredientDbModel toDbModel(
    Ingredient model,
    String dishId, [
    String? edibleId,
  ]) {
    return IngredientDbModel(
      dish_id: dishId,
      edible_id: (edibleId ?? model.edible.id)!,
      amount_unit: model.amount.unit.name,
      amount_value: model.amount.value,
    );
  }

  Ingredient toModel(IngredientDbModel dbModel, Edible edible) {
    return Ingredient(
      edible: edible,
      amount: Amount(
        unit: Unit.of(dbModel.amount_unit),
        value: dbModel.amount_value,
      ),
    );
  }
}
