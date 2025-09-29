import 'package:kcalculus/data/storage/_common/repositories/food_container_repository.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/domain/utils/page_config.dart';
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
    PageConfig<FoodContainer>? pageConfig,
  }) async {
    final repo = await getRef().read(foodContainerRepositoryProvider.future);
    return repo.search(
      query,
      pageConfig: pageConfig,
    );
  }
}
