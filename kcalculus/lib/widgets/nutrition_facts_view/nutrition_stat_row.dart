import 'package:flutter/material.dart';
import 'package:kcalculus/models/units.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutritionStatRow extends StatelessWidget {
  final String labelText;
  final double amountValue;
  final Unit? amountUnit;
  final TextStyle? textStyle;

  const NutritionStatRow({
    super.key,
    required this.labelText,
    required this.amountValue,
    this.amountUnit,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle = this.textStyle ??
        Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            );

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          labelText,
          style: textStyle,
        ),
        const SizedBox(width: 16),
        Text(
          amountUnit != null
              ? l10n(context).statWithUnit(
                  nb.formatDouble(context, amountValue),
                  amountUnit!.localName(context),
                )
              : nb.formatDouble(context, amountValue),
          style: textStyle,
        ),
      ],
    );
  }
}
