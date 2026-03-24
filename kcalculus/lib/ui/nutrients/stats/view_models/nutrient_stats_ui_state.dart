import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_goal.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_row.dart';

part 'nutrient_stats_ui_state.freezed.dart';

@freezed
sealed class NutrientStatsUiState with _$NutrientStatsUiState {
  static int Function(Nutrient, Nutrient) _buildComparator(
    NutrientData data,
    List<Nutrient> defaults,
  ) {
    final defaultPositions = {
      for (final pair in defaults.indexed) pair.$2: pair.$1,
    };

    final modelPositions = {
      for (final pair in data.nutrientAmounts.indexed)
        pair.$2.nutrient: pair.$1,
    };

    return (Nutrient a, Nutrient b) {
      int result =
          (defaultPositions[a] ?? defaults.length) -
          (defaultPositions[b] ?? defaults.length);

      if (result == 0) {
        result =
            (modelPositions[a] ?? data.nutrientAmounts.length) -
            (modelPositions[b] ?? data.nutrientAmounts.length);
      }

      return result;
    };
  }

  static NutrientStatsRow _extractHierarchy(
    Nutrient nutrient,
    Map<Nutrient, Amount> goalFor,
    Map<Nutrient, Amount> nutrientAmountsMap,
    int Function(Nutrient, Nutrient) comparator,
  ) {
    final subNutrients =
        nutrientAmountsMap.keys
            .where(
              (n) => n.partOf == nutrient,
            )
            .toList()
          ..sort(comparator);

    return NutrientStatsRow(
      nutrient: nutrient,
      amount:
          nutrientAmountsMap.remove(nutrient) ??
          Amount.zero(unit: nutrient.defaultUnit),
      goalAmount: goalFor[nutrient],
      children: subNutrients
          .map(
            (n) => _extractHierarchy(
              n,
              goalFor,
              nutrientAmountsMap,
              comparator,
            ),
          )
          .toList(),
    );
  }

  const NutrientStatsUiState._();

  const factory NutrientStatsUiState.$default({
    required DateTime date,
    required NutrientData data,
    required NutrientStatsRow energyRow,
    required NutrientStatsRow fatRow,
    required NutrientStatsRow carbsRow,
    required NutrientStatsRow proteinRow,
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

    for (final goalNutrient in goalFor.keys) {
      if (!defaults.contains(goalNutrient)) {
        defaults.add(goalNutrient);
      }
    }

    final correctedData = data + NutrientData.zeros(defaults);

    final comparator = _buildComparator(correctedData, defaults);

    final nutrientAmountsMap = Map.of(correctedData.nutrientAmountsMap);

    return NutrientStatsUiState.$default(
      date: date,
      data: data,
      energyRow: _extractHierarchy(
        Nutrient.energy,
        goalFor,
        nutrientAmountsMap,
        comparator,
      ),
      fatRow: _extractHierarchy(
        Nutrient.fat,
        goalFor,
        nutrientAmountsMap,
        comparator,
      ),
      carbsRow: _extractHierarchy(
        Nutrient.totalCarbs,
        goalFor,
        nutrientAmountsMap,
        comparator,
      ),
      proteinRow: _extractHierarchy(
        Nutrient.protein,
        goalFor,
        nutrientAmountsMap,
        comparator,
      ),
      otherRows:
          nutrientAmountsMap.entries
              .map(
                (e) => NutrientStatsRow(
                  nutrient: e.key,
                  amount: e.value,
                  goalAmount: goalFor[e.key],
                ),
              )
              .toList()
            ..sort(
              (r1, r2) => comparator(r1.nutrient, r2.nutrient),
            ),
    );
  }
}
