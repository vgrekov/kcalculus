import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/storage/_common/exceptions/duplication_exception.dart';
import 'package:kcalculus/_data/storage/local/_common/services/local_storage_service.dart';
import 'package:kcalculus/_data/storage/local/food_container/converters/food_container_converter.dart';
import 'package:kcalculus/_data/storage/local/food_container/models/food_container_db_model.dart';
import 'package:kcalculus/_data/storage/local/food_container/services/food_container_service.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/domain/utils/page_config.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalFoodContainerDao extends Notifier<void> {
  @override
  void build() {}

  LocalFoodContainerService get _service =>
      ref.read(localFoodContainerServiceProvider.notifier);

  LocalFoodContainerConverter get _converter =>
      ref.read(localFoodContainerConverterProvider.notifier);

  Future<List<FoodContainer>> search(
    String? query, {
    PageConfig<FoodContainer>? pageConfig,
    Transaction? txn,
  }) {
    return _service
        .search(
          query,
          pageConfig: pageConfig == null
              ? null
              : PageConfig<FoodContainerDbModel>(
                  size: pageConfig.size,
                  offset: pageConfig.offset,
                  startAfter: pageConfig.startAfter == null
                      ? null
                      : _converter.toDbModel(pageConfig.startAfter!),
                ),
          txn: txn,
        )
        .then(
          (data) => data.map(_converter.toModel).toList(),
        );
  }

  Future<FoodContainer?> getById(
    String id, {
    Transaction? txn,
  }) async {
    final dbModel = await _service.getById(id, txn: txn);
    if (dbModel != null) {
      return _converter.toModel(
        dbModel,
      );
    }

    return null;
  }

  Future<String> save(
    FoodContainer container, {
    String? id,
    Transaction? txn,
  }) async {
    if (txn != null) {
      return _save(container, id: id, txn: txn);
    } else {
      final db = await ref.read(localStorageServiceProvider.future);

      return db.transaction(
        (txn) => _save(container, id: id, txn: txn),
      );
    }
  }

  Future<String> _save(
    FoodContainer container, {
    String? id,
    required Transaction txn,
  }) async {
    await _checkForDuplication(container, txn: txn);

    final containerId = id ?? container.id ?? generateId();

    final dbModel = _converter.toDbModel(container, containerId);

    if (container.id == null) {
      await _service.add(dbModel, txn: txn);
    } else {
      await _service.update(dbModel, txn: txn);
    }

    return containerId;
  }

  Future<void> _checkForDuplication(
    FoodContainer model, {
    Transaction? txn,
  }) async {
    final alreadyExists = await _service.exists(
      model.name,
      model.description,
      exceptWithId: model.id,
      txn: txn,
    );

    if (alreadyExists) {
      throw DuplicationException();
    }
  }

  Future<bool> delete(
    String id, {
    Transaction? txn,
  }) {
    return _service.delete(id, txn: txn);
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) {
    return _service.restore(id, txn: txn);
  }
}

final localFoodContainerDaoProvider =
    NotifierProvider<LocalFoodContainerDao, void>(
  LocalFoodContainerDao.new,
);
