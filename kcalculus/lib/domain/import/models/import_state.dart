enum ImportState {
  booked({
    declined,
    inProgress,
  }),

  declined(),

  inProgress({
    succeeded,
    failed,
  }),

  succeeded({
    acknowledged,
  }),

  failed({
    reverted,
    ignored,
  }),

  acknowledged(),

  reverted(),

  ignored();

  final Set<ImportState> _nextStates;

  const ImportState([
    this._nextStates = const {},
  ]);

  static ImportState of(String name) {
    return ImportState.values.firstWhere((u) => u.name == name);
  }

  bool canTransitionTo(ImportState newState) => _nextStates.contains(newState);

  bool get resolved => _nextStates.isEmpty;
}
