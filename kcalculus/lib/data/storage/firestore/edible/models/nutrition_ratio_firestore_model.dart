import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/storage/firestore/_common/models/amount_firestore_model.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_ratio.dart';

part 'nutrition_ratio_firestore_model.freezed.dart';
part 'nutrition_ratio_firestore_model.g.dart';

@freezed
sealed class NutritionRatioFirestoreModel with _$NutritionRatioFirestoreModel {
  const NutritionRatioFirestoreModel._();

  const factory NutritionRatioFirestoreModel({
    required AmountFirestoreModel per,
    required AmountFirestoreModel total,
  }) = _NutritionRatioFirestoreModel;

  factory NutritionRatioFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$NutritionRatioFirestoreModelFromJson(json);

  factory NutritionRatioFirestoreModel.fromDomain(NutritionRatio model) =>
      NutritionRatioFirestoreModel(
        per: AmountFirestoreModel.fromDomain(model.perAmount),
        total: AmountFirestoreModel.fromDomain(model.totalAmount),
      );

  NutritionRatio toDomain() => NutritionRatio(
        perAmount: per.toDomain(),
        totalAmount: total.toDomain(),
      );
}
