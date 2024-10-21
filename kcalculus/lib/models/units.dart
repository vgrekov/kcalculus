enum Measure {
  mass(
    displayName: 'Mass',
  ),
  volume(
    displayName: 'Volume',
  ),
  quantity(
    displayName: 'Quantity',
  );

  final String displayName;

  const Measure({
    required this.displayName,
  });
}

enum MeasureSystem {
  metric(
    displayName: 'Metric',
  ),
  imperial(
    displayName: 'Imperial',
  ),
  us(
    displayName: 'US',
  ),
  usLegal(
    displayName: 'US Legal',
  ),
  usCustomary(
    displayName: 'US Customary',
  );

  final String displayName;

  const MeasureSystem({
    required this.displayName,
  });
}

enum Unit {
  piece(
    measure: Measure.quantity,
    displayName: 'ea',
    factor: 1,
  ),
  // Metric - Mass
  gram(
    measure: Measure.mass,
    system: MeasureSystem.metric,
    displayName: 'g',
    factor: 1,
  ),
  kilogram(
    measure: Measure.mass,
    system: MeasureSystem.metric,
    displayName: 'kg',
    factor: 1000,
  ),
  milligram(
    measure: Measure.mass,
    system: MeasureSystem.metric,
    displayName: 'mg',
    factor: 0.001,
  ),
  // Metric - Volume
  litre(
    measure: Measure.volume,
    system: MeasureSystem.metric,
    displayName: 'l',
    factor: 1,
  ),
  millilitre(
    measure: Measure.volume,
    system: MeasureSystem.metric,
    displayName: 'ml',
    factor: 0.001,
  ),
  // Imperial - Mass
  pound(
    measure: Measure.mass,
    system: MeasureSystem.imperial,
    displayName: 'lb',
    factor: 453.5924,
  ),
  ounce(
    measure: Measure.mass,
    system: MeasureSystem.imperial,
    displayName: 'oz',
    factor: 28.34952,
  ),
  // Imperial - Volume
  teaSpoonImperial(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    displayName: 'tsp (imp)',
    factor: 0.005919387,
  ),
  tableSpoonImperial(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    displayName: 'tbsp (imp)',
    factor: 0.01775816,
  ),
  fluidOunceImperial(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    displayName: 'fl oz (imp)',
    factor: 0.02841306,
  ),
  cupImperial(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    displayName: 'cup (imp)',
    factor: 0.2841306,
  ),
  pintImperial(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    displayName: 'pt (imp)',
    factor: 0.5682612,
  ),
  quartImperial(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    displayName: 'qt (imp)',
    factor: 1.136522,
  ),
  gallonImperial(
    measure: Measure.volume,
    system: MeasureSystem.imperial,
    displayName: 'gal (imp)',
    factor: 4.54609,
  ),
  // US - Volume
  teaSpoonUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    displayName: 'tsp (US)',
    factor: 0.004928922,
  ),
  tableSpoonUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    displayName: 'tbsp (US)',
    factor: 0.01478676,
  ),
  fluidOunceUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    displayName: 'fl oz (US)',
    factor: 0.02957353,
  ),
  pintUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    displayName: 'pt (US)',
    factor: 0.4731765,
  ),
  quartUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    displayName: 'qt (US)',
    factor: 0.946353,
  ),
  gallonUS(
    measure: Measure.volume,
    system: MeasureSystem.us,
    displayName: 'gal (US)',
    factor: 3.785412,
  ),
  // US Legal - Volume
  cupUSLegal(
    measure: Measure.volume,
    system: MeasureSystem.usLegal,
    displayName: 'cup (US legal)',
    factor: 0.24,
  ),
  // US Customary - Volume
  cupUSCustomary(
    measure: Measure.volume,
    system: MeasureSystem.usCustomary,
    displayName: 'cup (US customary)',
    factor: 0.2365882,
  );

  final Measure measure;
  final MeasureSystem? system;
  final String displayName;
  final double factor;

  const Unit({
    required this.measure,
    this.system,
    required this.displayName,
    required this.factor,
  });
}
