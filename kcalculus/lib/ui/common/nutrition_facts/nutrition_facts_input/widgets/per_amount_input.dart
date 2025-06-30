import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_input_view_model.dart';
import 'package:kcalculus/ui/common/nutrition_facts/nutrition_facts_input/view_models/nutrition_facts_input_view_model_arg.dart';
import 'package:kcalculus/ui/common/widgets/amount_input/amount_input.dart';
import 'package:kcalculus/utils/l10n.dart';

class PerAmountInput extends ConsumerWidget {
  const PerAmountInput({
    super.key,
    required this.viewModelArg,
    required this.controller,
    required this.onPrevRecord,
    required this.onNextRecord,
    this.focusNode,
    this.onFieldSubmitted,
    this.onUserInteractionChange,
  });

  final NutritionFactsInputViewModelArg viewModelArg;

  final AmountInputController controller;

  final void Function() onPrevRecord;

  final void Function() onNextRecord;

  final FocusNode? focusNode;

  final void Function(String)? onFieldSubmitted;

  final void Function()? onUserInteractionChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(
      nutritionFactsInputViewModel(viewModelArg).select(
        (state) => (
          state.recordStates.length,
          state.selectedRecordIndex,
        ),
      ),
    );

    final uiState = ref.read(
      nutritionFactsInputViewModel(viewModelArg),
    );

    final recordsCount = uiState.recordStates.length;
    final selectedRecordIndex = uiState.selectedRecordIndex;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 40,
              child: FittedBox(
                fit: BoxFit.cover,
                child: IconButton(
                  onPressed: selectedRecordIndex <= 0 ? null : onPrevRecord,
                  icon: const Icon(Icons.arrow_back_ios_new),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
            Expanded(
              child: AmountInput(
                controller: controller,
                focusNode: focusNode,
                label: '${l10n(context).labelPer} *',
                allowZero: false,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: onFieldSubmitted,
                onUserInteractionChange: onUserInteractionChange,
              ),
            ),
            SizedBox(
              width: 40,
              child: FittedBox(
                fit: BoxFit.cover,
                child: IconButton(
                  onPressed: selectedRecordIndex >= recordsCount - 1
                      ? null
                      : onNextRecord,
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          l10n(context).mOfN(selectedRecordIndex + 1, recordsCount),
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
      ],
    );
  }
}
