import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/usda/portion/models/usda_portion_db_model.dart';
import 'package:kcalculus/data/usda/portion/models/usda_portion_dto_model.dart';

class UsdaPortionDtoConverter extends Notifier<void> {
  @override
  void build() {}

  UsdaPortionDbModel toDbModel(UsdaPortionDtoModel dtoModel, int fdcId) {
    return UsdaPortionDbModel(
      fdc_id: fdcId,
      measure_unit_id: dtoModel.measureUnitId,
      amount: dtoModel.amount,
      gram_weight: dtoModel.gramWeight,
    );
  }
}

final usdaPortionDtoConverterProvider =
    NotifierProvider<UsdaPortionDtoConverter, void>(
  UsdaPortionDtoConverter.new,
);
