import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/dish/models/ingredient_db_model.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/dish/models/ingredient.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';

class LocalIngredientConverter extends Notifier<void> {
  @override
  void build() {}

  IngredientDbModel toDbModel(
    Ingredient model,
    String dishId, [
    String? edibleId,
    int? sequenceNumber,
  ]) {
    return IngredientDbModel(
      dish_id: dishId,
      edible_id: (edibleId ?? model.edible.id)!,
      amount_unit: model.amount.unit.name,
      amount_value: model.amount.value,
      sequence_number: sequenceNumber,
    );
  }

  Ingredient toModel(IngredientDbModel dbModel, Edible edible) {
    return Ingredient(
      edible: edible,
      amount: Amount(
        unit: Unit.of(dbModel.amount_unit),
        value: dbModel.amount_value,
      ),
    );
  }
}

final localIngredientConverterProvider =
    NotifierProvider<LocalIngredientConverter, void>(
  LocalIngredientConverter.new,
);
