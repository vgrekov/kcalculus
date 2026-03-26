import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_row.dart';

part 'nutrient_stats_ui_state.freezed.dart';

@freezed
sealed class NutrientStatsUiState with _$NutrientStatsUiState {
  const factory NutrientStatsUiState.$default({
    required DateTime date,
    required NutrientData data,
    required NutrientStatsRow? energyRow,
    required List<NutrientStatsRow> fatGroup,
    required List<NutrientStatsRow> carbsGroup,
    required List<NutrientStatsRow> proteinGroup,
    required List<NutrientStatsRow> otherRows,
  }) = _NutrientStatsUiState;

  factory NutrientStatsUiState({
    required DateTime date,
    required NutrientData data,
    required List<Nutrient> defaults,
    required List<NutrientGoal> goals,
  }) {
    final goalFor = {
      for (final goal in goals) goal.nutrient: goal.amount,
    };

    defaults = [...defaults];
    for (final nutrient in goalFor.keys) {
      if (!defaults.contains(nutrient)) {
        defaults.add(nutrient);
      }
    }

    final correctedData = data + NutrientData.zeros(defaults);

    final allRows = correctedData.toRows(
      defaults,
      (nutrient, amount, level) => NutrientStatsRow(
        nutrient: nutrient,
        amount: amount,
        goalAmount: goalFor[nutrient],
        level: level,
      ),
    );

    NutrientStatsRow? energyRow;

    final fatGroup = <NutrientStatsRow>[];
    final carbsGroup = <NutrientStatsRow>[];
    final proteinGroup = <NutrientStatsRow>[];
    final otherRows = <NutrientStatsRow>[];

    final groups = {
      Nutrient.fat: fatGroup,
      Nutrient.totalCarbs: carbsGroup,
      Nutrient.protein: proteinGroup,
    };

    NutrientStatsRow? groupRootRow;

    for (final row in allRows) {
      if (row.nutrient == Nutrient.energy) {
        energyRow = row;
        continue;
      }

      if (groups.containsKey(row.nutrient)) {
        groupRootRow = row;
        groups[groupRootRow.nutrient]!.add(row);
        continue;
      }

      if (groupRootRow != null && groupRootRow.level < row.level) {
        groups[groupRootRow.nutrient]!.add(row);
      } else {
        groupRootRow = null;
        otherRows.add(row);
      }
    }

    return NutrientStatsUiState.$default(
      date: date,
      data: data,
      energyRow: energyRow,
      fatGroup: fatGroup,
      carbsGroup: carbsGroup,
      proteinGroup: proteinGroup,
      otherRows: otherRows,
    );
  }
}
