class JsonFlavoured<Flavour> {
  const JsonFlavoured(
    this.flavours, {
    this.filter,
    this.value,
    this.exclusive = true,
  });

  final Set<Flavour> flavours;

  final bool Function(Flavour, dynamic)? filter;

  final dynamic Function(Flavour, dynamic)? value;

  final bool exclusive;
}
