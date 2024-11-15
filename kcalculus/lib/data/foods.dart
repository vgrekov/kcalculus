import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/utils/search_query.dart';

const _debounceDuration = Duration(milliseconds: 500);

class FoodSearchQueryhNotifier extends Notifier<SearchQuery> {
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

final foodSearchQueryProvider =
    NotifierProvider<FoodSearchQueryhNotifier, SearchQuery>(
  FoodSearchQueryhNotifier.new,
);

class FoodsNotifier extends Notifier<Future<List<EdibleSearchResult>>> {
  @override
  Future<List<EdibleSearchResult>> build() async {
    final foodDao = await ref.watch(foodDaoProvider);
    final query = ref.watch(foodSearchQueryProvider);
    return foodDao.search(query.text);
  }

  Future<bool> deleteFood(String id) async {
    final edibleDao = await ref.read(edibleDaoProvider);
    final result = await edibleDao.delete(id);
    if (result) {
      refresh();
    }
    return result;
  }

  void refresh() {
    state = build();
  }
}

final foodsProvider =
    NotifierProvider<FoodsNotifier, Future<List<EdibleSearchResult>>>(
  FoodsNotifier.new,
);
