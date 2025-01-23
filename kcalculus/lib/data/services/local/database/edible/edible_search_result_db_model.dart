// ignore_for_file: non_constant_identifier_names
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edible_search_result_db_model.freezed.dart';
part 'edible_search_result_db_model.g.dart';

@freezed
class EdibleSearchResultDbModel with _$EdibleSearchResultDbModel {
  factory EdibleSearchResultDbModel({
    required String id,
    String? food_id,
    String? dish_id,
    required String name,
    String? description,
    required String created_at,
    String? updated_at,
    String? last_eaten_at,
  }) = _EdibleSearchResultDbModel;

  factory EdibleSearchResultDbModel.fromJson(Map<String, dynamic> json) =>
      _$EdibleSearchResultDbModelFromJson(json);
}
