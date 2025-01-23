part of '../../../providers.dart';

// Converters

final _localNutritionFactsConverter = Provider(
  (ref) => LocalNutritionFactsConverter(),
);

final _localFoodConverter = Provider(
  (ref) {
    final nutritionFactsConverter = ref.watch(_localNutritionFactsConverter);
    return LocalFoodConverter(
      nutritionFactsConverter: nutritionFactsConverter,
    );
  },
);

final _localIngredientConverter = Provider(
  (ref) => LocalIngredientConverter(),
);

final _localDishConverter = Provider(
  (ref) => LocalDishConverter(),
);

final _localMealConverter = Provider(
  (ref) => LocalMealConverter(),
);
