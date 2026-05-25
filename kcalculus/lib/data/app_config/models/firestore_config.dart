import 'package:freezed_annotation/freezed_annotation.dart';

part 'firestore_config.freezed.dart';
part 'firestore_config.g.dart';

const int kDefaultDeleteBatchSize = 500;

const int kDefaultImportBatchSize = 100;

@freezed
sealed class FirestoreConfig with _$FirestoreConfig {
  const factory FirestoreConfig({
    @Default(kDefaultDeleteBatchSize) int deleteBatchSize,
    @Default(kDefaultImportBatchSize) int importBatchSize,
  }) = _FirestoreConfig;

  factory FirestoreConfig.fromJson(Map<String, dynamic> json) =>
      _$FirestoreConfigFromJson(json);
}
