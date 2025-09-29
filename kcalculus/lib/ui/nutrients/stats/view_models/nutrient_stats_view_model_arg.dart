import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';

part 'nutrient_stats_view_model_arg.freezed.dart';

@freezed
sealed class NutrientStatsViewModelArg with _$NutrientStatsViewModelArg {
  const factory NutrientStatsViewModelArg({
    required DateTime date,
    required NutrientData data,
  }) = _NutrientStatsViewModelArg;
}
