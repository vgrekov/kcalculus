import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/app_config/models/app_config.dart';
import 'package:kcalculus/data/app_config/services/app_config_service.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/_common/repositories/food_container_repository.dart';
import 'package:kcalculus/data/storage/firestore/food_container/models/food_container_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/food_container/services/food_container_search_service.dart';
import 'package:kcalculus/data/storage/firestore/food_container/services/food_container_service.dart';
import 'package:kcalculus/data/storage/firestore/user_data/services/user_data_service.dart';
import 'package:kcalculus/domain/_common/exceptions/search_not_configured_exception.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';

class FirestoreFoodContainerRepository extends FoodContainerRepository {
  FirestoreFoodContainerService get _foodContainerService =>
      ref.read(firestoreFoodContainerServiceProvider.notifier);

  FirestoreFoodContainerSearchService get _foodContainerSearchService =>
      ref.read(firestoreFoodContainerSearchServiceProvider.notifier);

  @override
  Future<bool> isEmpty() => Auth.guard(
    ref,
    (user) => _foodContainerService.isEmpty(
      userId: user.uid,
    ),
  );

  @override
  Future<List<FoodContainer>> getAll({
    bool includeDeleted = false,
    PageConfig<FoodContainer>? pageConfig,
  }) => Auth.guard(
    ref,
    (user) => _foodContainerService
        .all(
          userId: user.uid,
          includeDeleted: includeDeleted,
          pageConfig: pageConfig == null
              ? null
              : PageConfig<FoodContainerFirestoreModel>(
                  size: pageConfig.size,
                  offset: pageConfig.offset,
                  startAfter: pageConfig.startAfter == null
                      ? null
                      : FoodContainerFirestoreModel.fromDomain(
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
  Future<List<FoodContainer>> search(
    String? query, {
    PageConfig<FoodContainer>? pageConfig,
  }) => Auth.guard(
    ref,
    (user) async {
      final searchResults = await _search(
        query,
        userId: user.uid,
        pageConfig: pageConfig,
      );

      final recents = await _recents(
        userId: user.uid,
      );

      final recentsById = {
        for (final model in recents) model.id: model,
      };

      final syncedSearchResults = searchResults
          .map(
            (model) => recentsById.remove(model.id) ?? model,
          )
          .toList();

      final isFirstPage =
          (pageConfig?.offset ?? 0) == 0 && pageConfig?.startAfter == null;

      return [
        if (isFirstPage)
          ...recents
              .where(
                (model) =>
                    recentsById.containsKey(model.id) &&
                    model.deletedAt == null,
              )
              .map((r) => r.toDomain(true)),
        ...syncedSearchResults.map((r) => r.toDomain()),
      ];
    },
  );

  Future<List<FoodContainerFirestoreModel>> _search(
    String? query, {
    required String userId,
    PageConfig<FoodContainer>? pageConfig,
  }) async {
    final userData = await ref
        .read(firestoreUserDataServiceProvider.notifier)
        .getById(userId);

    if (userData?.searchConfig == null) {
      throw SearchNotConfiguredException();
    }

    return _foodContainerSearchService.search(
      query,
      userId: userId,
      searchAppId: userData!.searchConfig!.appId,
      searchApiKey: userData.searchConfig!.apiKey,
      pageConfig: pageConfig == null
          ? null
          : PageConfig<FoodContainerFirestoreModel>(
              size: pageConfig.size,
              offset: pageConfig.offset,
              startAfter: pageConfig.startAfter == null
                  ? null
                  : FoodContainerFirestoreModel.fromDomain(
                      pageConfig.startAfter!,
                      userId,
                    ),
            ),
    );
  }

  Future<List<FoodContainerFirestoreModel>> _recents({
    required String userId,
  }) async {
    final appConfig = await ref.read(appConfigServiceProvider.future);

    return _foodContainerService.recent(
      userId: userId,
      lookbackDuration: Duration(
        seconds:
            appConfig?.recentLookbackDurationSecs ??
            kDefaultRecentLookbackDurationSecs,
      ),
    );
  }

  @override
  Future<FoodContainer?> getById(String id) => Auth.guard(
    ref,
    (user) async {
      final fsModel = await _foodContainerService.get(id);

      return fsModel?.toDomain();
    },
  );

  @override
  Future<FoodContainer> save(FoodContainer container) => Auth.guard(
    ref,
    (user) async {
      final id = await _foodContainerService.save(
        FoodContainerFirestoreModel.fromDomain(container, user.uid),
      );

      emitChangeSignal();

      return container.id == id ? container : container.copyWith(id: id);
    },
  );

  @override
  Future<bool> delete(String id) => Auth.guard(
    ref,
    (user) async {
      final result = await _foodContainerService.delete(id);

      emitChangeSignal();

      return result;
    },
  );

  @override
  Future<bool> restore(String id) => Auth.guard(
    ref,
    (user) async {
      final result = await _foodContainerService.restore(id);

      emitChangeSignal();

      return result;
    },
  );

  Future<void> purge() => Auth.guard(
    ref,
    (user) => _foodContainerService.purge(userId: user.uid),
  );
}

final firestoreFoodContainerRepositoryProvider =
    NotifierProvider<FoodContainerRepository, ChangeSignal?>(
      FirestoreFoodContainerRepository.new,
    );
