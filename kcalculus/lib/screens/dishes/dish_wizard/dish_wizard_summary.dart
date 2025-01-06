import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dish_wizard.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/widgets/nutrition_facts_input.dart';

class DishWizardSummaryPage extends ConsumerWidget implements DishWizardPage {
  const DishWizardSummaryPage({super.key});

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
    final wizardState = ref.watch(dishWizardProvider).data;

    if (!wizardState.validate().containsValue(false)) {
      final dish = wizardState.toDish();

      return Padding(
        padding: const EdgeInsets.all(16),
        child: NutritionFactsInput(
          controller: NutritionFactsInputController(
            nutritionFacts: dish.getNutritionFacts(),
          ),
          enabled: false,
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
