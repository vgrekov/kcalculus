import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/_data/usda/_common/repositories/usda_food_repository.dart';
import 'package:kcalculus/data/providers.dart';
import 'package:kcalculus/domain/use_cases/edible_search_use_case.dart';
import 'package:kcalculus/domain/use_cases/maintenance/maintenance_state.dart';
import 'package:kcalculus/domain/use_cases/maintenance/maintenance_use_case.dart';

final maintenanceUseCaseProvider =
    NotifierProvider<MaintenanceUseCase, MaintenanceState>(
  MaintenanceUseCase.new,
);

final edibleSearchUseCaseProvider = Provider<EdibleSearchUseCase>(
  (ref) {
    final edibleRepository = ref.watch(edibleRepositoryProvider);
    final usdaFoodRepository = ref.watch(usdaFoodRepositoryProvider.notifier);
    return EdibleSearchUseCase(
      edibleRepository: edibleRepository,
      usdaFoodRepository: usdaFoodRepository,
    );
  },
);
