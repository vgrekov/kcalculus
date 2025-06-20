import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

part 'nutrient_stats_row.freezed.dart';

@freezed
sealed class NutrientStatsRow with _$NutrientStatsRow {
  const factory NutrientStatsRow({
    required Nutrient nutrient,
    required Amount amount,
    @Default(0) int level,
    Amount? goalAmount,
  }) = _NutrientStatsRow;
}
