import 'package:kcalculus/data/repositories/food_repository.dart';
import 'package:kcalculus/data/repositories/local/converters/food_converter.dart';
import 'package:kcalculus/data/repositories/local/converters/nutrition_facts_converter.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/utils/ids.dart';

class LocalFoodRepository implements FoodRepository {
  LocalFoodRepository({
    required DatabaseService dbService,
    required LocalFoodConverter foodConverter,
    required LocalNutritionFactsConverter nutritionFactsConverter,
  })  : _dbService = dbService,
        _foodConverter = foodConverter,
        _nutritionFactsConverter = nutritionFactsConverter;

  final DatabaseService _dbService;

  final LocalFoodConverter _foodConverter;

  final LocalNutritionFactsConverter _nutritionFactsConverter;

  @override
  Future<Food?> getById(String id) async {
    final foodDbModel = await _dbService.food.getById(id);
    if (foodDbModel != null) {
      final nutritionFactsDbModels =
          await _dbService.nutritionFacts.getByEdible(id);

      return _foodConverter.toModel(
        foodDbModel,
        nutritionFactsDbModels,
      );
    }

    return null;
  }

  @override
  Future<Food> save(Food food) {
    return _dbService.transaction((txn) async {
      final foodId = food.id ?? generateId();

      final foodDbModel = _foodConverter.toDbModel(food, foodId);

      if (food.id == null) {
        await _dbService.edible.add(foodDbModel.toBaseDbModel(), txn: txn);
        await _dbService.food.add(foodDbModel, txn: txn);

        food = food.copyWith(id: foodId);
      } else {
        await _dbService.edible.update(foodDbModel.toBaseDbModel(), txn: txn);
      }

      await _dbService.nutritionFacts.saveForEdible(
        food.nutritionFacts
            .map((model) => _nutritionFactsConverter.toDbModel(model, foodId))
            .toList(),
        foodId,
        txn: txn,
      );

      return food;
    });
  }
}
