import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_view/view_models/nutrition_facts_record.dart';

part 'nutrition_facts_view_ui_state.freezed.dart';

@freezed
sealed class NutritionFactsViewUiState with _$NutritionFactsViewUiState {
  const NutritionFactsViewUiState._();

  const factory NutritionFactsViewUiState({
    required List<NutritionFactsRecord> records,
    required int selectedRecordIndex,
  }) = _NutritionFactsViewUiState;

  factory NutritionFactsViewUiState.fromModels({
    required List<NutritionFacts> models,
    required List<Nutrient> nutrientDefaults,
  }) {
    return NutritionFactsViewUiState(
      records: models
          .map(
            (model) => NutritionFactsRecord.fromModel(
              model: model,
              nutrientDefaults: nutrientDefaults,
            ),
          )
          .toList(),
      selectedRecordIndex: models.isNotEmpty ? 0 : -1,
    );
  }

  NutritionFactsRecord? get selectedRecord {
    return (selectedRecordIndex >= 0 && selectedRecordIndex < records.length)
        ? records[selectedRecordIndex]
        : null;
  }
}
