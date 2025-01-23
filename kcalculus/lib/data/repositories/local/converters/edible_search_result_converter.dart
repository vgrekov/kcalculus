import 'package:kcalculus/data/services/local/database/edible/edible_search_result_db_model.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';

class LocalEdibleSearchResultConverter {
  EdibleSearchResult toModel(EdibleSearchResultDbModel dbModel) {
    return EdibleSearchResult(
      id: dbModel.id,
      name: dbModel.name,
      description: dbModel.description ?? '',
      type: dbModel.food_id != null
          ? EdibleSearchResultType.food
          : EdibleSearchResultType.dish,
    );
  }
}
