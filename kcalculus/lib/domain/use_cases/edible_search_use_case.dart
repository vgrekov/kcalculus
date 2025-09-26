import 'dart:math';

import 'package:kcalculus/_data/storage/_common/repositories/edible_repository.dart';
import 'package:kcalculus/_data/usda/_common/repositories/usda_food_repository.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';

class EdibleSearchUseCase {
  const EdibleSearchUseCase({
    required EdibleRepository edibleRepository,
    required UsdaFoodRepository usdaFoodRepository,
  })  : _edibleRepository = edibleRepository,
        _usdaFoodRepository = usdaFoodRepository;

  final EdibleRepository _edibleRepository;

  final UsdaFoodRepository _usdaFoodRepository;

  Future<List<EdibleSearchResult>> search(
    String? query, {
    EdibleSearchResultType? type,
    int? limit,
    int? offset,
  }) async {
    if (type != null) {
      return _edibleRepository.search(
        query,
        type: type,
        limit: limit,
        offset: offset,
      );
    }

    final ediblesTotal = await _edibleRepository.count(query);

    final List<EdibleSearchResult> edibles;
    final List<EdibleSearchResult> usdaFoods;
    if (limit == null) {
      edibles = await _edibleRepository.search(query);
      usdaFoods = await _usdaFoodRepository.search(query);
    } else {
      final ediblesLeft = ediblesTotal - (offset ?? 0);

      edibles = ediblesLeft > 0
          ? await _edibleRepository.search(
              query,
              limit: limit,
              offset: offset,
            )
          : const [];

      usdaFoods = ediblesLeft < limit
          ? await _usdaFoodRepository.search(
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
