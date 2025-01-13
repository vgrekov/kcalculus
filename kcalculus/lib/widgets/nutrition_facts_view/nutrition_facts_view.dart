import 'package:flutter/material.dart';
import 'package:kcalculus/models/nutrition.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/widgets/nutrition_facts_view/nutrition_stat_row.dart';
import 'package:kcalculus/widgets/nutrition_facts_view/per_amount_chip.dart';

class NutritionFactsView extends StatefulWidget {
  final List<NutritionFacts> nutritionFacts;

  const NutritionFactsView({
    super.key,
    required this.nutritionFacts,
  });

  @override
  State<StatefulWidget> createState() {
    return _NutritionFactsViewState();
  }
}

class _NutritionFactsViewState extends State<NutritionFactsView> {
  int _nutritionFactsIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.nutritionFacts.isEmpty) {
      return SizedBox.shrink();
    }

    final nf = widget.nutritionFacts[_nutritionFactsIndex];

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            Text(
              l10n(context).labelPer,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
            ...widget.nutritionFacts.indexed.map(
              (p) => PerAmountChip(
                amount: p.$2.amount,
                selected: p.$1 == _nutritionFactsIndex,
                onSelected: () {
                  setState(() {
                    _nutritionFactsIndex = p.$1;
                  });
                },
              ),
            )
          ],
        ),
        Divider(
          height: 24,
          thickness: 4,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryContainer
              .withOpacity(0.75),
        ),
        NutritionStatRow(
          labelText: l10n(context).labelCalories,
          amountValue: nf.nutrientData.calories,
          textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        Divider(
          height: 20,
          thickness: 8,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryContainer
              .withOpacity(0.75),
        ),
        NutritionStatRow(
          labelText: l10n(context).labelFat,
          amountValue: nf.nutrientData.fatInGrams,
          amountUnit: Unit.gram,
        ),
        Divider(
          height: 16,
          thickness: 2,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryContainer
              .withOpacity(0.75),
        ),
        NutritionStatRow(
          labelText: l10n(context).labelCarbs,
          amountValue: nf.nutrientData.carbsInGrams,
          amountUnit: Unit.gram,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: NutritionStatRow(
            labelText: l10n(context).labelFiber,
            amountValue: nf.nutrientData.fiberInGrams,
            amountUnit: Unit.gram,
            textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),
        ),
        Divider(
          height: 16,
          thickness: 2,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryContainer
              .withOpacity(0.75),
        ),
        NutritionStatRow(
          labelText: l10n(context).labelProtein,
          amountValue: nf.nutrientData.proteinInGrams,
          amountUnit: Unit.gram,
        ),
      ],
    );
  }
}
