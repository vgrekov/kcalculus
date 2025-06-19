import 'package:kcalculus/data/services/usda/food/usda_food_db_model.dart';
import 'package:kcalculus/data/services/usda/food/usda_food_dto_model.dart';
import 'package:kcalculus/utils/string_ext.dart';

class UsdaFoodDtoConverter {
  static final _kDescriptionDelim = RegExp(r'\s*,\s*');

  const UsdaFoodDtoConverter();

  UsdaFoodDbModel toDbModel(UsdaFoodDtoModel dtoModel) {
    final (name, description) = _splitDescription(dtoModel.description);
    return UsdaFoodDbModel(
      fdc_id: dtoModel.fdcId,
      name: name,
      description: description,
      data_type: dtoModel.dataType,
      priority: dtoModel.priority,
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
}
