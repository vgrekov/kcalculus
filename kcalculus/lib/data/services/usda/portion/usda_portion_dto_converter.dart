import 'package:kcalculus/data/services/usda/portion/usda_portion_db_model.dart';
import 'package:kcalculus/data/services/usda/portion/usda_portion_dto_model.dart';

class UsdaPortionDtoConverter {
  const UsdaPortionDtoConverter();

  UsdaPortionDbModel toDbModel(UsdaPortionDtoModel dtoModel, int fdcId) {
    return UsdaPortionDbModel(
      fdc_id: fdcId,
      measure_unit_id: dtoModel.measureUnitId,
      amount: dtoModel.amount,
      gram_weight: dtoModel.gramWeight,
    );
  }
}
