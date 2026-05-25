import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/edible/dao/dish_dao.dart';
import 'package:kcalculus/data/storage/firestore/edible/dao/edible_dao.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';

class FirestoreDishRepository extends DishRepository {
  FirestoreEdibleService get _edibleService =>
      ref.read(firestoreEdibleServiceProvider.notifier);

  FirestoreEdibleDao get _edibleDao =>
      ref.read(firestoreEdibleDaoProvider.notifier);

  FirestoreDishDao get _dishDao => ref.read(firestoreDishDaoProvider.notifier);

  @override
  Future<Dish?> getById(String id) => Auth.guard(
    ref,
    (user) async {
      final edible = await _edibleDao.getById(id);
      return edible is Dish ? edible : null;
    },
  );

  @override
  Future<Dish> save(
    Dish dish, {
    bool skipAudit = false,
  }) => Auth.guard(
    ref,
    (user) async {
      final id = await _dishDao.save(
        dish,
        user: user,
        skipAudit: skipAudit,
      );

      emitChangeSignal();

      return (await getById(id))!;
    },
  );

  Future<void> import(Dish dish) => Auth.guard(
    ref,
    (user) => _edibleService.import(
      EdibleFirestoreModel.fromDomainDish(dish, user.uid),
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

final firestoreDishRepositoryProvider =
    NotifierProvider<FirestoreDishRepository, ChangeSignal?>(
      FirestoreDishRepository.new,
    );
