// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_api_model.freezed.dart';
part 'product_api_model.g.dart';

@freezed
sealed class ProductApiModel with _$ProductApiModel {
  const factory ProductApiModel({
    required String product_name,
    String? brands,
    String? serving_quantity_unit,
    Object? serving_quantity,
    String? nutrition_data_per,
    Map<String, dynamic>? nutriments,
  }) = _ProductApiModel;

  factory ProductApiModel.fromJson(Map<String, dynamic> json) =>
      _$ProductApiModelFromJson(json);
}
