import 'package:flutter/material.dart';
import 'package:kcalculus/domain/import/models/import_report.dart';
import 'package:kcalculus/ui/import/widgets/import_progress_view.dart';
import 'package:kcalculus/utils/l10n.dart';

class ImportReportView extends StatelessWidget {
  const ImportReportView({
    super.key,
    required this.report,
  });

  final ImportReport report;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ImportProgressView(
          label: l10n(context).labelFoods,
          progress: report.foods,
        ),
        const SizedBox(height: 8),
        ImportProgressView(
          label: l10n(context).labelDishes,
          progress: report.dishes,
        ),
        const SizedBox(height: 8),
        ImportProgressView(
          label: l10n(context).labelMeals,
          progress: report.meals,
        ),
        const SizedBox(height: 8),
        ImportProgressView(
          label: l10n(context).labelContainers,
          progress: report.containers,
        ),
        const SizedBox(height: 8),
        ImportProgressView(
          label: l10n(context).labelDefaultNutrients,
          progress: report.defaultNutrients,
        ),
        const SizedBox(height: 8),
        ImportProgressView(
          label: l10n(context).labelNutrientGoals,
          progress: report.nutrientGoals,
        ),
        const SizedBox(height: 8),
        ImportProgressView(
          label: l10n(context).labelSettings,
          progress: report.settings,
        ),
      ],
    );
  }
}
