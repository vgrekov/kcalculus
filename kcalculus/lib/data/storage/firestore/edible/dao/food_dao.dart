import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/utils/dish_utils.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/edible/dao/edible_dao.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/domain/_common/exceptions/duplication_exception.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/food/models/food.dart';

class FirestoreFoodDao extends Notifier<void> {
  @override
  void build() {}

  FirebaseFirestore get _db => ref.read(firestoreProvider);

  FirestoreEdibleService get _edibleService =>
      ref.read(firestoreEdibleServiceProvider.notifier);

  FirestoreEdibleDao get _edibleDao =>
      ref.read(firestoreEdibleDaoProvider.notifier);

  Future<String> save(
    Food food, {
    required String userId,
    Transaction? txn,
    bool skipAudit = false,
  }) => (txn != null)
      ? _save(food, userId: userId, txn: txn, skipAudit: skipAudit)
      : _db.runTransaction(
          (txn) => _save(food, userId: userId, txn: txn, skipAudit: skipAudit),
        );

  Future<String> _save(
    Food food, {
    required String userId,
    required Transaction txn,
    bool skipAudit = false,
  }) async {
    final alreadyExists = await _edibleService.exists(
      food.name,
      food.description,
      userId: userId,
      exceptWithId: food.id,
    );

    if (alreadyExists) {
      throw DuplicationException(food);
    }

    final dependencyUpdates = await prepareIngredientDependencyUpdates(
      food,
      getDishesByIngredient: (id) =>
          _edibleService.getDishesByIngredient(id, userId: userId),
      getDish: (id) async {
        final edible = await _edibleDao.getById(id);
        return edible is Dish ? edible : null;
      },
    );

    final id = await _edibleService.save(
      EdibleFirestoreModel.fromDomainFood(food, userId),
      skipAudit: skipAudit,
    );

    await Future.wait(
      dependencyUpdates.map(
        (model) => _edibleService.updateNutritionFactsPreview(
          EdibleFirestoreModel.fromDomainDish(model, userId),
          txn: txn,
        ),
      ),
    );

    return id;
  }
}

final firestoreFoodDaoProvider = NotifierProvider<FirestoreFoodDao, void>(
  FirestoreFoodDao.new,
);
