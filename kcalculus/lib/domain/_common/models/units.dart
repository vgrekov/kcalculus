import 'package:kcalculus/l10n/app_localizations.dart';

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

  String localName(AppLocalizations l10n) {
    return switch (this) {
      mass => l10n.measureMass,
      volume => l10n.measureVolume,
      quantity => l10n.measureQuantity,
      energy => l10n.measureEnergy,
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

  String localName(AppLocalizations l10n) {
    return switch (this) {
      metric => l10n.measureSystemMetric,
      imperial => l10n.measureSystemImperial,
      us => l10n.measureSystemUS,
      usLegal => l10n.measureSystemUSLegal,
      usCustomary => l10n.measureSystemUSCustomary,
      customary => l10n.measureSystemCustomary,
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
  microgram(
    measure: Measure.mass,
    system: MeasureSystem.metric,
    factor: 0.000001,
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

  static Unit of(String name) {
    return Unit.values.firstWhere((u) => u.name == name);
  }

  final Measure measure;
  final MeasureSystem system;
  final double factor;

  const Unit({
    required this.measure,
    required this.system,
    required this.factor,
  });

  String localName(AppLocalizations l10n) {
    return switch (this) {
      calorie => l10n.unitCalorie,
      piece => l10n.unitPiece,
      gram => l10n.unitGram,
      kilogram => l10n.unitKilogram,
      milligram => l10n.unitMilligram,
      microgram => l10n.unitMicrogram,
      litre => l10n.unitLitre,
      millilitre => l10n.unitMillilitre,
      pound => l10n.unitPound,
      ounce => l10n.unitOunce,
      teaSpoon => l10n.unitTeaSpoon,
      tableSpoon => l10n.unitTableSpoon,
      fluidOunce => l10n.unitFluidOunce,
      cup => l10n.unitCup,
      pint => l10n.unitPint,
      quart => l10n.unitQuart,
      gallon => l10n.unitGallon,
      teaSpoonUS => l10n.unitTeaSpoonUS,
      tableSpoonUS => l10n.unitTableSpoonUS,
      fluidOunceUS => l10n.unitFluidOunceUS,
      pintUS => l10n.unitPintUS,
      quartUS => l10n.unitQuartUS,
      gallonUS => l10n.unitGallonUS,
      cupUSLegal => l10n.unitCupUSLegal,
      cupUSCustomary => l10n.unitCupUSCustomary,
    };
  }
}
