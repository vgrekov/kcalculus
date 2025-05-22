import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/domain/models/units.dart';

part 'food_container_save_ui_state.freezed.dart';

@freezed
class FoodContainerSaveUiState with _$FoodContainerSaveUiState {
  const FoodContainerSaveUiState._();

  const factory FoodContainerSaveUiState({
    String? id,
    @Default('') String name,
    @Default('') String description,
    @Default(Unit.gram) Unit weightUnit,
    double? weightValue,
  }) = _FoodContainerSaveUiState;

  FoodContainer toFoodContainer() {
    return FoodContainer(
      id: id,
      name: name,
      description: description,
      weight: Amount(
        unit: weightUnit,
        value: weightValue!,
      ),
    );
  }
}
