import 'package:algoliasearch/algoliasearch.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_preview_firestore_model.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';

class FirestoreEdibleSearchService extends Notifier<void> {
  @override
  void build() {}

  Future<List<EdiblePreviewFirestoreModel>> search(
    String? query, {
    required String userId,
    required String searchAppId,
    required String searchApiKey,
    PageConfig<EdiblePreviewFirestoreModel>? pageConfig,
  }) async {
    final client = SearchClient(
      appId: searchAppId,
      apiKey: searchApiKey,
    );

    final request = SearchForHits(
      indexName: 'edibles_index',
      query: query,
      length: pageConfig?.size,
      offset: pageConfig?.offset,
    );

    final response = await client.searchIndex(request: request);

    return response.hits
        .map(
          (hit) => EdiblePreviewFirestoreModel.fromJson({
            EdibleFirestoreModelJsonFields.id: hit.objectID,
            ...hit,
          }),
        )
        .toList();
  }

  Future<int> count(
    String? query, {
    required String userId,
    required String searchAppId,
    required String searchApiKey,
  }) async {
    final client = SearchClient(
      appId: searchAppId,
      apiKey: searchApiKey,
    );

    final request = SearchForHits(
      indexName: 'edibles_index',
      query: query,
      hitsPerPage: 0,
    );

    final response = await client.searchIndex(request: request);

    return response.nbHits ?? 0;
  }
}

final firestoreEdibleSearchServiceProvider =
    NotifierProvider<FirestoreEdibleSearchService, void>(
      FirestoreEdibleSearchService.new,
    );
