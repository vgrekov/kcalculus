import 'package:flutter/material.dart';
import 'package:kcalculus/utils/l10n.dart';

enum Measure {
  mass,
  volume,
  quantity,
  energy(
    pickable: false,
  );

  static List<Measure> get pickableValues {
    return Measure.values.where((m) => m.pickable).toList();
  }

  final bool pickable;

  const Measure({
    this.pickable = true,
  });

  String localName(BuildContext context) {
    return switch (this) {
      mass => l10n(context).measureMass,
      volume => l10n(context).measureVolume,
      quantity => l10n(context).measureQuantity,
      energy => l10n(context).measureEnergy,
    };
  }
}

enum MeasureSystem {
  metric,
  imperial,
  us,
  usLegal,
  usCustomary,
  customary;

  String localName(BuildContext context) {
    return switch (this) {
      metric => l10n(context).measureSystemMetric,
      imperial => l10n(context).measureSystemImperial,
      us => l10n(context).measureSystemUS,
      usLegal => l10n(context).measureSystemUSLegal,
      usCustomary => l10n(context).measureSystemUSCustomary,
      customary => l10n(context).measureSystemCustomary,
    };
  }
}

enum Unit {
  calorie(
    measure: Measure.energy,
    system: MeasureSystem.customary,
    factor: 1,
  ),
  piece(
    measure: Measure.quantity,
    system: MeasureSystem.customary,
    factor: 1,
  ),
  // Metric - Mass
  gram(
    measure: Measure.mass,
    system: MeasureSystem.metric,
    factor: 1,
  ),
  kilogram(
    measure: Measure.mass,
    system: MeasureSystem.metric,
    factor: 1000,
  ),
  milligram(
    measure: Measure.mass,
    system: MeasureSystem.metric,
    factor: 0.001,
  ),
  // Metric - Volume
  litre(
    measure: Measure.volume,
    system: MeasureSystem.metric,
    factor: 1,
  ),
  millilitre(
    measure: Measure.volume,
    system: MeasureSystem.metric,
    factor: 0.001,
  ),
  // Imperial - Mass
  pound(
    measure: Measure.mass,
    system: MeasureSystem.imperial,
    factor: 453.5924,
  ),
  ounce(
    measure: Measure.mass,
    system: MeasureSystem.imperial,
    factor: 28.34952,
  ),
  // Imperial - Volume
  teaSpoon(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    factor: 0.005919387,
  ),
  tableSpoon(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    factor: 0.01775816,
  ),
  fluidOunce(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    factor: 0.02841306,
  ),
  cup(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    factor: 0.2841306,
  ),
  pint(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    factor: 0.5682612,
  ),
  quart(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    factor: 1.136522,
  ),
  gallon(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    factor: 4.54609,
  ),
  // US - Volume
  teaSpoonUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    factor: 0.004928922,
  ),
  tableSpoonUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    factor: 0.01478676,
  ),
  fluidOunceUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    factor: 0.02957353,
  ),
  pintUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    factor: 0.4731765,
  ),
  quartUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    factor: 0.946353,
  ),
  gallonUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    factor: 3.785412,
  ),
  // US Legal - Volume
  cupUSLegal(
    measure: Measure.volume,
    system: MeasureSystem.usLegal,
    factor: 0.24,
  ),
  // US Customary - Volume
  cupUSCustomary(
    measure: Measure.volume,
    system: MeasureSystem.usCustomary,
    factor: 0.2365882,
  );

  static Unit defaultFor(Measure measure) {
    return switch (measure) {
      Measure.mass => Unit.gram,
      Measure.volume => Unit.millilitre,
      Measure.quantity => Unit.piece,
      Measure.energy => Unit.calorie,
    };
  }

  final Measure measure;
  final MeasureSystem system;
  final double factor;

  const Unit({
    required this.measure,
    required this.system,
    required this.factor,
  });

  String localName(BuildContext context) {
    return switch (this) {
      calorie => l10n(context).unitCalorie,
      piece => l10n(context).unitPiece,
      gram => l10n(context).unitGram,
      kilogram => l10n(context).unitKilogram,
      milligram => l10n(context).unitMilligram,
      litre => l10n(context).unitLitre,
      millilitre => l10n(context).unitMillilitre,
      pound => l10n(context).unitPound,
      ounce => l10n(context).unitOunce,
      teaSpoon => l10n(context).unitTeaSpoon,
      tableSpoon => l10n(context).unitTableSpoon,
      fluidOunce => l10n(context).unitFluidOunce,
      cup => l10n(context).unitCup,
      pint => l10n(context).unitPint,
      quart => l10n(context).unitQuart,
      gallon => l10n(context).unitGallon,
      teaSpoonUS => l10n(context).unitTeaSpoonUS,
      tableSpoonUS => l10n(context).unitTableSpoonUS,
      fluidOunceUS => l10n(context).unitFluidOunceUS,
      pintUS => l10n(context).unitPintUS,
      quartUS => l10n(context).unitQuartUS,
      gallonUS => l10n(context).unitGallonUS,
      cupUSLegal => l10n(context).unitCupUSLegal,
      cupUSCustomary => l10n(context).unitCupUSCustomary,
    };
  }
}
