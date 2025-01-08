import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/screens/dishes/dish_wizard/dish_wizard.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/widgets/nutrition_facts_input.dart';

class DishWizardSummaryPage extends ConsumerStatefulWidget {
  const DishWizardSummaryPage({super.key});

  @override
  ConsumerState<DishWizardSummaryPage> createState() {
    return _DishWizardSummaryPagePageState();
  }
}

class _DishWizardSummaryPagePageState
    extends ConsumerState<DishWizardSummaryPage> implements DishWizardPage {
  final _nfController = NutritionFactsInputController();

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
  Widget build(BuildContext context) {
    final wizardState = ref.watch(dishWizardProvider).data;

    if (!wizardState.validate().containsValue(false)) {
      final dish = wizardState.toDish();

      _nfController.nutritionFacts = dish.getNutritionFacts();

      return Padding(
        padding: const EdgeInsets.all(16),
        child: NutritionFactsInput(
          controller: _nfController,
          enabled: false,
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
