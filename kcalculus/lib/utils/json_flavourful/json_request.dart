class JsonRequest<Flavour> {
  const JsonRequest(this.flavour, this.actualValue);

  final Flavour flavour;

  final Object? actualValue;
}
