import 'package:kcalculus/_data/storage/_common/repositories/nutrient_repository.dart';
import 'package:kcalculus/_data/storage/local/default_nutrient/dao/default_nutrient_dao.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

class LocalNutrientRepository implements NutrientRepository {
  const LocalNutrientRepository({
    required LocalDefaultNutrientDao defaultNutrientDao,
  }) : _defaultNutrientDao = defaultNutrientDao;

  final LocalDefaultNutrientDao _defaultNutrientDao;

  @override
  Future<List<Nutrient>> getDefaults() {
    return _defaultNutrientDao.getAll();
  }

  @override
  Future<void> saveDefaults(List<Nutrient> nutrients) {
    return _defaultNutrientDao.saveAll(nutrients);
  }
}
