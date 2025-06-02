import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_view/view_models/nutrition_facts_view_view_model.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_view/view_models/nutrition_facts_view_view_model_arg.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_view/widgets/nutrition_stat_row.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_view/widgets/per_amount_chip.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutritionFactsView extends ConsumerWidget {
  NutritionFactsView({
    super.key,
    required this.nutritionFacts,
    required this.nutrientDefaults,
  }) : viewModelArg = NutritionFactsViewViewModelArg(
          nutritionFacts: nutritionFacts,
          nutrientDefaults: nutrientDefaults,
        );

  final List<NutritionFacts> nutritionFacts;

  final List<Nutrient> nutrientDefaults;

  final NutritionFactsViewViewModelArg viewModelArg;

  void _selectRecord(WidgetRef ref, int recordIndex) {
    ref
        .read(nutritionFactsViewViewModel(viewModelArg).notifier)
        .selectRecord(recordIndex);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiState = ref.watch(nutritionFactsViewViewModel(viewModelArg));

    if (uiState.records.isEmpty) {
      return SizedBox.shrink();
    }

    final selectedRecord = uiState.selectedRecord!;

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
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            ...uiState.records.indexed.map(
              (p) => PerAmountChip(
                amount: p.$2.perAmount,
                selected: p.$1 == uiState.selectedRecordIndex,
                onSelected: () {
                  _selectRecord(ref, p.$1);
                },
              ),
            )
          ],
        ),
        ...selectedRecord.nodes
            .map(
              (node) => [
                if (node.level == 0)
                  Divider(
                    height: 24,
                    thickness: 4,
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0 * node.level),
                  child: NutritionStatRow(
                    labelText: node.nutrient.localName(l10n(context)),
                    amountUnit: node.nutrient == Nutrient.energy
                        ? null
                        : node.amount.unit,
                    amountValue: node.amount.value,
                    textStyle: switch (node.level) {
                      0 => Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                      1 => Theme.of(context).textTheme.titleMedium!.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                      _ => Theme.of(context).textTheme.titleSmall!.copyWith(
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                    },
                  ),
                ),
              ],
            )
            .expand((p) => p),
      ],
    );
  }
}
