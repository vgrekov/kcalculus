import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/models/nutrition/nutrient.dart';

part 'nutrient_search_view_model_arg.freezed.dart';

@freezed
class NutrientSearchViewModelArg with _$NutrientSearchViewModelArg {
  const factory NutrientSearchViewModelArg({
    @Default('') String intialQuery,
    @Default([]) List<Nutrient> exceptions,
  }) = _NutrientSearchVewModelArg;
}
