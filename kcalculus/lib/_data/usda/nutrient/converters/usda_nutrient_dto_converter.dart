import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/usda/nutrient/models/usda_nutrient_db_model.dart';
import 'package:kcalculus/_data/usda/nutrient/models/usda_nutrient_dto_model.dart';

class UsdaNutrientDtoConverter extends Notifier<void> {
  @override
  void build() {}

  UsdaNutrientDbModel toDbModel(UsdaNutrientDtoModel dtoModel, int fdcId) {
    return UsdaNutrientDbModel(
      fdc_id: fdcId,
      number: dtoModel.number,
      amount: dtoModel.amount,
      unit_name: dtoModel.unitName,
    );
  }
}

final usdaNutrientDtoConverterProvider =
    NotifierProvider<UsdaNutrientDtoConverter, void>(
  UsdaNutrientDtoConverter.new,
);
