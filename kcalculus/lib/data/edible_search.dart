import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/utils/search_query.dart';

const _debounceDuration = Duration(milliseconds: 500);

class EdibleSearchQueryhNotifier extends Notifier<SearchQuery> {
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

final edibleSearchQueryProvider =
    NotifierProvider<EdibleSearchQueryhNotifier, SearchQuery>(
  EdibleSearchQueryhNotifier.new,
);

class EdibleSearchNotifier extends Notifier<Future<List<EdibleSearchResult>>> {
  @override
  Future<List<EdibleSearchResult>> build() async {
    final edibleDao = await ref.watch(edibleDaoProvider);
    final query = ref.watch(edibleSearchQueryProvider);
    return edibleDao.search(query.text);
  }
}

final edibleSearchProvider =
    NotifierProvider<EdibleSearchNotifier, Future<List<EdibleSearchResult>>>(
  EdibleSearchNotifier.new,
);
