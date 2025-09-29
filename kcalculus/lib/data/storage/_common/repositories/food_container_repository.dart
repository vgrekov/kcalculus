import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/providers.dart';
import 'package:kcalculus/data/storage/_common/repositories/change_signal_notifier.dart';
import 'package:kcalculus/data/storage/firestore/food_container/repositories/food_container_repository.dart';
import 'package:kcalculus/data/storage/local/food_container/repositories/food_container_repository.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/domain/utils/change_signal.dart';
import 'package:kcalculus/domain/utils/page_config.dart';

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

final foodContainerChangesProvider = Provider<ChangeSignal>(
  (ref) {
    ref.watch(storageTypeProvider);

    ref.watch(localFoodContainerRepositoryProvider);
    ref.watch(firestoreFoodContainerRepositoryProvider);

    return ChangeSignal();
  },
);

final foodContainerRepositoryProvider = FutureProvider<FoodContainerRepository>(
  (ref) async {
    ref.watch(storageTypeProvider);

    final storageType = await ref.read(storageTypeProvider.future);

    return switch (storageType) {
      StorageType.local => ref.read(
          localFoodContainerRepositoryProvider.notifier,
        ),
      StorageType.firestore => ref.read(
          firestoreFoodContainerRepositoryProvider.notifier,
        ),
    };
  },
);
