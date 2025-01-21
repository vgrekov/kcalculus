// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edible_db_model.freezed.dart';
part 'edible_db_model.g.dart';

@freezed
sealed class EdibleDbModel with _$EdibleDbModel {
  factory EdibleDbModel({
    required String id,
    required String name,
    String? description,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? created_at,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? updated_at,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? deleted_at,
  }) = _EdibleDbModel;

  factory EdibleDbModel.food({
    required String id,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    required String name,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? description,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? created_at,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? updated_at,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? deleted_at,
  }) = FoodDbModel;

  factory EdibleDbModel.dish({
    required String id,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    required String name,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? description,
    String? mass_per_amount_unit,
    double? mass_per_amount_value,
    String? mass_total_amount_unit,
    double? mass_total_amount_value,
    String? volume_per_amount_unit,
    double? volume_per_amount_value,
    String? volume_total_amount_unit,
    double? volume_total_amount_value,
    String? quantity_per_amount_unit,
    double? quantity_per_amount_value,
    String? quantity_total_amount_unit,
    double? quantity_total_amount_value,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? created_at,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? updated_at,
    @JsonKey(
      includeToJson: false,
      includeFromJson: true,
    )
    String? deleted_at,
  }) = DishDbModel;

  factory EdibleDbModel.fromJson(Map<String, dynamic> json) =>
      _$EdibleDbModelFromJson(json);
}
