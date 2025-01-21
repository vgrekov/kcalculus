// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edible_db_model.freezed.dart';
part 'edible_db_model.g.dart';

@freezed
sealed class EdibleDbModel with _$EdibleDbModel {
  factory EdibleDbModel({
    required String id,
    required String name,
    String? description,
    String? created_at,
    String? updated_at,
  }) = FoodDbModel;

  factory EdibleDbModel.fromJson(Map<String, dynamic> json) =>
      _$EdibleDbModelFromJson(json);
}
