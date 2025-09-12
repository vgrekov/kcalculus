import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_view_view_model_arg.freezed.dart';

@freezed
sealed class FoodViewViewModelArg with _$FoodViewViewModelArg {
  const factory FoodViewViewModelArg({
    required String foodId,
    required bool isUsdaFood,
  }) = _FoodViewViewModelArg;
}
