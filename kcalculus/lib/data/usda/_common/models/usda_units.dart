import 'package:kcalculus/data/usda/nutrient/models/usda_nutrient_db_model.dart';
import 'package:kcalculus/domain/models/units.dart';

final kUsdaUnits = <String, Unit>{
  UsdaNutrientDbModel.kCalorieUnitName: Unit.calorie,
  UsdaNutrientDbModel.kGramUnitName: Unit.gram,
  UsdaNutrientDbModel.kMilligramUnitName: Unit.milligram,
  for (final unitName in UsdaNutrientDbModel.kMicrogramUnitNames)
    unitName: Unit.microgram,
};
