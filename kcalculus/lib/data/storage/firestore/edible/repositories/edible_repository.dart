import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_preview_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_search_service.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/data/storage/firestore/user_data/services/user_data_service.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/exceptions/search_not_configured_exception.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';

class FirestoreEdibleRepository extends EdibleRepository {
  FirestoreEdibleService get _edibleService =>
      ref.read(firestoreEdibleServiceProvider.notifier);

  FirestoreEdibleSearchService get _edibleSearchService =>
      ref.read(firestoreEdibleSearchServiceProvider.notifier);

  @override
  Future<List<EdiblePreview>> getAll({
    PageConfig<EdiblePreview>? pageConfig,
  }) =>
      Auth.guard(
        (user) => _edibleService
            .all(
              userId: user.uid,
              pageConfig: pageConfig == null
                  ? null
                  : PageConfig<EdiblePreviewFirestoreModel>(
                      size: pageConfig.size,
                      offset: pageConfig.offset,
                      startAfter: pageConfig.startAfter == null
                          ? null
                          : EdiblePreviewFirestoreModel.fromDomain(
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
  Future<List<EdiblePreview>> search(
    String? query, {
    PageConfig<EdiblePreview>? pageConfig,
  }) =>
      Auth.guard(
        (user) async {
          final userData = await ref
              .read(firestoreUserDataServiceProvider.notifier)
              .getById(user.uid);

          if (userData?.searchConfig == null) {
            throw SearchNotConfiguredException();
          }

          return _edibleSearchService
              .search(
                query,
                userId: user.uid,
                searchAppId: userData!.searchConfig!.appId,
                searchApiKey: userData.searchConfig!.apiKey,
                pageConfig: pageConfig == null
                    ? null
                    : PageConfig<EdiblePreviewFirestoreModel>(
                        size: pageConfig.size,
                        offset: pageConfig.offset,
                        startAfter: pageConfig.startAfter == null
                            ? null
                            : EdiblePreviewFirestoreModel.fromDomain(
                                pageConfig.startAfter!,
                                user.uid,
                              ),
                      ),
              )
              .then(
                (results) => results.map((r) => r.toDomain()).toList(),
              );
        },
      );

  @override
  Future<int> count([String? query]) => Auth.guard(
        (user) async {
          if (query == null) {
            return _edibleService.count(userId: user.uid);
          }

          final userData = await ref
              .read(firestoreUserDataServiceProvider.notifier)
              .getById(user.uid);

          if (userData?.searchConfig == null) {
            throw SearchNotConfiguredException();
          }

          return _edibleSearchService.count(
            query,
            searchAppId: userData!.searchConfig!.appId,
            searchApiKey: userData.searchConfig!.apiKey,
            userId: user.uid,
          );
        },
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
  Future<List<EdiblePreview>> findEdiblesWithoutNutritionFactsPreviews() =>
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
