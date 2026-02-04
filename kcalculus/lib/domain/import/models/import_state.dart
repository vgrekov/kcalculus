enum ImportState {
  booked(false),
  declined(true),
  inProgress(false),
  succeeded(false),
  failed(false),
  acknowledged(true),
  reverted(true),
  ignored(true);

  final bool resolved;

  const ImportState(this.resolved);
}
