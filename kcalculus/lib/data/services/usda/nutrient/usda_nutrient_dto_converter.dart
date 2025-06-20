import 'package:kcalculus/data/services/usda/nutrient/usda_nutrient_db_model.dart';
import 'package:kcalculus/data/services/usda/nutrient/usda_nutrient_dto_model.dart';

class UsdaNutrientDtoConverter {
  const UsdaNutrientDtoConverter();

  UsdaNutrientDbModel toDbModel(UsdaNutrientDtoModel dtoModel, int fdcId) {
    return UsdaNutrientDbModel(
      fdc_id: fdcId,
      number: dtoModel.number,
      amount: dtoModel.amount,
      unit_name: dtoModel.unitName,
    );
  }
}
