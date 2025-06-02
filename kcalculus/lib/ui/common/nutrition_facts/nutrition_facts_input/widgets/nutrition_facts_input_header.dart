import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_input_view_model.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_input_view_model_arg.dart';
import 'package:kcalculus/utils/l10n.dart';

class NutritionFactsInputHeader extends ConsumerWidget {
  const NutritionFactsInputHeader(
      {super.key,
      required this.viewModelArg,
      this.onAddRecord,
      this.onDeleteRecord});

  final NutritionFactsInputViewModelArg viewModelArg;

  final void Function()? onAddRecord;

  final void Function()? onDeleteRecord;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (
      recordsCount,
      selectedRecordIndex,
    ) = ref.watch(
      nutritionFactsInputViewModel(viewModelArg).select(
        (state) => (
          state.recordStates.length,
          state.selectedRecordIndex,
        ),
      ),
    );

    final isLastRecord = selectedRecordIndex == recordsCount - 1;
    final isDeletable = recordsCount > 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: !isDeletable ? null : onDeleteRecord,
          icon: const Icon(Icons.remove),
          color: Theme.of(context).colorScheme.secondary,
          iconSize: 24,
        ),
        Text(
          l10n(context).titleNutritionFacts,
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
        IconButton(
          onPressed: !isLastRecord ? null : onAddRecord,
          icon: const Icon(Icons.add),
          color: Theme.of(context).colorScheme.secondary,
          iconSize: 24,
        ),
      ],
    );
  }
}
