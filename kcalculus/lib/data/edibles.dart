import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/dao.dart';
import 'package:kcalculus/data/search_query.dart';
import 'package:kcalculus/models/food.dart';

final edibleSearchQueryProvider =
    NotifierProvider<SearchQueryNotifier, SearchQuery>(
  SearchQueryNotifier.new,
);

final edibleSearchProvider = Provider<Future<List<EdibleSearchResult>>>(
  (ref) async {
    final edibleDao = await ref.watch(edibleDaoProvider);
    final query = ref.watch(edibleSearchQueryProvider);
    return edibleDao.search(query.text);
  },
);
