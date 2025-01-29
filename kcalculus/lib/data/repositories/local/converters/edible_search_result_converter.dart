import 'package:kcalculus/data/services/local/database/edible/edible_search_result_db_model.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalEdibleSearchResultConverter {
  EdibleSearchResult toModel(EdibleSearchResultDbModel dbModel) {
    return EdibleSearchResult(
        id: dbModel.id,
        name: dbModel.name,
        description: dbModel.description ?? '',
        type: dbModel.food_id != null
            ? EdibleSearchResultType.food
            : EdibleSearchResultType.dish,
        lastEatenAt: dbModel.last_eaten_at != null
            ? dt.parseISO8601(dbModel.last_eaten_at!)
            : null);
  }
}
