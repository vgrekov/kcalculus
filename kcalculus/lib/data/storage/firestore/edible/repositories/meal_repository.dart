import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/edible/dao/dish_dao.dart';
import 'package:kcalculus/data/storage/firestore/edible/dao/edible_dao.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/meal_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/meal_service.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/_common/models/change_signal.dart';
import 'package:kcalculus/domain/_common/models/page_config.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/food/models/food.dart';
import 'package:kcalculus/domain/meal/models/meal.dart';

class FirestoreMealRepository extends MealRepository {
  FirebaseFirestore get _db => ref.read(firestoreProvider);

  FirestoreEdibleService get _edibleService =>
      ref.read(firestoreEdibleServiceProvider.notifier);

  FirestoreEdibleDao get _edibleDao =>
      ref.read(firestoreEdibleDaoProvider.notifier);

  FirestoreDishDao get _dishDao => ref.read(firestoreDishDaoProvider.notifier);

  FirestoreMealService get _mealService =>
      ref.read(firestoreMealServiceProvider.notifier);

  @override
  Future<bool> isEmpty() => Auth.guard(
    ref,
    (user) => _mealService.isEmpty(
      userId: user.uid,
    ),
  );

  @override
  Future<List<Meal>> getAll({
    bool includeDeleted = false,
    PageConfig<Meal>? pageConfig,
  }) => Auth.guard(
    ref,
    (user) => _mealService
        .all(
          userId: user.uid,
          includeDeleted: includeDeleted,
          pageConfig: pageConfig == null
              ? null
              : PageConfig<MealFirestoreModel>(
                  size: pageConfig.size,
                  offset: pageConfig.offset,
                  startAfter: pageConfig.startAfter == null
                      ? null
                      : MealFirestoreModel.fromDomain(
                          pageConfig.startAfter!,
                        ),
                ),
        )
        .then(
          (meals) => Future.wait(
            meals.map(
              (meal) async => meal.toDomain(
                (await _edibleDao.getById(
                  meal.edibleId,
                  user: user,
                ))!,
              ),
            ),
          ),
        ),
  );

  @override
  Future<List<Meal>> getByDate(DateTime date) => Auth.guard(
    ref,
    (user) => _mealService
        .getByDate(date, userId: user.uid)
        .then(
          (meals) => Future.wait(
            meals.map(
              (meal) async => meal.toDomain(
                (await _edibleDao.getById(
                  meal.edibleId,
                  user: user,
                ))!,
              ),
            ),
          ),
        ),
  );

  @override
  Future<Meal> save(Meal meal) => Auth.guard(
    ref,
    (user) async {
      final id = await _db.runTransaction((txn) async {
        DateTime? edibleEatenAt;

        if (meal.edible.id == null) {
          var edible = meal.edible;

          switch (edible) {
            case Food food:
              edible = food.copyWith(
                id: await _edibleService.save(
                  EdibleFirestoreModel.fromDomain(meal.edible, user.uid),
                  txn: txn,
                ),
              );
              break;
            case Dish dish:
              edible = dish.copyWith(
                id: await _dishDao.save(
                  dish,
                  user: user,
                  txn: txn,
                ),
              );
              break;
          }

          meal = meal.copyWith(edible: edible);
        } else {
          final fsEdible = await _edibleService.get(meal.edible.id!, txn: txn);
          edibleEatenAt = fsEdible?.eatenAt;
        }

        final id = await _mealService.save(
          MealFirestoreModel.fromDomain(meal),
          userId: user.uid,
          txn: txn,
        );

        if (edibleEatenAt?.isBefore(meal.eatenAt) ?? true) {
          await _edibleService.markEaten(
            meal.edible.id!,
            at: meal.eatenAt,
            txn: txn,
          );
        }

        return id;
      });

      emitChangeSignal();

      return (await _getById(id, user: user))!;
    },
  );

  Future<Meal?> _getById(
    String id, {
    required User user,
  }) async {
    final fsModel = await _mealService.get(id, userId: user.uid);

    if (fsModel == null) return null;

    final edible = await _edibleDao.getById(
      fsModel.edibleId,
      user: user,
    );

    return edible == null ? null : fsModel.toDomain(edible);
  }

  @override
  Future<bool> delete(String id) => Auth.guard(
    ref,
    (user) async {
      final result = await _mealService.delete(id, userId: user.uid);

      emitChangeSignal();

      return result;
    },
  );

  @override
  Future<bool> restore(String id) => Auth.guard(
    ref,
    (user) async {
      final result = await _mealService.restore(id, userId: user.uid);

      emitChangeSignal();

      return result;
    },
  );

  Future<void> purge() => Auth.guard(
    ref,
    (user) => _mealService.purge(userId: user.uid),
  );
}

final firestoreMealRepositoryProvider =
    NotifierProvider<MealRepository, ChangeSignal?>(
      FirestoreMealRepository.new,
    );
