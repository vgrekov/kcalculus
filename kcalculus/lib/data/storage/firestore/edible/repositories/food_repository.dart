import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/edible/dao/edible_dao.dart';
import 'package:kcalculus/data/storage/firestore/edible/dao/food_dao.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/food/models/food.dart';

class FirestoreFoodRepository extends FoodRepository {
  FirestoreEdibleService get _edibleService =>
      ref.read(firestoreEdibleServiceProvider.notifier);

  FirestoreEdibleDao get _edibleDao =>
      ref.read(firestoreEdibleDaoProvider.notifier);

  FirestoreFoodDao get _foodDao => ref.read(firestoreFoodDaoProvider.notifier);

  @override
  Future<Food?> getById(String id) => Auth.guard(
    ref,
    (user) async {
      final edible = await _edibleDao.getById(id);
      return edible is Food ? edible : null;
    },
  );

  @override
  Future<Food> save(
    Food food, {
    bool skipAudit = false,
  }) => Auth.guard(
    ref,
    (user) async {
      final id = await _foodDao.save(
        food,
        userId: user.uid,
        skipAudit: skipAudit,
      );

      emitChangeSignal();

      return food.id == id ? food : food.copyWith(id: id);
    },
  );

  Future<void> import(Food food) => Auth.guard(
    ref,
    (user) => _edibleService.import(
      EdibleFirestoreModel.fromDomainFood(food, user.uid),
    ),
  );

  @override
  Future<bool> delete(String id) => Auth.guard(
    ref,
    (user) async {
      final result = await _edibleService.delete(id);

      emitChangeSignal();

      return result;
    },
  );

  @override
  Future<bool> restore(String id) => Auth.guard(
    ref,
    (user) async {
      final result = await _edibleService.restore(id);

      emitChangeSignal();

      return result;
    },
  );
}

final firestoreFoodRepositoryProvider =
    NotifierProvider<FirestoreFoodRepository, ChangeSignal?>(
      FirestoreFoodRepository.new,
    );
