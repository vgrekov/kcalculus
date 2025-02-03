import 'package:kcalculus/data/exceptions/duplication_exception.dart';
import 'package:kcalculus/data/repositories/local/converters/food_converter.dart';
import 'package:kcalculus/data/repositories/local/converters/nutrition_facts_converter.dart';
import 'package:kcalculus/data/repositories/local/dao/edible_dao.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalFoodDao {
  LocalFoodDao({
    required DatabaseService dbService,
    required LocalEdibleDao edibleDao,
    required LocalFoodConverter foodConverter,
    required LocalNutritionFactsConverter nutritionFactsConverter,
  })  : _dbService = dbService,
        _edibleDao = edibleDao,
        _foodConverter = foodConverter,
        _nutritionFactsConverter = nutritionFactsConverter;

  final DatabaseService _dbService;

  final LocalEdibleDao _edibleDao;

  final LocalFoodConverter _foodConverter;

  final LocalNutritionFactsConverter _nutritionFactsConverter;

  Future<Food?> getById(
    String id, {
    Transaction? txn,
  }) async {
    final foodDbModel = await _dbService.food.getById(id, txn: txn);
    if (foodDbModel != null) {
      final nutritionFactsDbModels =
          await _dbService.nutritionFacts.getByEdible(id, txn: txn);

      return _foodConverter.toModel(
        foodDbModel,
        nutritionFactsDbModels,
      );
    }

    return null;
  }

  Future<String> save(
    Food food, {
    String? id,
    Transaction? txn,
  }) {
    if (txn != null) {
      return _save(food, id: id, txn: txn);
    } else {
      return _dbService.transaction(
        (txn) => _save(food, id: id, txn: txn),
      );
    }
  }

  Future<String> _save(
    Food food, {
    String? id,
    required Transaction txn,
  }) async {
    await _checkForDuplication(food, txn: txn);

    final foodId = id ?? food.id ?? generateId();

    final foodDbModel = _foodConverter.toDbModel(food, foodId);

    if (food.id == null) {
      await _dbService.edible.add(foodDbModel.toEdibleDbModel(), txn: txn);
      await _dbService.food.add(foodDbModel, txn: txn);
    } else {
      await _dbService.edible.update(foodDbModel.toEdibleDbModel(), txn: txn);
    }

    await _dbService.nutritionFacts.saveForEdible(
      food.nutritionFacts
          .map((model) => _nutritionFactsConverter.toDbModel(model, foodId))
          .toList(),
      foodId,
      txn: txn,
    );

    return foodId;
  }

  Future<void> _checkForDuplication(
    Edible model, {
    Transaction? txn,
  }) async {
    final alreadyExists = await _edibleDao.exists(
      model.name,
      model.description,
      exceptWithId: model.id,
      txn: txn,
    );

    if (alreadyExists) {
      throw DuplicationException();
    }
  }
}
