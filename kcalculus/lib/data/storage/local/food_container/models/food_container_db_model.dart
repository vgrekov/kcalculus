// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_container_db_model.freezed.dart';
part 'food_container_db_model.g.dart';

@freezed
sealed class FoodContainerDbModel with _$FoodContainerDbModel {
  factory FoodContainerDbModel({
    required String id,

    required String name,

    String? description,

    required String weight_unit,

    required double weight_value,

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
  }) = _FoodContainerDbModel;

  factory FoodContainerDbModel.fromJson(Map<String, dynamic> json) =>
      _$FoodContainerDbModelFromJson(json);
}
