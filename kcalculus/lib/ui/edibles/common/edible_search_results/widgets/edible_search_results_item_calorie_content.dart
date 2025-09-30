import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts_preview.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class EdibleSearchResultsItemCalorieContent extends StatelessWidget {
  const EdibleSearchResultsItemCalorieContent({
    super.key,
    required this.nutritionFactsPreview,
  });

  final NutritionFactsPreview nutritionFactsPreview;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          l10n(context).statWithUnit(
            nb.formatDouble(context, nutritionFactsPreview.calories.value),
            nutritionFactsPreview.calories.unit.localName(l10n(context)),
          ),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Text(
          l10n(context).perAmount(
            nb.formatDouble(context, nutritionFactsPreview.per.value),
            nutritionFactsPreview.per.unit.localName(l10n(context)),
          ),
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
        ),
      ],
    );
  }
}
