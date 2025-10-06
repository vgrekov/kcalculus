import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/data/usda/usda.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';

class EdibleSearchUseCase extends Notifier<void> {
  @override
  void build() {
    ref.watch(edibleRepositoryProvider);
    ref.watch(usdaFoodRepositoryProvider);
  }

  Future<List<EdibleSearchResult>> search(
    String? query, {
    PageConfig<EdibleSearchResult>? pageConfig,
  }) async {
    final edibleRepo = ref.read(edibleRepositoryProvider.notifier);

    final ediblesTotal = await edibleRepo.count(query);

    final usdaFoodRepo = ref.read(usdaFoodRepositoryProvider.notifier);

    final List<EdibleSearchResult> edibles;
    final List<EdibleSearchResult> usdaFoods;
    if (pageConfig == null) {
      edibles = await edibleRepo.search(query);
      usdaFoods = await usdaFoodRepo.search(query);
    } else {
      final ediblesLeft = ediblesTotal - (pageConfig.offset ?? 0);

      edibles = ediblesLeft > 0
          ? await edibleRepo.search(
              query,
              pageConfig: pageConfig,
            )
          : const [];

      usdaFoods = ediblesLeft < pageConfig.size
          ? await usdaFoodRepo.search(
              query,
              limit: pageConfig.size - max(ediblesLeft, 0),
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
