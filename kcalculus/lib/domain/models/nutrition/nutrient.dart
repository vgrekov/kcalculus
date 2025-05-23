import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:kcalculus/domain/models/units.dart';

enum Nutrient {
  energy(
    defaultUnit: Unit.calorie,
    defaultIndex: 0,
    required: true,
  ),
  fat(
    defaultUnit: Unit.gram,
    defaultIndex: 1,
    required: true,
  ),
  saturatedFat(
    defaultUnit: Unit.gram,
    defaultIndex: 2,
    partOf: fat,
  ),
  transFat(
    defaultUnit: Unit.gram,
    defaultIndex: 3,
    partOf: fat,
  ),
  unsaturatedFat(
    defaultUnit: Unit.gram,
    partOf: fat,
  ),
  omega3Fat(
    defaultUnit: Unit.milligram,
    partOf: unsaturatedFat,
  ),
  omega6Fat(
    defaultUnit: Unit.milligram,
    partOf: unsaturatedFat,
  ),
  omega9Fat(
    defaultUnit: Unit.milligram,
    partOf: unsaturatedFat,
  ),
  monounsaturatedFat(
    defaultUnit: Unit.gram,
    partOf: unsaturatedFat,
  ),
  polyunsaturatedFat(
    defaultUnit: Unit.gram,
    partOf: unsaturatedFat,
  ),
  totalCarbs(
    defaultUnit: Unit.gram,
    defaultIndex: 4,
    required: true,
  ),
  fiber(
    defaultUnit: Unit.gram,
    defaultIndex: 5,
    partOf: totalCarbs,
  ),
  sugar(
    defaultUnit: Unit.gram,
    defaultIndex: 6,
    partOf: totalCarbs,
  ),
  polyols(
    defaultUnit: Unit.gram,
    partOf: totalCarbs,
  ),
  erythritol(
    defaultUnit: Unit.gram,
    partOf: totalCarbs,
  ),
  protein(
    defaultUnit: Unit.gram,
    defaultIndex: 7,
    required: true,
  ),
  cholesterol(
    defaultUnit: Unit.milligram,
    defaultIndex: 8,
  ),
  sodium(
    defaultUnit: Unit.milligram,
    defaultIndex: 9,
  ),
  potassium(
    defaultUnit: Unit.milligram,
    defaultIndex: 10,
  ),
  calcium(
    defaultUnit: Unit.milligram,
    defaultIndex: 11,
  ),
  iron(
    defaultUnit: Unit.milligram,
    defaultIndex: 12,
  ),
  betaCarotene(
    defaultUnit: Unit.gram,
  ),
  biotin(
    defaultUnit: Unit.microgram,
  ),
  vitaminA(
    defaultUnit: Unit.microgram,
  ),
  vitaminB1(
    defaultUnit: Unit.milligram,
  ),
  vitaminB2(
    defaultUnit: Unit.milligram,
  ),
  vitaminB3(
    defaultUnit: Unit.milligram,
  ),
  vitaminB5(
    defaultUnit: Unit.milligram,
  ),
  vitaminB6(
    defaultUnit: Unit.milligram,
  ),
  vitaminB9(
    defaultUnit: Unit.microgram,
  ),
  vitaminB12(
    defaultUnit: Unit.microgram,
  ),
  vitaminC(
    defaultUnit: Unit.milligram,
  ),
  vitaminD(
    defaultUnit: Unit.microgram,
  ),
  vitaminE(
    defaultUnit: Unit.milligram,
  ),
  vitaminK(
    defaultUnit: Unit.microgram,
  ),
  silica(
    defaultUnit: Unit.milligram,
  ),
  bicarbonate(
    defaultUnit: Unit.milligram,
  ),
  chloride(
    defaultUnit: Unit.milligram,
  ),
  phosphorus(
    defaultUnit: Unit.milligram,
  ),
  magnesium(
    defaultUnit: Unit.milligram,
  ),
  zinc(
    defaultUnit: Unit.milligram,
  ),
  copper(
    defaultUnit: Unit.milligram,
  ),
  manganese(
    defaultUnit: Unit.milligram,
  ),
  fluoride(
    defaultUnit: Unit.milligram,
  ),
  selenium(
    defaultUnit: Unit.microgram,
  ),
  chromium(
    defaultUnit: Unit.microgram,
  ),
  molybdenum(
    defaultUnit: Unit.microgram,
  ),
  iodine(
    defaultUnit: Unit.microgram,
  ),
  caffeine(
    defaultUnit: Unit.milligram,
  ),
  taurine(
    defaultUnit: Unit.gram,
  ),
  chlorophyl(
    defaultUnit: Unit.gram,
  ),
  sulfate(
    defaultUnit: Unit.gram,
  ),
  nitrate(
    defaultUnit: Unit.milligram,
  );

  final Unit defaultUnit;

  final Nutrient? partOf;

  final bool required;

  final int? defaultIndex;

  const Nutrient({
    required this.defaultUnit,
    this.partOf,
    this.required = false,
    this.defaultIndex,
  });

  String localName(AppLocalizations l10n) {
    return switch (this) {
      energy => l10n.nutrientEnergy,
      fat => l10n.nutrientFat,
      saturatedFat => l10n.nutrientSaturatedFat,
      transFat => l10n.nutrientTransFat,
      unsaturatedFat => l10n.nutrientUnsaturatedFat,
      omega3Fat => l10n.nutrientOmega3Fat,
      omega6Fat => l10n.nutrientOmega6Fat,
      omega9Fat => l10n.nutrientOmega9Fat,
      monounsaturatedFat => l10n.nutrientMonounsaturatedFat,
      polyunsaturatedFat => l10n.nutrientPolyunsaturatedFat,
      totalCarbs => l10n.nutrientTotalCarbs,
      fiber => l10n.nutrientFiber,
      sugar => l10n.nutrientSugar,
      polyols => l10n.nutrientPolyols,
      erythritol => l10n.nutrientErythritol,
      protein => l10n.nutrientProtein,
      cholesterol => l10n.nutrientCholesterol,
      sodium => l10n.nutrientSodium,
      potassium => l10n.nutrientPotassium,
      calcium => l10n.nutrientCalcium,
      iron => l10n.nutrientIron,
      betaCarotene => l10n.nutrientBetaCarotene,
      biotin => l10n.nutrientBiotin,
      vitaminA => l10n.nutrientVitaminA,
      vitaminB1 => l10n.nutrientVitaminB1,
      vitaminB2 => l10n.nutrientVitaminB2,
      vitaminB3 => l10n.nutrientVitaminB3,
      vitaminB5 => l10n.nutrientVitaminB5,
      vitaminB6 => l10n.nutrientVitaminB6,
      vitaminB9 => l10n.nutrientVitaminB9,
      vitaminB12 => l10n.nutrientVitaminB12,
      vitaminC => l10n.nutrientVitaminC,
      vitaminD => l10n.nutrientVitaminD,
      vitaminE => l10n.nutrientVitaminE,
      vitaminK => l10n.nutrientVitaminK,
      silica => l10n.nutrientSilica,
      bicarbonate => l10n.nutrientBicarbonate,
      chloride => l10n.nutrientChloride,
      phosphorus => l10n.nutrientPhosphorus,
      magnesium => l10n.nutrientMagnesium,
      zinc => l10n.nutrientZinc,
      copper => l10n.nutrientCopper,
      manganese => l10n.nutrientManganese,
      fluoride => l10n.nutrientFluoride,
      selenium => l10n.nutrientSelenium,
      chromium => l10n.nutrientChromium,
      molybdenum => l10n.nutrientMolybdenum,
      iodine => l10n.nutrientIodine,
      caffeine => l10n.nutrientCaffeine,
      taurine => l10n.nutrientTaurine,
      chlorophyl => l10n.nutrientChlorophyl,
      sulfate => l10n.nutrientSulfate,
      nitrate => l10n.nutrientNitrate,
    };
  }
}
