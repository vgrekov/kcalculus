import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/models/storage_type.dart';
import 'package:kcalculus/data/storage/_common/providers.dart';
import 'package:kcalculus/data/storage/local/edible/repositories/edible_repository.dart';
import 'package:kcalculus/domain/edible/models/edible_search_result.dart';

abstract class EdibleRepository extends Notifier<void> {
  @override
  void build() {}

  Future<List<EdibleSearchResult>> search(
    String? query, {
    EdibleSearchResultType? type,
    int? limit,
    int? offset,
  });

  Future<int> count(
    String? query, {
    EdibleSearchResultType? type,
  });

  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  });

  Future<bool> wasEaten(String id);

  FutureOr<bool> isMissingNutritionFactsPreviews();

  Future<List<EdibleSearchResult>> findEdiblesWithoutNutritionFactsPreviews();
}

class _EdibleRepository extends EdibleRepository {
  @override
  void build() {
    ref.watch(storageTypeProvider);
    ref.watch(localEdibleRepositoryProvider);
    // TODO: Firestore
  }

  Future<NotifierProvider<EdibleRepository, void>> get _providerImpl async {
    final storageType = await ref.read(storageTypeProvider.future);

    return switch (storageType) {
      StorageType.local => localEdibleRepositoryProvider,
      // TODO: Firestore
      StorageType.firestore => localEdibleRepositoryProvider,
    };
  }

  @override
  Future<List<EdibleSearchResult>> search(
    String? query, {
    EdibleSearchResultType? type,
    int? limit,
    int? offset,
  }) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).search(
          query,
          type: type,
          limit: limit,
          offset: offset,
        );
  }

  @override
  Future<int> count(
    String? query, {
    EdibleSearchResultType? type,
  }) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).count(
          query,
          type: type,
        );
  }

  @override
  Future<bool> exists(
    String name,
    String description, {
    String? exceptWithId,
  }) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).exists(
          name,
          description,
          exceptWithId: exceptWithId,
        );
  }

  @override
  Future<bool> wasEaten(String id) async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).wasEaten(id);
  }

  @override
  FutureOr<bool> isMissingNutritionFactsPreviews() async {
    final provider = await _providerImpl;

    return ref.read(provider.notifier).isMissingNutritionFactsPreviews();
  }

  @override
  Future<List<EdibleSearchResult>>
      findEdiblesWithoutNutritionFactsPreviews() async {
    final provider = await _providerImpl;

    return ref
        .read(provider.notifier)
        .findEdiblesWithoutNutritionFactsPreviews();
  }
}

final edibleRepositoryProvider = NotifierProvider<EdibleRepository, void>(
  _EdibleRepository.new,
);
