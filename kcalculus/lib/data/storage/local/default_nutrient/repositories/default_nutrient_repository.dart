import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/_common/repositories/default_nutrient_repository.dart';
import 'package:kcalculus/data/storage/local/default_nutrient/dao/default_nutrient_dao.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';

class LocalDefaultNutrientRepository extends DefaultNutrientRepository {
  @override
  FutureOr<List<Nutrient>> build() {
    ref.watch(localDefaultNutrientDaoProvider);

    return ref.read(localDefaultNutrientDaoProvider.future);
  }

  LocalDefaultNutrientDao get _defaultNutrientDao =>
      ref.read(localDefaultNutrientDaoProvider.notifier);

  @override
  Future<void> saveAll(List<Nutrient> nutrients) {
    return _defaultNutrientDao.saveAll(nutrients);
  }
}

final localDefaultNutrientRepositoryProvider =
    AsyncNotifierProvider<DefaultNutrientRepository, List<Nutrient>>(
  LocalDefaultNutrientRepository.new,
);
