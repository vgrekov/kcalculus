import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/models/amount_firestore_model.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';

part 'nutrition_facts_firestore_model.freezed.dart';
part 'nutrition_facts_firestore_model.g.dart';

@freezed
sealed class NutritionFactsFirestoreModel with _$NutritionFactsFirestoreModel {
  const NutritionFactsFirestoreModel._();

  const factory NutritionFactsFirestoreModel({
    required AmountFirestoreModel per,
    required Map<Nutrient, AmountFirestoreModel> data,
  }) = _NutritionFactsFirestoreModel;

  factory NutritionFactsFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionFactsFirestoreModelFromJson(json);

  factory NutritionFactsFirestoreModel.fromDomain(NutritionFacts model) =>
      NutritionFactsFirestoreModel(
        per: AmountFirestoreModel.fromDomain(model.amount),
        data: {
          for (final na in model.nutrientData.nutrientAmounts)
            na.nutrient: AmountFirestoreModel.fromDomain(na.amount),
        },
      );

  NutritionFacts toDomain() => NutritionFacts(
        amount: per.toDomain(),
        nutrientData: NutrientData(
          nutrientAmounts: data.entries
              .map(
                (e) => NutrientAmount(
                  nutrient: e.key,
                  amount: e.value.toDomain(),
                ),
              )
              .toList(),
        ),
      );
}
