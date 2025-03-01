class Paginator<Model> {
  Paginator({
    required List<Model> Function() currentData,
    required Future<List<Model>> Function(int) loadPage,
    required void Function(List<Model>) updateState,
  })  : _currentData = currentData,
        _loadPage = loadPage,
        _updateState = updateState;

  final List<Model> Function() _currentData;

  final Future<List<Model>> Function(int) _loadPage;

  final void Function(List<Model>) _updateState;

  Future<void> refresh() async {
    final data = await _loadPage(0);
    _updateState(data);
  }

  Future<bool> loadNextPage() async {
    var data = _currentData();

    final nextPage = await _loadPage(data.length);

    if (nextPage.isNotEmpty) {
      data = [
        ...data,
        ...nextPage,
      ];

      _updateState(data);

      return true;
    }

    return false;
  }
}
