import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/local/edible/converters/nutrient_amount_converter.dart';
import 'package:kcalculus/_data/storage/local/edible/converters/nutrition_facts_converter.dart';
import 'package:kcalculus/_data/storage/local/edible/services/nutrient_amount_service.dart';
import 'package:kcalculus/_data/storage/local/edible/services/nutrition_facts_service.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalNutritionFactsDao extends Notifier<void> {
  @override
  void build() {}

  LocalNutritionFactsService get _nutritionFactsService =>
      ref.read(localNutritionFactsServiceProvider.notifier);

  LocalNutritionFactsConverter get _nutritionFactsConverter =>
      ref.read(localNutritionFactsConverterProvider.notifier);

  LocalNutrientAmountService get _nutrientAmountService =>
      ref.read(localNutrientAmountServiceProvider.notifier);

  LocalNutrientAmountConverter get _nutrientAmountConverter =>
      ref.read(localNutrientAmountConverterProvider.notifier);

  Future<List<NutritionFacts>> getByEdible(
    String edibleId, {
    Transaction? txn,
  }) async {
    return _nutritionFactsService.getByEdible(edibleId, txn: txn).then(
          (data) => Future.wait(
            data.map(
              (dbModel) async {
                final nutritionAmountDbModels =
                    await _nutrientAmountService.getByNutritionFacts(
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
            (nf) => _nutrientAmountService.deleteByNutritionFacts(
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

    await _nutritionFactsService.saveForEdible(
      dbModels,
      edibleId,
      txn: txn,
    );

    await Future.wait(
      nutritionFacts.map(
        (model) async {
          final nutritionFactsId = modelIds[model]!;

          await _nutrientAmountService.addForNutritionFacts(
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

final localNutritionFactsDaoProvider =
    NotifierProvider<LocalNutritionFactsDao, void>(
  LocalNutritionFactsDao.new,
);
