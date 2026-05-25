import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';

mixin Portion {
  Edible get edible;

  Amount get amount;

  NutritionFacts? getNutritionFacts() {
    NutritionFacts? closestNF;

    for (final nf in edible.getNutritionFacts()) {
      if (nf.amount.unit == amount.unit) {
        // Nice, we found an exact match!
        closestNF = nf;
        break;
      }

      // Must be of the same measure
      // and, preferably, of the same system
      if (nf.amount.unit.measure == amount.unit.measure &&
          (closestNF == null ||
              (closestNF.amount.unit.system != amount.unit.system &&
                  nf.amount.unit.system == amount.unit.system))) {
        closestNF = nf;
      }
    }

    if (closestNF != null) {
      return closestNF.convertTo(amount);
    }

    return null;
  }

  Amount add(Amount amount) {
    final thisNf = edible
        .getNutritionFacts()
        .where(
          (nf) => nf.amount.unit.measure == this.amount.unit.measure,
        )
        .firstOrNull;

    final otherNf = edible
        .getNutritionFacts()
        .where((nf) => nf.amount.unit.measure == amount.unit.measure)
        .firstOrNull;

    if (thisNf == null || otherNf == null) {
      throw ArgumentError('Unsupported amount');
    }

    final convertedAmount = otherNf.convertAmount(
      amount,
      targetNutritionFacts: thisNf,
    );

    if (convertedAmount == null) {
      throw ArgumentError('Unsupported amount');
    }

    return (this.amount + convertedAmount).convert(this.amount.unit);
  }

  Amount remove(Amount amount) {
    final thisNf = edible
        .getNutritionFacts()
        .where(
          (nf) => nf.amount.unit.measure == this.amount.unit.measure,
        )
        .firstOrNull;

    final otherNf = edible
        .getNutritionFacts()
        .where((nf) => nf.amount.unit.measure == amount.unit.measure)
        .firstOrNull;

    if (thisNf == null || otherNf == null) {
      throw ArgumentError('Unsupported amount');
    }

    final convertedAmount = otherNf.convertAmount(
      amount,
      targetNutritionFacts: thisNf,
    );

    if (convertedAmount == null || this.amount < convertedAmount) {
      throw ArgumentError('Unsupported amount');
    }

    return (this.amount - convertedAmount).convert(this.amount.unit);
  }
}
