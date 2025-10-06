import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/models/amount_firestore_model.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts_preview.dart';

part 'nutrition_facts_preview_firestore_model.freezed.dart';
part 'nutrition_facts_preview_firestore_model.g.dart';

@freezed
sealed class NutritionFactsPreviewFirestoreModel
    with _$NutritionFactsPreviewFirestoreModel {
  const NutritionFactsPreviewFirestoreModel._();

  const factory NutritionFactsPreviewFirestoreModel({
    required AmountFirestoreModel per,
    required AmountFirestoreModel calories,
    required AmountFirestoreModel? fat,
    required AmountFirestoreModel? carbs,
    required AmountFirestoreModel? protein,
    required AmountFirestoreModel? fiber,
  }) = _NutritionFactsPreviewFirestoreModel;

  factory NutritionFactsPreviewFirestoreModel.fromJson(
          Map<String, dynamic> json) =>
      _$NutritionFactsPreviewFirestoreModelFromJson(json);

  factory NutritionFactsPreviewFirestoreModel.fromDomain(
          NutritionFactsPreview model) =>
      NutritionFactsPreviewFirestoreModel(
        per: AmountFirestoreModel.fromDomain(model.per),
        calories: AmountFirestoreModel.fromDomain(model.calories),
        fat: model.fat == null
            ? null
            : AmountFirestoreModel.fromDomain(model.fat!),
        carbs: model.carbs == null
            ? null
            : AmountFirestoreModel.fromDomain(model.carbs!),
        protein: model.protein == null
            ? null
            : AmountFirestoreModel.fromDomain(model.protein!),
        fiber: model.fiber == null
            ? null
            : AmountFirestoreModel.fromDomain(model.fiber!),
      );

  NutritionFactsPreview toDomain() => NutritionFactsPreview(
        per: per.toDomain(),
        calories: calories.toDomain(),
        fat: fat?.toDomain(),
        carbs: carbs?.toDomain(),
        protein: protein?.toDomain(),
        fiber: fiber?.toDomain(),
      );
}
