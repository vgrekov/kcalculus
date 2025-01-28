import 'dart:async';

class SearchDebouncer {
  static const kDefaultDuration = Duration(milliseconds: 500);

  SearchDebouncer(
    this.onSearch, {
    this.debounceDuration = kDefaultDuration,
  });

  final void Function(String) onSearch;

  final Duration debounceDuration;

  Timer? _debouncer;

  void setQuery(String query) {
    _debouncer?.cancel();
    onSearch(query);
  }

  void updateQuery(String query) {
    _debouncer?.cancel();
    _debouncer = Timer(debounceDuration, () {
      onSearch(query);
    });
  }

  void reset() {
    setQuery('');
  }

  void dispose() {
    _debouncer?.cancel();
  }
}
