import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/default_nutrient/models/default_nutrient_db_model.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

class LocalDefaultNutrientConverter extends Notifier<void> {
  @override
  void build() {}

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

final localDefaultNutrientConverterProvider =
    NotifierProvider<LocalDefaultNutrientConverter, void>(
  LocalDefaultNutrientConverter.new,
);
