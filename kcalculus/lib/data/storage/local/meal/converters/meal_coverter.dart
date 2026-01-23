import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/meal/models/meal_db_model.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';
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
      created_at: model.createdAt == null
          ? null
          : dt.formatISO8601(model.createdAt!),
      updated_at: model.updatedAt == null
          ? null
          : dt.formatISO8601(model.updatedAt!),
      deleted_at: model.deletedAt == null
          ? null
          : dt.formatISO8601(model.deletedAt!),
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
      createdAt: (dbModel.created_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.created_at!)
          : null,
      updatedAt: (dbModel.updated_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.updated_at!)
          : null,
      deletedAt: (dbModel.deleted_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.deleted_at!)
          : null,
    );
  }
}

final localMealConverterProvider = NotifierProvider<LocalMealConverter, void>(
  LocalMealConverter.new,
);
