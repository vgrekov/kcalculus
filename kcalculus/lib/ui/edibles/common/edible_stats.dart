import 'package:flutter/material.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts_preview.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/ui/common/macro_split_view/widgets/macro_split_percentage.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/utils/number.dart' as nb;

class EdibleStats extends StatelessWidget {
  const EdibleStats({
    super.key,
    required this.nutritionFactsPreview,
  });

  final NutritionFactsPreview nutritionFactsPreview;

  @override
  Widget build(BuildContext context) {
    final macroSplit = nutritionFactsPreview.getMacroSplit();
    final fiberInGrams =
        nutritionFactsPreview.fiber?.tryConvert(Unit.gram)?.value;

    return (macroSplit == null && fiberInGrams == null)
        ? const SizedBox.shrink()
        : Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
              height: 16,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (macroSplit != null)
                    MacroSplitPercentage(macroSplit: macroSplit),
                  const Spacer(),
                  if (fiberInGrams != null)
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        l10n(context).statFiber(
                          nb.formatDouble(
                            context,
                            fiberInGrams,
                          ),
                        ),
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          );
  }
}
