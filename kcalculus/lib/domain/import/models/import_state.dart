enum ImportState {
  booked,

  declined,

  inProgress,

  succeeded,

  failed,

  acknowledged,

  reverted,

  ignored;

  static const _transitions = <ImportState, Set<ImportState>>{
    booked: {
      declined,
      inProgress,
    },
    inProgress: {
      succeeded,
      failed,
    },
    succeeded: {
      acknowledged,
    },
    failed: {
      booked,
      reverted,
      ignored,
    },
  };

  static ImportState of(String name) {
    return ImportState.values.firstWhere((u) => u.name == name);
  }

  bool canTransitionTo(ImportState newState) =>
      _transitions[this]?.contains(newState) ?? false;

  bool get resolved => _transitions[this]?.isEmpty ?? true;
}
