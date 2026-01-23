import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_type_router.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/edible_repository.dart';
import 'package:kcalculus/data/storage/local/edible/repositories/edible_repository.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/edible/models/edible_preview.dart';

abstract class EdibleRepository extends Notifier<void> {
  @override
  void build() {}

  Future<bool> isEmpty();

  Future<List<EdiblePreview>> getAll({
    bool includeDeleted = false,
    PageConfig<EdiblePreview>? pageConfig,
  });

  Future<List<EdiblePreview>> search(
    String? query, {
    PageConfig<EdiblePreview>? pageConfig,
  });

  Future<int> count([String? query]);

  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  });

  Future<bool> wasEaten(String id);

  FutureOr<bool> isMissingNutritionFactsPreviews();

  Future<List<EdiblePreview>> findEdiblesWithoutNutritionFactsPreviews();
}

class _EdibleRepository extends EdibleRepository
    with StorageTypeRouter<EdibleRepository, void> {
  @override
  void build() {
    buildDependencies();
  }

  @override
  Future<bool> isEmpty() async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).isEmpty();
  }

  @override
  NotifierProvider<EdibleRepository, void> buildDelegateProvider(
    StorageType storageType,
  ) => switch (storageType) {
    StorageType.local => localEdibleRepositoryProvider,
    StorageType.firestore => firestoreEdibleRepositoryProvider,
  };

  @override
  Future<List<EdiblePreview>> getAll({
    bool includeDeleted = false,
    PageConfig<EdiblePreview>? pageConfig,
  }) async {
    final provider = await delegateProvider;

    return ref
        .read(provider.notifier)
        .getAll(
          includeDeleted: includeDeleted,
          pageConfig: pageConfig,
        );
  }

  @override
  Future<List<EdiblePreview>> search(
    String? query, {
    PageConfig<EdiblePreview>? pageConfig,
  }) async {
    final provider = await delegateProvider;

    return ref
        .read(provider.notifier)
        .search(
          query,
          pageConfig: pageConfig,
        );
  }

  @override
  Future<int> count([String? query]) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).count(query);
  }

  @override
  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  }) async {
    final provider = await delegateProvider;

    return ref
        .read(provider.notifier)
        .exists(
          name,
          description,
          exceptWithId: exceptWithId,
        );
  }

  @override
  Future<bool> wasEaten(String id) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).wasEaten(id);
  }

  @override
  FutureOr<bool> isMissingNutritionFactsPreviews() async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).isMissingNutritionFactsPreviews();
  }

  @override
  Future<List<EdiblePreview>> findEdiblesWithoutNutritionFactsPreviews() async {
    final provider = await delegateProvider;

    return ref
        .read(provider.notifier)
        .findEdiblesWithoutNutritionFactsPreviews();
  }
}

final edibleRepositoryProvider = NotifierProvider<EdibleRepository, void>(
  _EdibleRepository.new,
);
