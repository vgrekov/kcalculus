import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/_common/repositories/food_container_repository.dart';
import 'package:kcalculus/_data/storage/local/food_container/dao/food_container_dao.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/domain/utils/change_signal.dart';
import 'package:kcalculus/domain/utils/page_config.dart';

class LocalFoodContainerRepository extends FoodContainerRepository {
  LocalFoodContainerDao get _dao =>
      ref.read(localFoodContainerDaoProvider.notifier);

  @override
  Future<List<FoodContainer>> search(
    String? query, {
    PageConfig<FoodContainer>? pageConfig,
  }) {
    return _dao.search(
      query,
      pageConfig: pageConfig,
    );
  }

  @override
  Future<FoodContainer?> getById(String id) {
    return _dao.getById(id);
  }

  @override
  Future<FoodContainer> save(FoodContainer container) async {
    final id = await _dao.save(container);

    emitChangeSignal();

    return (await getById(id))!;
  }

  @override
  Future<bool> delete(String id) async {
    final result = await _dao.delete(id);

    emitChangeSignal();

    return result;
  }

  @override
  Future<bool> restore(String id) async {
    final result = await _dao.restore(id);

    emitChangeSignal();

    return result;
  }
}

final localFoodContainerRepositoryProvider =
    NotifierProvider<FoodContainerRepository, ChangeSignal?>(
  LocalFoodContainerRepository.new,
);
