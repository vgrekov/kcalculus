import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/ui/common/view_models/search/search_helper.dart';

class FoodContainerSearchHelper extends SearchHelper<FoodContainer> {
  FoodContainerSearchHelper({
    required super.pageSize,
    required super.getRef,
    required super.getState,
    required super.setState,
  });

  @override
  Future<List<FoodContainer>> loadData(
    String query, {
    required int limit,
    required int offset,
  }) {
    return getRef().read(foodContainerRepositoryProvider).search(
          query,
          limit: limit,
          offset: offset,
        );
  }
}
