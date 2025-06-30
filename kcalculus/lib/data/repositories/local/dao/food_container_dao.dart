import 'package:kcalculus/data/exceptions/duplication_exception.dart';
import 'package:kcalculus/data/repositories/local/converters/food_container_converter.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/utils/ids.dart';
import 'package:sqflite/sqflite.dart';

class LocalFoodContainerDao {
  LocalFoodContainerDao({
    required DatabaseService dbService,
    required LocalFoodContainerConverter containerConverter,
  })  : _dbService = dbService,
        _containerConverter = containerConverter;

  final DatabaseService _dbService;

  final LocalFoodContainerConverter _containerConverter;

  Future<List<FoodContainer>> search(
    String? query, {
    int? limit,
    int? offset,
    Transaction? txn,
  }) {
    return _dbService.foodContainer
        .search(
          query,
          limit: limit,
          offset: offset,
          txn: txn,
        )
        .then(
          (data) => data.map(_containerConverter.toModel).toList(),
        );
  }

  Future<FoodContainer?> getById(
    String id, {
    Transaction? txn,
  }) async {
    final dbModel = await _dbService.foodContainer.getById(id, txn: txn);
    if (dbModel != null) {
      return _containerConverter.toModel(
        dbModel,
      );
    }

    return null;
  }

  Future<String> save(
    FoodContainer container, {
    String? id,
    Transaction? txn,
  }) {
    if (txn != null) {
      return _save(container, id: id, txn: txn);
    } else {
      return _dbService.transaction(
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

    final dbModel = _containerConverter.toDbModel(container, containerId);

    if (container.id == null) {
      await _dbService.foodContainer.add(dbModel, txn: txn);
    } else {
      await _dbService.foodContainer.update(dbModel, txn: txn);
    }

    return containerId;
  }

  Future<void> _checkForDuplication(
    FoodContainer model, {
    Transaction? txn,
  }) async {
    final alreadyExists = await _dbService.foodContainer.exists(
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
    return _dbService.foodContainer.delete(id, txn: txn);
  }

  Future<bool> restore(
    String id, {
    Transaction? txn,
  }) {
    return _dbService.foodContainer.restore(id, txn: txn);
  }
}
