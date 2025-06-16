import 'package:kcalculus/data/repositories/usda/usda_food_converter.dart';
import 'package:kcalculus/data/services/usda/usda_service.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/domain/models/food.dart';

class UsdaFoodRepository {
  const UsdaFoodRepository({
    required UsdaService usdaService,
    required UsdaFoodConverter usdaFoodConverter,
  })  : _usdaService = usdaService,
        _usdaFoodConverter = usdaFoodConverter;

  final UsdaService _usdaService;

  final UsdaFoodConverter _usdaFoodConverter;

  Future<List<EdibleSearchResult>> search(
    String? query, {
    int? limit,
    int? offset,
  }) async {
    final usdaModels = await _usdaService.search(
      query,
      limit: limit,
      offset: offset,
    );

    return usdaModels.map(_usdaFoodConverter.toSearchResult).toList();
  }

  Future<Food?> getById(String id) async {
    final fdcId = int.tryParse(id);
    if (fdcId == null) return null;

    final usdaModel = await _usdaService.getByFdcId(fdcId);
    if (usdaModel == null) return null;

    return _usdaFoodConverter.toModel(usdaModel);
  }
}
