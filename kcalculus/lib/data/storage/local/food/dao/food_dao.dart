import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/data/storage/local/edible/dao/edible_dao.dart';
import 'package:kcalculus/data/storage/local/edible/dao/nutrition_facts_dao.dart';
import 'package:kcalculus/data/storage/local/edible/services/edible_service.dart';
import 'package:kcalculus/data/storage/local/food/converters/food_converter.dart';
import 'package:kcalculus/data/storage/local/food/services/food_service.dart';
import 'package:kcalculus/domain/exceptions/duplication_exception.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalFoodDao extends Notifier<void> {
  @override
  void build() {}

  LocalEdibleService get _edibleService =>
      ref.read(localEdibleServiceProvider.notifier);

  LocalFoodService get _foodService =>
      ref.read(localFoodServiceProvider.notifier);

  LocalEdibleDao get _edibleDao => ref.read(localEdibleDaoProvider.notifier);

  LocalNutritionFactsDao get _nutritionFactsDao =>
      ref.read(localNutritionFactsDaoProvider.notifier);

  LocalFoodConverter get _foodConverter =>
      ref.read(localFoodConverterProvider.notifier);

  Future<Food?> getById(
    String id, {
    Transaction? txn,
  }) async {
    final foodDbModel = await _foodService.getById(id, txn: txn);
    if (foodDbModel != null) {
      final nutritionFacts = await _nutritionFactsDao.getByEdible(id, txn: txn);

      return _foodConverter.toModel(
        foodDbModel,
        nutritionFacts,
      );
    }

    return null;
  }

  Future<String> save(
    Food food, {
    String? id,
    Transaction? txn,
    bool skipAudit = false,
  }) async {
    if (txn != null) {
      return _save(
        food,
        id: id,
        txn: txn,
        skipAudit: skipAudit,
      );
    } else {
      final db = await ref.read(localStorageServiceProvider.future);

      return db.transaction(
        (txn) => _save(
          food,
          id: id,
          txn: txn,
          skipAudit: skipAudit,
        ),
      );
    }
  }

  Future<String> _save(
    Food food, {
    String? id,
    required Transaction txn,
    bool skipAudit = false,
  }) async {
    await _checkForDuplication(food, txn: txn);

    final foodId = id ?? food.id ?? generateId();

    final foodDbModel = _foodConverter.toDbModel(food, foodId);

    if (food.id == null) {
      await _edibleService.add(foodDbModel.toEdibleDbModel(), txn: txn);
      await _foodService.add(foodDbModel, txn: txn);
    } else {
      await _edibleService.update(
        foodDbModel.toEdibleDbModel(),
        txn: txn,
        skipAudit: skipAudit,
      );
    }

    await _nutritionFactsDao.saveForEdible(
      food.nutritionFacts,
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

final localFoodDaoProvider = NotifierProvider<LocalFoodDao, void>(
  LocalFoodDao.new,
);
