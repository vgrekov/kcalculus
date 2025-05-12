import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/meal.dart';

part 'meal_save_view_model_arg.freezed.dart';

@freezed
class MealSaveViewModelArg with _$MealSaveViewModelArg {
  const factory MealSaveViewModelArg({
    Meal? meal,
    DateTime? date,
  }) = _MealSaveViewModelArg;
}
