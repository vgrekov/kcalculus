// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/_data/storage/local/edible/models/edible_db_model.dart';

part 'dish_db_model.freezed.dart';
part 'dish_db_model.g.dart';

@freezed
sealed class DishDbModel with _$DishDbModel {
  const DishDbModel._();

  const factory DishDbModel({
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
      includeFromJson: false,
    )
    String? nf_preview_per_unit,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    double? nf_preview_per_value,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    String? nf_preview_calories_unit,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    double? nf_preview_calories_value,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    String? nf_preview_fat_unit,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    double? nf_preview_fat_value,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    String? nf_preview_carbs_unit,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    double? nf_preview_carbs_value,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    String? nf_preview_protein_unit,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    double? nf_preview_protein_value,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    String? nf_preview_fiber_unit,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    double? nf_preview_fiber_value,
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
  }) = _DishDbModel;

  factory DishDbModel.fromJson(Map<String, dynamic> json) =>
      _$DishDbModelFromJson(json);

  EdibleDbModel toEdibleDbModel() {
    return EdibleDbModel(
      id: id,
      name: name,
      description: description,
      nf_preview_per_unit: nf_preview_per_unit,
      nf_preview_per_value: nf_preview_per_value,
      nf_preview_calories_unit: nf_preview_calories_unit,
      nf_preview_calories_value: nf_preview_calories_value,
      nf_preview_fat_unit: nf_preview_fat_unit,
      nf_preview_fat_value: nf_preview_fat_value,
      nf_preview_carbs_unit: nf_preview_carbs_unit,
      nf_preview_carbs_value: nf_preview_carbs_value,
      nf_preview_protein_unit: nf_preview_protein_unit,
      nf_preview_protein_value: nf_preview_protein_value,
      nf_preview_fiber_unit: nf_preview_fiber_unit,
      nf_preview_fiber_value: nf_preview_fiber_value,
      created_at: created_at,
      updated_at: updated_at,
      deleted_at: deleted_at,
    );
  }
}
