import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/edible.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient_data.dart';
import 'package:kcalculus/domain/models/nutrition/nutrition_facts.dart';

mixin Portion {
  Edible get edible;

  Amount get amount;

  NutrientData? getNutrientData() {
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
      return closestNF.convertTo(amount).nutrientData;
    }

    return null;
  }
}
