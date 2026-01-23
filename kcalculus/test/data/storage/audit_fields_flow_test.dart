import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kcalculus/data/_common/database/models/database_config.dart';
import 'package:kcalculus/data/_common/database/services/database_service.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/data/storage/firestore/_common/models/amount_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/_common/providers.dart';
import 'package:kcalculus/data/storage/firestore/edible/dao/edible_dao.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/edible_type.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/meal_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/models/nutrition_facts_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/dish_repository.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/food_repository.dart';
import 'package:kcalculus/data/storage/firestore/edible/repositories/meal_repository.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/edible_service.dart';
import 'package:kcalculus/data/storage/firestore/edible/services/meal_service.dart';
import 'package:kcalculus/data/storage/local/dish/repositories/dish_repository.dart';
import 'package:kcalculus/data/storage/local/edible/dao/nutrition_facts_dao.dart';
import 'package:kcalculus/data/storage/local/food/repositories/food_repository.dart';
import 'package:kcalculus/data/storage/local/meal/repositories/meal_repository.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/food/models/food.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_amount.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient_data.dart';
import 'package:kcalculus/domain/nutrition/models/nutrition_facts.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;
import 'package:mocktail/mocktail.dart';

import '../../mocks.dart';

part 'audit_fields_flow_test.dish.dart';
part 'audit_fields_flow_test.food.dart';
part 'audit_fields_flow_test.meal.dart';

final _kDefaultNf = NutritionFacts(
  amount: Amount(unit: Unit.gram, value: 100),
  nutrientData: NutrientData(
    nutrientAmounts: [
      NutrientAmount(
        nutrient: Nutrient.energy,
        amount: Amount(
          unit: Unit.calorie,
          value: 100,
        ),
      ),
      NutrientAmount(
        nutrient: Nutrient.fat,
        amount: Amount(
          unit: Unit.gram,
          value: 4,
        ),
      ),
      NutrientAmount(
        nutrient: Nutrient.totalCarbs,
        amount: Amount(
          unit: Unit.gram,
          value: 10,
        ),
      ),
      NutrientAmount(
        nutrient: Nutrient.fiber,
        amount: Amount(
          unit: Unit.gram,
          value: 1,
        ),
      ),
      NutrientAmount(
        nutrient: Nutrient.protein,
        amount: Amount(
          unit: Unit.gram,
          value: 9,
        ),
      ),
    ],
  ),
);

final _kUser = MockUser(uid: 'user-id');

final _kDbConfigFallback = DatabaseConfig(
  name: '',
  version: 0,
  migrationsDir: '',
);

final _kEdibleFirestoreModelFallback = EdibleFirestoreModel(
  type: EdibleType.food,
  name: '',
  description: '',
  nutritionFacts: [
    NutritionFactsFirestoreModel.fromDomain(_kDefaultNf),
  ],
  ownerId: '',
);

final _kMealFirestoreModelFallback = MealFirestoreModel(
  amount: AmountFirestoreModel(unit: 'gram', value: 100),
  eatenAt: DateTime.now(),
  edibleId: '',
);

void main() {
  foodTests();

  dishTests();

  mealTests();
}

void _stubQuery(
  MockDatabase db,
  String table,
  List<Map<String, Object?>> results,
) {
  when(
    () => db.rawQuery(
      any(
        that: matches(
          RegExp(
            'FROM\\s+$table',
            caseSensitive: false,
          ),
        ),
      ),
      any(),
    ),
  ).thenAnswer(
    (_) async => results,
  );
}
