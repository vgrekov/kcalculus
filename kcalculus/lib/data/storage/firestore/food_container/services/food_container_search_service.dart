import 'package:algoliasearch/algoliasearch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/food_container/models/food_container_firestore_model.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';

class FirestoreFoodContainerSearchService extends Notifier<void> {
  @override
  void build() {}

  Future<List<FoodContainerFirestoreModel>> search(
    String? query, {
    required String userId,
    required String searchAppId,
    required String searchApiKey,
    PageConfig<FoodContainerFirestoreModel>? pageConfig,
  }) async {
    final client = SearchClient(
      appId: searchAppId,
      apiKey: searchApiKey,
    );

    final request = SearchForHits(
      indexName: 'food_containers_index',
      query: query,
      length: pageConfig?.size,
      offset: pageConfig?.offset,
    );

    final response = await client.searchIndex(request: request);

    return response.hits
        .map(
          (hit) => FoodContainerFirestoreModel.fromJson({
            'id': hit.objectID,
            ...hit,
          }),
        )
        .toList();
  }
}

final firestoreFoodContainerSearchService =
    NotifierProvider<FirestoreFoodContainerSearchService, void>(
  FirestoreFoodContainerSearchService.new,
);
