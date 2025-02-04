import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';

part 'nutrition_facts.freezed.dart';
part 'nutrition_facts.g.dart';

@Freezed(
  fromJson: false,
  toJson: true,
)
class NutritionFacts with _$NutritionFacts {
  const NutritionFacts._();

  const factory NutritionFacts({
    required Amount amount,
    required NutrientData nutrientData,
  }) = _NutritionFacts;

  NutritionFacts convertTo(Amount otherAmount) {
    if (amount.unit.measure != otherAmount.unit.measure) {
      throw 'Per amount and other amount must be of the same measure.';
    }

    final factor = (otherAmount.unit.factor / amount.unit.factor) *
        (otherAmount.value / amount.value);
    return NutritionFacts(
      amount: amount,
      nutrientData: nutrientData * factor,
    );
  }

  Amount? convertAmount(
    Amount amount, {
    required NutritionFacts targetNutritionFacts,
  }) {
    if (this.amount.unit.measure != amount.unit.measure) {
      throw 'Per amount and given amount must be of the same measure.';
    }

    if ((nutrientData.calories == 0 &&
            targetNutritionFacts.nutrientData.calories != 0) ||
        (nutrientData.calories != 0 &&
            targetNutritionFacts.nutrientData.calories == 0)) {
      return null;
    }

    final caloriesFactor = nutrientData.calories == 0 &&
            targetNutritionFacts.nutrientData.calories == 0
        ? 1
        : nutrientData.calories / targetNutritionFacts.nutrientData.calories;

    final amountFactor = (amount.unit.factor / this.amount.unit.factor) *
        (amount.value / this.amount.value);

    return Amount(
      unit: targetNutritionFacts.amount.unit,
      value: targetNutritionFacts.amount.value * caloriesFactor * amountFactor,
    );
  }
}
