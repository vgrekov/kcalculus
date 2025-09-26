import 'package:kcalculus/_data/storage/local/edible/converters/nutrient_amount_converter.dart';
import 'package:kcalculus/_data/storage/local/edible/converters/nutrition_facts_converter.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalNutritionFactsDao {
  LocalNutritionFactsDao({
    required DatabaseService dbService,
    required LocalNutritionFactsConverter nutritionFactsConverter,
    required LocalNutrientAmountConverter nutrientAmountConverter,
  })  : _dbService = dbService,
        _nutritionFactsConverter = nutritionFactsConverter,
        _nutrientAmountConverter = nutrientAmountConverter;

  final DatabaseService _dbService;

  final LocalNutritionFactsConverter _nutritionFactsConverter;

  final LocalNutrientAmountConverter _nutrientAmountConverter;

  Future<List<NutritionFacts>> getByEdible(
    String edibleId, {
    Transaction? txn,
  }) async {
    return _dbService.nutritionFacts.getByEdible(edibleId, txn: txn).then(
          (data) => Future.wait(
            data.map(
              (dbModel) async {
                final nutritionAmountDbModels =
                    await _dbService.nutrientAmount.getByNutritionFacts(
                  dbModel.id,
                  txn: txn,
                );

                return _nutritionFactsConverter.toModel(
                  dbModel,
                  nutritionAmountDbModels,
                );
              },
            ),
          ),
        );
  }

  Future<void> saveForEdible(
    List<NutritionFacts> nutritionFacts,
    String edibleId, {
    Transaction? txn,
  }) async {
    await Future.wait(
      nutritionFacts.where((model) => model.id != null).map(
            (nf) => _dbService.nutrientAmount.deleteByNutritionFacts(
              nf.id!,
              txn: txn,
            ),
          ),
    );

    final modelIds = {
      for (final model in nutritionFacts) model: model.id ?? generateId()
    };

    final dbModels = nutritionFacts
        .map(
          (model) => _nutritionFactsConverter.toDbModel(
              model, edibleId, modelIds[model]),
        )
        .toList();

    await _dbService.nutritionFacts.saveForEdible(
      dbModels,
      edibleId,
      txn: txn,
    );

    await Future.wait(
      nutritionFacts.map(
        (model) async {
          final nutritionFactsId = modelIds[model]!;

          await _dbService.nutrientAmount.addForNutritionFacts(
            _nutrientAmountConverter.toDbModels(
              model.nutrientData,
              nutritionFactsId,
            ),
            nutritionFactsId,
            txn: txn,
          );
        },
      ),
    );
  }
}
