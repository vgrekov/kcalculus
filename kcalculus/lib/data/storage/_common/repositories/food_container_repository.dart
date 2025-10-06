import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/utils/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_type_router.dart';
import 'package:kcalculus/data/storage/firestore/food_container/repositories/food_container_repository.dart';
import 'package:kcalculus/data/storage/local/food_container/repositories/food_container_repository.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';

abstract class FoodContainerRepository extends ChangeSignalNotifier {
  Future<List<FoodContainer>> search(
    String? query, {
    PageConfig<FoodContainer>? pageConfig,
  });

  Future<FoodContainer?> getById(String id);

  Future<FoodContainer> save(FoodContainer container);

  Future<bool> delete(String id);

  Future<bool> restore(String id);
}

class _FoodContainerRepository extends FoodContainerRepository
    with StorageTypeRouter<FoodContainerRepository, ChangeSignal?> {
  @override
  ChangeSignal? build() {
    buildDependencies();

    return ChangeSignal();
  }

  @override
  NotifierProvider<FoodContainerRepository, ChangeSignal?>
      buildDelegateProvider(
    StorageType storageType,
  ) =>
          switch (storageType) {
            StorageType.local => localFoodContainerRepositoryProvider,
            StorageType.firestore => firestoreFoodContainerRepositoryProvider,
          };

  @override
  Future<List<FoodContainer>> search(
    String? query, {
    PageConfig<FoodContainer>? pageConfig,
  }) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).search(
          query,
          pageConfig: pageConfig,
        );
  }

  @override
  Future<FoodContainer?> getById(String id) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).getById(id);
  }

  @override
  Future<FoodContainer> save(FoodContainer container) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).save(container);
  }

  @override
  Future<bool> delete(String id) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).delete(id);
  }

  @override
  Future<bool> restore(String id) async {
    final provider = await delegateProvider;

    return ref.read(provider.notifier).restore(id);
  }
}

final foodContainerRepositoryProvider =
    NotifierProvider<FoodContainerRepository, ChangeSignal?>(
  _FoodContainerRepository.new,
);
