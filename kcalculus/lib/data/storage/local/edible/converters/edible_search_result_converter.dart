import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/edible/models/edible_search_result_db_model.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts_preview.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalEdibleSearchResultConverter extends Notifier<void> {
  @override
  void build() {}

  EdibleSearchResult toModel(EdibleSearchResultDbModel dbModel) {
    return EdibleSearchResult(
        id: dbModel.id,
        name: dbModel.name,
        description: dbModel.description ?? '',
        type: dbModel.food_id != null
            ? EdibleSearchResultType.food
            : EdibleSearchResultType.dish,
        nutritionFactsPreview: _getNutritionFactsPreview(dbModel),
        lastEatenAt: dbModel.last_eaten_at != null
            ? dt.parseISO8601(dbModel.last_eaten_at!)
            : null);
  }

  NutritionFactsPreview? _getNutritionFactsPreview(
    EdibleSearchResultDbModel dbModel,
  ) {
    final requirdFields = [
      dbModel.nf_preview_per_unit,
      dbModel.nf_preview_per_value,
      dbModel.nf_preview_calories_unit,
      dbModel.nf_preview_calories_value,
      dbModel.nf_preview_fat_unit,
      dbModel.nf_preview_fat_value,
      dbModel.nf_preview_carbs_unit,
      dbModel.nf_preview_carbs_value,
      dbModel.nf_preview_protein_unit,
      dbModel.nf_preview_protein_value,
    ];

    if (requirdFields.any((f) => f == null)) {
      return null;
    }

    return NutritionFactsPreview(
      per: Amount(
        unit: Unit.of(dbModel.nf_preview_per_unit!),
        value: dbModel.nf_preview_per_value!,
      ),
      calories: Amount(
        unit: Unit.of(dbModel.nf_preview_calories_unit!),
        value: dbModel.nf_preview_calories_value!,
      ),
      fat: Amount(
        unit: Unit.of(dbModel.nf_preview_fat_unit!),
        value: dbModel.nf_preview_fat_value!,
      ),
      carbs: Amount(
        unit: Unit.of(dbModel.nf_preview_carbs_unit!),
        value: dbModel.nf_preview_carbs_value!,
      ),
      protein: Amount(
        unit: Unit.of(dbModel.nf_preview_protein_unit!),
        value: dbModel.nf_preview_protein_value!,
      ),
      fiber: (dbModel.nf_preview_fiber_unit == null ||
              dbModel.nf_preview_fiber_value == null)
          ? null
          : Amount(
              unit: Unit.of(dbModel.nf_preview_fiber_unit!),
              value: dbModel.nf_preview_fiber_value!,
            ),
    );
  }
}

final localEdibleSearchResultConverterProvider =
    NotifierProvider<LocalEdibleSearchResultConverter, void>(
  LocalEdibleSearchResultConverter.new,
);
