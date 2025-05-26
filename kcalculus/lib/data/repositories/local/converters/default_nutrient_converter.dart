import 'package:kcalculus/data/services/local/database/default_nutrient/default_nutrient_db_model.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

class LocalDefaultNutrientConverter {
  List<DefaultNutrientDbModel> toDbModels(List<Nutrient> models) {
    return models.indexed
        .map(
          (pair) => DefaultNutrientDbModel(
            name: pair.$2.name,
            position: pair.$1,
          ),
        )
        .toList();
  }

  List<Nutrient> toModels(List<DefaultNutrientDbModel> dbModels) {
    return (List.of(dbModels)
          ..sort(
            (a, b) => a.position - b.position,
          ))
        .map((dbModel) => Nutrient.of(dbModel.name))
        .toList();
  }
}
