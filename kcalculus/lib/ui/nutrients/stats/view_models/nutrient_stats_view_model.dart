import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_ui_state.dart';
import 'package:kcalculus/ui/nutrients/stats/view_models/nutrient_stats_view_model_arg.dart';

final nutrientStatsViewModel = FutureProvider.family
    .autoDispose<NutrientStatsUiState, NutrientStatsViewModelArg>(
  (ref, arg) async {
    final defaults = await ref.read(nutrientRepositoryProvider).getDefaults();

    return NutrientStatsUiState(
      date: arg.date,
      data: arg.data,
      defaults: defaults,
    );
  },
);
