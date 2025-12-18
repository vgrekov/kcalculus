// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// JsonFlavourfulGenerator
// **************************************************************************

part of 'test_model.dart';

final _flavouredFields =
    Map<String, JsonFlavouredBase<StorageAction>>.unmodifiable({
      'id': Id(kGeneratedId),
      'description': NonNull(),
      'created_at': CreatedAt(kServerTimestamp),
      'updatedAt': UpdatedAt(kServerTimestamp),
      'deletedAt': DeletedAt(),
      'deleted': DeletedFlag(),
    });

extension TestModelJsonFlavourful on TestModel {
  Map<String, dynamic> toJsonFlavour(StorageAction flavour) {
    final json = toJson();

    for (final key in json.keys.toList()) {
      final flavouredField = _flavouredFields[key];
      if (flavouredField != null) {
        final decision = flavouredField.decide(flavour, json[key]);
        if (decision is JsonInclude) {
          json[key] = decision.value;
        } else {
          json.remove(key);
        }
      }
    }

    return json;
  }
}
