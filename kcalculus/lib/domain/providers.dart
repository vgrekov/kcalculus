import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/use_cases/edible_search_use_case.dart';

final edibleSearchUseCaseProvider = Provider<EdibleSearchUseCase>(
  (ref) {
    final edibleRepository = ref.watch(edibleRepositoryProvider);
    final usdaFoodRepository = ref.watch(usdaFoodRepositoryProvider);
    return EdibleSearchUseCase(
      edibleRepository: edibleRepository,
      usdaFoodRepository: usdaFoodRepository,
    );
  },
);
