import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/search_query.dart';
import 'package:kcalculus/models/dish.dart';
import 'package:kcalculus/models/food.dart';
import 'package:kcalculus/utils/exceptions.dart';

final dishSearchQueryProvider =
    NotifierProvider<SearchQueryNotifier, SearchQuery>(
  SearchQueryNotifier.new,
);

class DishesNotifier extends Notifier<Future<List<EdibleSearchResult>>> {
  @override
  Future<List<EdibleSearchResult>> build() async {
    final dishDao = await ref.watch(dishDaoProvider);
    final query = ref.watch(dishSearchQueryProvider);

    return dishDao.search(query.text);
  }

  Future<void> saveDish(Dish dish) async {
    final edibleDao = await ref.read(edibleDaoProvider);
    final alreadyExists = await edibleDao.exists(
      dish.name,
      dish.description,
      exceptWithId: dish.id,
    );
    if (alreadyExists) {
      throw DuplicationException();
    }

    final dishDao = await ref.read(dishDaoProvider);
    await dishDao.save(dish);

    refresh();
  }

  Future<bool> deleteDish(String id) async {
    final edibleDao = await ref.read(edibleDaoProvider);
    final result = await edibleDao.delete(id);
    if (result) {
      refresh();
    }

    return result;
  }

  Future<bool> restoreDish(String id) async {
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

final dishesProvider =
    NotifierProvider<DishesNotifier, Future<List<EdibleSearchResult>>>(
  DishesNotifier.new,
);
