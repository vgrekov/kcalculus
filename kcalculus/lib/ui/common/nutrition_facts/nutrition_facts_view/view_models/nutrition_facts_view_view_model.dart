import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_view/view_models/nutrition_facts_view_ui_state.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_view/view_models/nutrition_facts_view_view_model_arg.dart';

class NutritionFactsViewViewModel extends AutoDisposeFamilyNotifier<
    NutritionFactsViewUiState, NutritionFactsViewViewModelArg> {
  @override
  NutritionFactsViewUiState build(NutritionFactsViewViewModelArg arg) {
    return NutritionFactsViewUiState.fromModels(
      models: arg.nutritionFacts,
      nutrientDefaults: arg.nutrientDefaults,
    );
  }

  void selectRecord(int recordIndex) {
    state = state.copyWith(selectedRecordIndex: recordIndex);
  }
}

final nutritionFactsViewViewModel = NotifierProvider.family.autoDispose<
    NutritionFactsViewViewModel,
    NutritionFactsViewUiState,
    NutritionFactsViewViewModelArg>(
  NutritionFactsViewViewModel.new,
);
