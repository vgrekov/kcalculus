part of '../../../providers.dart';

// Converters

final _localEdibleSearchResultConverter = Provider(
  (ref) => LocalEdibleSearchResultConverter(),
);

final _localNutritionFactsConverterProvider = Provider(
  (ref) => LocalNutritionFactsConverter(),
);

final _localFoodConverterProvider = Provider(
  (ref) {
    final nutritionFactsConverter =
        ref.watch(_localNutritionFactsConverterProvider);
    return LocalFoodConverter(
      nutritionFactsConverter: nutritionFactsConverter,
    );
  },
);

final _localIngredientConverterProvider = Provider(
  (ref) => LocalIngredientConverter(),
);

final _localDishConverterProvider = Provider(
  (ref) => LocalDishConverter(),
);

final _localMealConverterProvider = Provider(
  (ref) => LocalMealConverter(),
);

final _localContainerConverterProvider = Provider(
  (ref) => LocalFoodContainerConverter(),
);
