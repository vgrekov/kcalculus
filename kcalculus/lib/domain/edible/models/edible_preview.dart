import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts_preview.dart';
import 'package:kcalculus/l10n/app_localizations.dart';

part 'edible_preview.freezed.dart';
part 'edible_preview.g.dart';

enum EdiblePreviewType {
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
sealed class EdiblePreview with _$EdiblePreview {
  const factory EdiblePreview({
    required String id,
    required String name,
    required String description,
    required EdiblePreviewType type,
    NutritionFactsPreview? nutritionFactsPreview,
    DateTime? lastEatenAt,
    DateTime? touchedAt,
  }) = _EdiblePreview;

  factory EdiblePreview.fromJson(Map<String, dynamic> json) =>
      _$EdiblePreviewFromJson(json);
}
