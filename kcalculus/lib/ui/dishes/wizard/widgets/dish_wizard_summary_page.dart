import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/dish/dish.dart';
import 'package:kcalculus/ui/common/widgets/nutrition_facts_view/nutrition_facts_view.dart';
import 'package:kcalculus/ui/dishes/wizard/view_models/dish_wizard_view_model.dart';
import 'package:kcalculus/ui/dishes/wizard/widgets/dish_wizard_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

class DishWizardSummaryPage extends ConsumerWidget implements DishWizardPage {
  const DishWizardSummaryPage({
    super.key,
    this.dish,
  });

  final Dish? dish;

  @override
  bool validate(BuildContext context, WidgetRef ref) {
    return true;
  }

  @override
  void save(BuildContext context, WidgetRef ref) {}

  @override
  ScaffoldConfig? buildScaffoldConfig(BuildContext context, WidgetRef ref) {
    return ScaffoldConfig(
      subtitle: l10n(context).dishWizardPageSummary,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(dishWizardViewModel(dish));

    if (!uiState.validate().containsValue(false)) {
      final dish = uiState.toDish();

      return Padding(
        padding: const EdgeInsets.only(
          bottom: 16,
          left: 16,
          right: 16,
          top: 32,
        ),
        child: NutritionFactsView(
          nutritionFacts: dish.getNutritionFacts(),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
