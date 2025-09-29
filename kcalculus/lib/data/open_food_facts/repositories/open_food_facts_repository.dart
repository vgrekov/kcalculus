import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/open_food_facts/services/open_food_facts_service.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

class OpenFoodFactsRepository extends Notifier<void> {
  @override
  void build() {}

  Future<Food?> getFoodByBarcode(
    String barcode,
    List<Nutrient> nutrientDefaults,
  ) async {
    final service = ref.read(openFoodFactsServiceProvider.notifier);
    final product = await service.getProductByBarcode(barcode);

    return product?.toDomain(
      nutrientDefaults: nutrientDefaults,
    );
  }
}

final openFoodFactsRepositoryProvider =
    NotifierProvider<OpenFoodFactsRepository, void>(
  OpenFoodFactsRepository.new,
);
