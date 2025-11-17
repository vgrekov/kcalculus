import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/usda/food/models/usda_food_db_model.dart';
import 'package:kcalculus/data/usda/food/models/usda_food_dto_model.dart';
import 'package:kcalculus/data/usda/nutrient/models/usda_nutrient_db_model.dart';
import 'package:kcalculus/data/usda/nutrient/models/usda_nutrient_dto_model.dart';
import 'package:kcalculus/utils/double_ext.dart';
import 'package:kcalculus/utils/string_ext.dart';

class UsdaFoodDtoConverter extends Notifier<void> {
  static final _kDescriptionDelim = RegExp(r'\s*,\s*');

  @override
  void build() {}

  UsdaFoodDbModel toDbModel(UsdaFoodDtoModel dtoModel) {
    final (name, description) = _splitDescription(dtoModel.description);

    final calories = _getNutrientByNumbers(
      dtoModel.nutrients,
      UsdaNutrientDbModel.kEnergyNutrientNumbers,
    );
    final fat = _getNutrientByNumbers(
      dtoModel.nutrients,
      [UsdaNutrientDbModel.kFatNutrientNumber],
    );
    final carbs = _getNutrientByNumbers(
      dtoModel.nutrients,
      [UsdaNutrientDbModel.kCarbsNutrientNumber],
    );
    final protein = _getNutrientByNumbers(
      dtoModel.nutrients,
      [UsdaNutrientDbModel.kProteinNutrientNumber],
    );
    final fiber = _getNutrientByNumbers(
      dtoModel.nutrients,
      [UsdaNutrientDbModel.kFiberNutrientNumber],
    );

    return UsdaFoodDbModel(
      fdc_id: dtoModel.fdcId,
      name: name,
      description: description,
      data_type: dtoModel.dataType,
      priority: dtoModel.priority,
      nf_preview_calories_unit: calories?.unitName,
      nf_preview_calories_value: calories?.amount.atLeast(0),
      nf_preview_fat_unit: fat?.unitName,
      nf_preview_fat_value: fat?.amount.atLeast(0),
      nf_preview_carbs_unit: carbs?.unitName,
      nf_preview_carbs_value: carbs?.amount.atLeast(0),
      nf_preview_protein_unit: protein?.unitName,
      nf_preview_protein_value: protein?.amount.atLeast(0),
      nf_preview_fiber_unit: fiber?.unitName,
      nf_preview_fiber_value: fiber?.amount.atLeast(0),
    );
  }

  (String, String) _splitDescription(String description) {
    final chunks = description
        .trim()
        .split(_kDescriptionDelim)
        .where((c) => c.isNotEmpty)
        .toList();
    return (
      chunks.firstOrNull?.capitalize() ?? '',
      chunks.isEmpty ? '' : chunks.sublist(1).join(', ').capitalize(),
    );
  }

  UsdaNutrientDtoModel? _getNutrientByNumbers(
    List<UsdaNutrientDtoModel> nutrientDtos,
    List<String> numbersPrioritized,
  ) {
    return (nutrientDtos
            .where(
              (n) =>
                  numbersPrioritized.contains(n.number) &&
                  UsdaNutrientDbModel.kUnitNames.contains(n.unitName),
            )
            .toList()
          ..sort(
            (a, b) =>
                numbersPrioritized.indexOf(a.number) -
                numbersPrioritized.indexOf(b.number),
          ))
        .firstOrNull;
  }
}

final usdaFoodDtoConverterProvider =
    NotifierProvider<UsdaFoodDtoConverter, void>(
  UsdaFoodDtoConverter.new,
);
