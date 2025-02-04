import 'package:kcalculus/data/repositories/edible_repository.dart';
import 'package:kcalculus/data/repositories/local/dao/edible_dao.dart';
import 'package:kcalculus/domain/models/edible_search_result.dart';

class LocalEdibleRepository implements EdibleRepository {
  LocalEdibleRepository({
    required LocalEdibleDao edibleDao,
  }) : _edibleDao = edibleDao;

  final LocalEdibleDao _edibleDao;

  @override
  Future<List<EdibleSearchResult>> search(String? query,
      {EdibleSearchResultType? type}) {
    return _edibleDao.search(query, type: type);
  }

  @override
  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  }) {
    return _edibleDao.exists(
      name,
      description,
      exceptWithId: exceptWithId,
    );
  }

  @override
  Future<bool> wasEaten(String id) {
    return _edibleDao.wasEaten(id);
  }
}
