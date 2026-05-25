import 'package:flutter/material.dart';
import 'package:kcalculus/domain/nutrition/models/macro_split.dart';
import 'package:kcalculus/ui/common/macro_split_view/widgets/macro_split_chart.dart';
import 'package:kcalculus/ui/common/macro_split_view/widgets/macro_split_percentage.dart';

class MacroSplitView extends StatelessWidget {
  const MacroSplitView({
    super.key,
    required this.macroSplit,
  });

  final MacroSplit macroSplit;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MacroSplitChart(macroSplit: macroSplit),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: MacroSplitPercentage(macroSplit: macroSplit),
        ),
      ],
    );
  }
}
