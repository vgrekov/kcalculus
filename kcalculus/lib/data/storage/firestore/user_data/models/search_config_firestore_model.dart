import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_config_firestore_model.freezed.dart';
part 'search_config_firestore_model.g.dart';

@freezed
sealed class SearchConfigFirestoreModel with _$SearchConfigFirestoreModel {
  const factory SearchConfigFirestoreModel({
    required String appId,
    required String apiKey,
  }) = _SearchConfigFirestoreModel;

  factory SearchConfigFirestoreModel.fromJson(Map<String, dynamic> json) =>
      _$SearchConfigFirestoreModelFromJson(json);
}
