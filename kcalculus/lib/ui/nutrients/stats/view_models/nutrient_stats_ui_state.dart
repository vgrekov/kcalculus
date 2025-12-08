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
    required List<NutrientStatsRow> rows,
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

    return NutrientStatsUiState.$default(
      date: date,
      data: data,
      rows: (data + NutrientData.zeros(defaults))
          .toRows(
            defaults,
            (nutrient, amount, level) => NutrientStatsRow(
              nutrient: nutrient,
              amount: amount,
              level: level,
              goalAmount: goalFor[nutrient],
            ),
          )
          .toList(),
    );
  }
}
