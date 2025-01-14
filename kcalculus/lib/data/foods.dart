import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/search_query.dart';
import 'package:kcalculus/models/food.dart';

final foodSearchQueryProvider =
    NotifierProvider<SearchQueryNotifier, SearchQuery>(
  SearchQueryNotifier.new,
);

class FoodsNotifier extends Notifier<Future<List<EdibleSearchResult>>> {
  @override
  Future<List<EdibleSearchResult>> build() async {
    final foodDao = await ref.watch(foodDaoProvider);
    final query = ref.watch(foodSearchQueryProvider);
    return foodDao.search(query.text);
  }

  Future<void> saveFood(Food food) async {
    final foodDao = await ref.read(foodDaoProvider);
    await foodDao.save(food);
    refresh();
  }

  Future<bool> deleteFood(String id) async {
    final edibleDao = await ref.read(edibleDaoProvider);
    final result = await edibleDao.delete(id);
    if (result) {
      refresh();
    }
    return result;
  }

  Future<bool> restoreFood(String id) async {
    final edibleDao = await ref.read(edibleDaoProvider);
    final result = await edibleDao.restore(id);
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
