import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

const _debounceDuration = Duration(milliseconds: 500);

class SearchQuery {
  final String text;

  SearchQuery(this.text);
}

class SearchQueryNotifier extends Notifier<SearchQuery> {
  Timer? _debouncer;

  @override
  SearchQuery build() {
    ref.onDispose(() {
      _debouncer?.cancel();
    });

    return SearchQuery('');
  }

  void setQuery(String query) {
    _debouncer?.cancel();
    state = SearchQuery(query);
  }

  void updateQuery(String query) {
    _debouncer?.cancel();
    _debouncer = Timer(_debounceDuration, () {
      state = SearchQuery(query);
    });
  }

  void reset() {
    _debouncer?.cancel();
    state = SearchQuery('');
  }
}
