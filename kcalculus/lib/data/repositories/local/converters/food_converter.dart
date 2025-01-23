import 'package:kcalculus/data/repositories/local/converters/nutrition_facts_converter.dart';
import 'package:kcalculus/data/services/local/database/edible/edible_db_model.dart';
import 'package:kcalculus/data/services/local/database/nutrition_facts/nutrition_facts_db_model.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalFoodConverter {
  LocalFoodConverter({
    required LocalNutritionFactsConverter nutritionFactsConverter,
  }) : _nutritionFactsConverter = nutritionFactsConverter;

  final LocalNutritionFactsConverter _nutritionFactsConverter;

  FoodDbModel toDbModel(Food model, [String? foodId]) {
    return EdibleDbModel.food(
      id: (foodId ?? model.id)!,
      name: model.name,
      description: model.description,
    ) as FoodDbModel;
  }

  Food toModel(
    FoodDbModel dbModel,
    List<NutritionFactsDbModel> nutritionFactsDbModels,
  ) {
    return Food(
      id: dbModel.id,
      name: dbModel.name,
      description: dbModel.description ?? '',
      nutritionFacts:
          nutritionFactsDbModels.map(_nutritionFactsConverter.toModel).toList(),
      createdAt: dbModel.created_at != null
          ? dt.parseISO8601(dbModel.created_at!)
          : null,
      updatedAt: dbModel.updated_at != null
          ? dt.parseISO8601(dbModel.updated_at!)
          : null,
    );
  }
}
