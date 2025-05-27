import 'package:kcalculus/data/services/local/database/food/food_db_model.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalFoodConverter {
  FoodDbModel toDbModel(Food model, [String? foodId]) {
    return FoodDbModel(
      id: (foodId ?? model.id)!,
      name: model.name,
      description: model.description,
    );
  }

  Food toModel(
    FoodDbModel dbModel,
    List<NutritionFacts> nutritionFacts,
  ) {
    return Food(
      id: dbModel.id,
      name: dbModel.name,
      description: dbModel.description ?? '',
      nutritionFacts: nutritionFacts,
      createdAt: dbModel.created_at != null
          ? dt.parseISO8601(dbModel.created_at!)
          : null,
      updatedAt: dbModel.updated_at != null
          ? dt.parseISO8601(dbModel.updated_at!)
          : null,
    );
  }
}
