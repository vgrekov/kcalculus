// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/data/services/local/database/edible/edible_db_model.dart';

part 'food_db_model.freezed.dart';
part 'food_db_model.g.dart';

@freezed
sealed class FoodDbModel with _$FoodDbModel {
  const FoodDbModel._();

  const factory FoodDbModel({
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
  }) = _FoodDbModel;

  factory FoodDbModel.fromJson(Map<String, dynamic> json) =>
      _$FoodDbModelFromJson(json);

  EdibleDbModel toEdibleDbModel() {
    return EdibleDbModel(
      id: id,
      name: name,
      description: description,
      created_at: created_at,
      updated_at: updated_at,
      deleted_at: deleted_at,
    );
  }
}
