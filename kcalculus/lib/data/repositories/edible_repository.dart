import 'package:kcalculus/domain/models/edible_search_result.dart';

abstract class EdibleRepository {
  Future<List<EdibleSearchResult>> search(
    String? query, {
    EdibleSearchResultType? type,
    int? limit,
    int? offset,
  });

  Future<int> count(
    String? query, {
    EdibleSearchResultType? type,
  });

  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  });

  Future<bool> wasEaten(String id);
}
