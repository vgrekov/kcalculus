part of '../../../providers.dart';

// Converters

final _localEdibleSearchResultConverter = Provider(
  (ref) => LocalEdibleSearchResultConverter(),
);

final _localNutrientAmountConverterProvider = Provider(
  (ref) => LocalNutrientAmountConverter(),
);

final _localNutritionFactsConverterProvider = Provider(
  (ref) {
    final nutrientAmountConverter =
        ref.watch(_localNutrientAmountConverterProvider);
    return LocalNutritionFactsConverter(
      nutritionAmountConverter: nutrientAmountConverter,
    );
  },
);

final _localFoodConverterProvider = Provider(
  (ref) {
    return LocalFoodConverter();
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

final _localFoodContainerConverterProvider = Provider(
  (ref) => LocalFoodContainerConverter(),
);

final _localDefaultNutrientConverterProvider = Provider(
  (ref) => LocalDefaultNutrientConverter(),
);
