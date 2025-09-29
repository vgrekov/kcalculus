import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/meal/models/meal_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/meal.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalMealConverter extends Notifier<void> {
  @override
  void build() {}

  MealDbModel toDbModel(
    Meal model, {
    String? mealId,
    String? edibleId,
  }) {
    return MealDbModel(
      id: (mealId ?? model.id)!,
      edible_id: (edibleId ?? model.edible.id)!,
      amount_unit: model.amount.unit.name,
      amount_value: model.amount.value,
      eaten_at: dt.formatISO8601(model.eatenAt),
    );
  }

  Meal toModel(MealDbModel dbModel, Edible edible) {
    return Meal(
      id: dbModel.id,
      edible: edible,
      amount: Amount(
        unit: Unit.of(dbModel.amount_unit),
        value: dbModel.amount_value,
      ),
      eatenAt: dt.parseISO8601(dbModel.eaten_at),
    );
  }
}

final localMealConverterProvider = NotifierProvider<LocalMealConverter, void>(
  LocalMealConverter.new,
);
