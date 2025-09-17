import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts_preview.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

part 'edible_search_result.freezed.dart';
part 'edible_search_result.g.dart';

enum EdibleSearchResultType {
  food,
  dish,
  usda;

  String localName(AppLocalizations l10n) {
    return switch (this) {
      food => l10n.edibleTypeFood,
      dish => l10n.edibleTypeDish,
      usda => l10n.edibleTypeUsda,
    };
  }
}

@freezed
sealed class EdibleSearchResult with _$EdibleSearchResult {
  const factory EdibleSearchResult({
    required String id,
    required String name,
    required String description,
    required EdibleSearchResultType type,
    NutritionFactsPreview? nutritionFactsPreview,
    DateTime? lastEatenAt,
  }) = _EdibleSearchResult;

  factory EdibleSearchResult.fromJson(Map<String, dynamic> json) =>
      _$EdibleSearchResultFromJson(json);
}
