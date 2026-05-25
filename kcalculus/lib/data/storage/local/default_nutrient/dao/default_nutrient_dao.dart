import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/default_nutrient/converters/default_nutrient_converter.dart';
import 'package:kcalculus/data/storage/local/default_nutrient/services/default_nutrient_service.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:sqflite/sqflite.dart';

class LocalDefaultNutrientDao extends AsyncNotifier<List<Nutrient>> {
  @override
  FutureOr<List<Nutrient>> build() async {
    return ref.watch(
      localDefaultNutrientServiceProvider.selectAsync(
        _defaultNutrientConverter.toModels,
      ),
    );
  }

  LocalDefaultNutrientService get _defaultNutrientService =>
      ref.read(localDefaultNutrientServiceProvider.notifier);

  LocalDefaultNutrientConverter get _defaultNutrientConverter =>
      ref.read(localDefaultNutrientConverterProvider.notifier);

  Future<void> saveAll(
    List<Nutrient> models, {
    Transaction? txn,
  }) {
    return _defaultNutrientService.saveAll(
      _defaultNutrientConverter.toDbModels(models),
    );
  }
}

final localDefaultNutrientDaoProvider =
    AsyncNotifierProvider<LocalDefaultNutrientDao, List<Nutrient>>(
      LocalDefaultNutrientDao.new,
    );
