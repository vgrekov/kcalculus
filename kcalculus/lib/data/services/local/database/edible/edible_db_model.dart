// ignore_for_file: non_constant_identifier_names
// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edible_db_model.freezed.dart';
part 'edible_db_model.g.dart';

@freezed
sealed class EdibleDbModel with _$EdibleDbModel {
  const factory EdibleDbModel({
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

  factory EdibleDbModel.fromJson(Map<String, dynamic> json) =>
      _$EdibleDbModelFromJson(json);
}
