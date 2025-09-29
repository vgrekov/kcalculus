// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'usda_portion_db_model.freezed.dart';
part 'usda_portion_db_model.g.dart';

@freezed
sealed class UsdaPortionDbModel with _$UsdaPortionDbModel {
  const factory UsdaPortionDbModel({
    required int fdc_id,
    required int measure_unit_id,
    double? amount,
    required double gram_weight,
  }) = _UsdaPortionDbModel;

  factory UsdaPortionDbModel.fromJson(Map<String, dynamic> json) =>
      _$UsdaPortionDbModelFromJson(json);
}
