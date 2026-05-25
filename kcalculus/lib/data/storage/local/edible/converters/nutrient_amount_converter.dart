import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/edible/models/nutrient_amount_db_model.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';

class LocalNutrientAmountConverter extends Notifier<void> {
  @override
  void build() {}

  List<NutrientAmountDbModel> toDbModels(
      NutrientData model, String nutritionFactsId) {
    return model.nutrientAmounts.indexed
        .map(
          (pair) => NutrientAmountDbModel(
            nutrition_facts_id: nutritionFactsId,
            nutrient: pair.$2.nutrient.name,
            amount_unit: pair.$2.amount.unit.name,
            amount_value: pair.$2.amount.value,
            position: pair.$1,
          ),
        )
        .toList();
  }

  NutrientData toModel(List<NutrientAmountDbModel> dbModels) {
    return NutrientData(
      nutrientAmounts: (List.of(dbModels)
            ..sort(
              (a, b) => a.position - b.position,
            ))
          .map(
            (dbModel) => NutrientAmount(
              nutrient: Nutrient.of(dbModel.nutrient),
              amount: Amount(
                unit: Unit.of(dbModel.amount_unit),
                value: dbModel.amount_value,
              ),
            ),
          )
          .toList(),
    );
  }
}

final localNutrientAmountConverterProvider =
    NotifierProvider<LocalNutrientAmountConverter, void>(
  LocalNutrientAmountConverter.new,
);
