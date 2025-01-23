import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/repositories/local/edible_repository.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
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

final edibleRepository = FutureProvider<EdibleRepository>(
  (ref) async {
    final dbService = await ref.watch(databaseService.future);
    return LocalEdibleRepository(
      dbService: dbService,
    );
  },
);
