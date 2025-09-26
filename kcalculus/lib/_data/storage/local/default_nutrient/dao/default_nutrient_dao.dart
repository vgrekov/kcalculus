import 'package:kcalculus/_data/storage/local/default_nutrient/converters/default_nutrient_converter.dart';
import 'package:kcalculus/data/services/local/database/database_service.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';
import 'package:sqflite/sqflite.dart';

class LocalDefaultNutrientDao {
  const LocalDefaultNutrientDao({
    required DatabaseService dbService,
    required LocalDefaultNutrientConverter defaultNutrientConverter,
  })  : _dbService = dbService,
        _defaultNutrientConverter = defaultNutrientConverter;

  final DatabaseService _dbService;

  final LocalDefaultNutrientConverter _defaultNutrientConverter;

  Future<List<Nutrient>> getAll({
    Transaction? txn,
  }) async {
    final dbModels = await _dbService.defaultNutrient.getAll(txn: txn);
    return _defaultNutrientConverter.toModels(dbModels);
  }

  Future<void> saveAll(
    List<Nutrient> models, {
    Transaction? txn,
  }) {
    return _dbService.defaultNutrient.saveAll(
      _defaultNutrientConverter.toDbModels(models),
    );
  }
}
