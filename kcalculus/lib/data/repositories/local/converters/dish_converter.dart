import 'package:kcalculus/data/services/local/database/edible/edible_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/domain/models/dish/ingredient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_ratio.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalDishConverter {
  DishDbModel toDbModel(Dish model, [dishId]) {
    final massRatio = model.nutritionRatios[Measure.mass];
    final volumeRatio = model.nutritionRatios[Measure.volume];
    final quantityRatio = model.nutritionRatios[Measure.quantity];

    return EdibleDbModel.dish(
      id: (dishId ?? model.id)!,
      name: model.name,
      description: model.description,
      mass_per_amount_unit: massRatio?.perAmount.unit.name,
      mass_per_amount_value: massRatio?.perAmount.value,
      mass_total_amount_unit: massRatio?.totalAmount.unit.name,
      mass_total_amount_value: massRatio?.totalAmount.value,
      volume_per_amount_unit: volumeRatio?.perAmount.unit.name,
      volume_per_amount_value: volumeRatio?.perAmount.value,
      volume_total_amount_unit: volumeRatio?.totalAmount.unit.name,
      volume_total_amount_value: volumeRatio?.totalAmount.value,
      quantity_per_amount_unit: quantityRatio?.perAmount.unit.name,
      quantity_per_amount_value: quantityRatio?.perAmount.value,
      quantity_total_amount_unit: quantityRatio?.totalAmount.unit.name,
      quantity_total_amount_value: quantityRatio?.totalAmount.value,
    ) as DishDbModel;
  }

  Dish toModel(
    DishDbModel dbModel,
    List<Ingredient> ingredients,
  ) {
    final massRatio = _toNutritionRatio(
      perAmountUnit: dbModel.mass_per_amount_unit,
      perAmountValue: dbModel.mass_per_amount_value,
      totalAmountUnit: dbModel.mass_total_amount_unit,
      totalAmountValue: dbModel.mass_total_amount_value,
    );
    final volumeRatio = _toNutritionRatio(
      perAmountUnit: dbModel.volume_per_amount_unit,
      perAmountValue: dbModel.volume_per_amount_value,
      totalAmountUnit: dbModel.volume_total_amount_unit,
      totalAmountValue: dbModel.volume_total_amount_value,
    );
    final quantityRatio = _toNutritionRatio(
      perAmountUnit: dbModel.quantity_per_amount_unit,
      perAmountValue: dbModel.quantity_per_amount_value,
      totalAmountUnit: dbModel.quantity_total_amount_unit,
      totalAmountValue: dbModel.quantity_total_amount_value,
    );

    return Dish(
      id: dbModel.id,
      name: dbModel.name,
      description: dbModel.description ?? '',
      ingredients: ingredients,
      nutritionRatios: {
        if (massRatio != null) Measure.mass: massRatio,
        if (volumeRatio != null) Measure.volume: volumeRatio,
        if (quantityRatio != null) Measure.quantity: quantityRatio,
      },
      createdAt: dbModel.created_at != null
          ? dt.parseISO8601(dbModel.created_at!)
          : null,
      updatedAt: dbModel.updated_at != null
          ? dt.parseISO8601(dbModel.updated_at!)
          : null,
    );
  }

  NutritionRatio? _toNutritionRatio({
    required String? perAmountUnit,
    required double? perAmountValue,
    required String? totalAmountUnit,
    required double? totalAmountValue,
  }) {
    if (perAmountValue != null &&
        perAmountUnit != null &&
        totalAmountValue != null &&
        totalAmountUnit != null) {
      return NutritionRatio(
        perAmount: Amount(
          unit: Unit.of(perAmountUnit),
          value: perAmountValue,
        ),
        totalAmount: Amount(
          unit: Unit.of(totalAmountUnit),
          value: totalAmountValue,
        ),
      );
    }

    return null;
  }
}
