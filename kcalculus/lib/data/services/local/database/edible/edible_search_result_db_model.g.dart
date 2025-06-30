// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edible_search_result_db_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EdibleSearchResultDbModel _$EdibleSearchResultDbModelFromJson(
        Map<String, dynamic> json) =>
    _EdibleSearchResultDbModel(
      id: json['id'] as String,
      food_id: json['food_id'] as String?,
      dish_id: json['dish_id'] as String?,
      name: json['name'] as String,
      description: json['description'] as String?,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String?,
      last_eaten_at: json['last_eaten_at'] as String?,
    );

Map<String, dynamic> _$EdibleSearchResultDbModelToJson(
        _EdibleSearchResultDbModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'food_id': instance.food_id,
      'dish_id': instance.dish_id,
      'name': instance.name,
      'description': instance.description,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'last_eaten_at': instance.last_eaten_at,
    };
