import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/macro_split.dart';

part 'nutrition_facts_preview.freezed.dart';
part 'nutrition_facts_preview.g.dart';

@freezed
sealed class NutritionFactsPreview with _$NutritionFactsPreview {
  const NutritionFactsPreview._();

  const factory NutritionFactsPreview({
    required Amount per,
    required Amount calories,
    Amount? fat,
    Amount? carbs,
    Amount? protein,
    Amount? fiber,
  }) = _NutritionFactsPreview;

  factory NutritionFactsPreview.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsPreviewFromJson(json);

  MacroSplit? getMacroSplit() => MacroSplit.fromAmounts(
        fat: fat,
        carbs: carbs,
        protein: protein,
        fiber: fiber,
      );
}
