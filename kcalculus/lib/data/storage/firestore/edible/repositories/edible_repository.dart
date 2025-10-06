import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_search_result_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';

class FirestoreEdibleRepository extends EdibleRepository {
  FirestoreEdibleService get _edibleService =>
      ref.read(firestoreEdibleServiceProvider.notifier);

  @override
  Future<List<EdibleSearchResult>> search(
    String? query, {
    PageConfig<EdibleSearchResult>? pageConfig,
  }) =>
      Auth.guard(
        (user) => _edibleService
            .search(
              query,
              userId: user.uid,
              pageConfig: pageConfig == null
                  ? null
                  : PageConfig<EdibleSearchResultFirestoreModel>(
                      size: pageConfig.size,
                      offset: pageConfig.offset,
                      startAfter: pageConfig.startAfter == null
                          ? null
                          : EdibleSearchResultFirestoreModel.fromDomain(
                              pageConfig.startAfter!,
                              user.uid,
                            ),
                    ),
            )
            .then(
              (results) => results.map((r) => r.toDomain()).toList(),
            ),
      );

  @override
  Future<int> count(String? query) => Auth.guard(
        (user) => _edibleService.count(query, userId: user.uid),
      );

  @override
  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  }) =>
      Auth.guard(
        (user) => _edibleService.exists(
          name,
          description,
          userId: user.uid,
          exceptWithId: exceptWithId,
        ),
      );

  @override
  Future<bool> wasEaten(String id) => Auth.guard(
        (user) => _edibleService.wasEaten(id),
      );

  @override
  FutureOr<bool> isMissingNutritionFactsPreviews() => Auth.guard(
        (user) => _edibleService.isMissingNutritionFactsPreviews(user.uid),
      );

  @override
  Future<List<EdibleSearchResult>> findEdiblesWithoutNutritionFactsPreviews() =>
      Auth.guard(
        (user) => _edibleService
            .findEdiblesWithoutNutritionFactsPreviews(user.uid)
            .then(
              (results) => results.map((r) => r.toDomain()).toList(),
            ),
      );
}

final firestoreEdibleRepositoryProvider =
    NotifierProvider<FirestoreEdibleRepository, void>(
  FirestoreEdibleRepository.new,
);
