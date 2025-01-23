import 'package:kcalculus/domain/models/edible_search_result.dart';

abstract class EdibleRepository {
  Future<List<EdibleSearchResult>> search(
    String? query, {
    EdibleSearchResultType? type,
  });

  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  });

  Future<bool> wasEaten(String id);

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}
