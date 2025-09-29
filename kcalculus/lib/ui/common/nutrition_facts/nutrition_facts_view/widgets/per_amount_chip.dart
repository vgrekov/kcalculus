import 'package:flutter/material.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class PerAmountChip extends StatelessWidget {
  final Amount amount;
  final bool selected;
  final void Function() onSelected;

  const PerAmountChip({
    super.key,
    required this.amount,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(
        l10n(context).statWithUnit(
          nb.formatDouble(context, amount.value),
          amount.unit.localName(context),
        ),
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      color: WidgetStateProperty.resolveWith(
          (states) => Theme.of(context).colorScheme.surface),
      selected: selected,
      side: WidgetStateBorderSide.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return BorderSide(
            color: Theme.of(context).colorScheme.onSurface,
          );
        }

        return BorderSide.none;
      }),
      showCheckmark: false,
      onSelected: (value) {
        onSelected();
      },
    );
  }
}
