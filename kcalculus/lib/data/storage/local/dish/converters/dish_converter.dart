import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/dish/models/dish_db_model.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/dish/models/ingredient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_ratio.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalDishConverter extends Notifier<void> {
  @override
  void build() {}

  DishDbModel toDbModel(Dish model, [dishId]) {
    final massRatio = model.nutritionRatios[Measure.mass];
    final volumeRatio = model.nutritionRatios[Measure.volume];
    final quantityRatio = model.nutritionRatios[Measure.quantity];

    final nf = model.getNutritionFacts().firstOrNull;

    return DishDbModel(
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
      nf_preview_per_unit: nf?.amount.unit.name,
      nf_preview_per_value: nf?.amount.value,
      nf_preview_calories_unit: Unit.calorie.name,
      nf_preview_calories_value: nf?.nutrientData.calories,
      nf_preview_fat_unit: Unit.gram.name,
      nf_preview_fat_value: nf?.nutrientData.fatInGrams,
      nf_preview_carbs_unit: Unit.gram.name,
      nf_preview_carbs_value: nf?.nutrientData.carbsInGrams,
      nf_preview_protein_unit: Unit.gram.name,
      nf_preview_protein_value: nf?.nutrientData.proteinInGrams,
      nf_preview_fiber_unit: Unit.gram.name,
      nf_preview_fiber_value: nf?.nutrientData.fiberInGrams,
      created_at: model.createdAt != null
          ? dt.formatISO8601(model.createdAt!)
          : null,
      updated_at: model.updatedAt != null
          ? dt.formatISO8601(model.updatedAt!)
          : null,
      last_eaten_at: model.lastEatenAt != null
          ? dt.formatISO8601(model.lastEatenAt!)
          : null,
      deleted_at: model.deletedAt != null
          ? dt.formatISO8601(model.deletedAt!)
          : null,
    );
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
      createdAt: (dbModel.created_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.created_at!)
          : null,
      updatedAt: (dbModel.updated_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.updated_at!)
          : null,
      lastEatenAt: (dbModel.last_eaten_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.last_eaten_at!)
          : null,
      deletedAt: (dbModel.deleted_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.deleted_at!)
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

final localDishConverterProvider = NotifierProvider<LocalDishConverter, void>(
  LocalDishConverter.new,
);
