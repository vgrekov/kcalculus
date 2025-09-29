import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/edible_repository.dart';
import 'package:kcalculus/data/usda/_common/repositories/usda_food_repository.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';

class EdibleSearchUseCase extends Notifier<void> {
  @override
  void build() {
    ref.watch(edibleRepositoryProvider);
    ref.watch(usdaFoodRepositoryProvider);
  }

  Future<List<EdibleSearchResult>> search(
    String? query, {
    EdibleSearchResultType? type,
    int? limit,
    int? offset,
  }) async {
    final edibleRepo = ref.read(edibleRepositoryProvider.notifier);

    if (type != null) {
      return edibleRepo.search(
        query,
        type: type,
        limit: limit,
        offset: offset,
      );
    }

    final ediblesTotal = await edibleRepo.count(query);

    final usdaFoodRepo = ref.read(usdaFoodRepositoryProvider.notifier);

    final List<EdibleSearchResult> edibles;
    final List<EdibleSearchResult> usdaFoods;
    if (limit == null) {
      edibles = await edibleRepo.search(query);
      usdaFoods = await usdaFoodRepo.search(query);
    } else {
      final ediblesLeft = ediblesTotal - (offset ?? 0);

      edibles = ediblesLeft > 0
          ? await edibleRepo.search(
              query,
              limit: limit,
              offset: offset,
            )
          : const [];

      usdaFoods = ediblesLeft < limit
          ? await usdaFoodRepo.search(
              query,
              limit: limit - max(ediblesLeft, 0),
              offset: max(-ediblesLeft, 0),
            )
          : const [];
    }

    return [
      ...edibles,
      ...usdaFoods,
    ];
  }
}

final edibleSearchUseCaseProvider = NotifierProvider<EdibleSearchUseCase, void>(
  EdibleSearchUseCase.new,
);
