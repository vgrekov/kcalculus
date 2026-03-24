import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/ui/common/macro_split_view/widgets/macro_split_view.dart';
import 'package:kcalculus/ui/common/themes/list_style.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_view_model.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_view_model_arg.dart';
import 'package:kcalculus/ui/nutrients/stats/widgets/nutrient_stats_group_tile.dart';
import 'package:kcalculus/ui/nutrients/stats/widgets/nutrient_stats_main_tile.dart';
import 'package:kcalculus/ui/nutrients/stats/widgets/nutrient_stats_others_tile.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:kcalculus/utils/l10n.dart';
import 'package:logging/logging.dart';

final _log = Logger('NutrientStatsScreen');

class NutrientStatsScreen extends ConsumerWidget {
  NutrientStatsScreen({
    super.key,
    required this.date,
    required this.data,
  }) : viewModelArg = NutrientStatsViewModelArg(
         date: date,
         data: data,
       );

  final DateTime date;

  final NutrientData data;

  final NutrientStatsViewModelArg viewModelArg;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uiStateAsync = ref.watch(nutrientStatsViewModel(viewModelArg));

    final listStyle = Theme.of(context).extension<ListStyle>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              l10n(context).screenDailyStats,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              uiStateAsync.whenOrNull(
                    data: (uiState) =>
                        dt.formatDateLocal(context, uiState.date),
                  ) ??
                  '',
              style: Theme.of(context).textTheme.labelSmall!.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: uiStateAsync.when(
          data: (uiState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    NutrientStatsMainTile(
                      row: uiState.energyRow,
                    ),
                    SizedBox(height: listStyle?.verticalGap),
                    NutrientStatsGroupTile(row: uiState.fatRow),
                    SizedBox(height: listStyle?.verticalGap),
                    NutrientStatsGroupTile(row: uiState.carbsRow),
                    SizedBox(height: listStyle?.verticalGap),
                    NutrientStatsGroupTile(row: uiState.proteinRow),
                    SizedBox(height: listStyle?.verticalGap),
                    NutrientStatsOthersTile(rows: uiState.otherRows),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) {
            _log.severe('Failed to load daily stats', error, stackTrace);

            return Center(
              child: Text(
                l10n(context).messageUnknownError,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            );
          },
          loading: () => const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
      bottomNavigationBar: uiStateAsync.whenOrNull(
        data: (uiState) {
          final macroSplit = uiState.data.getMacroSplit();

          if (macroSplit != null) {
            return Container(
              padding: const EdgeInsets.only(
                top: 16,
                left: 20,
                right: 20,
              ),
              color: Theme.of(context).colorScheme.surfaceContainer,
              child: SafeArea(
                child: MacroSplitView(
                  macroSplit: macroSplit,
                ),
              ),
            );
          }

          return null;
        },
      ),
    );
  }
}
