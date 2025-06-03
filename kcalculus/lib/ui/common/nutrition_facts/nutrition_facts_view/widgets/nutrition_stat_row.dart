import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/utils/nutrient_style.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class NutritionStatRow extends StatelessWidget {
  const NutritionStatRow({
    super.key,
    required this.nutrient,
    required this.amountValue,
    this.amountUnit,
  });

  final Nutrient nutrient;

  final double amountValue;

  final Unit? amountUnit;

  @override
  Widget build(BuildContext context) {
    final textStyle = textStyleOf(
      context,
      nutrient,
      baseColor: Theme.of(context).colorScheme.onSurface,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            nutrient.localName(l10n(context)),
            style: textStyle,
          ),
          const SizedBox(width: 8),
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
      ),
    );
  }
}
