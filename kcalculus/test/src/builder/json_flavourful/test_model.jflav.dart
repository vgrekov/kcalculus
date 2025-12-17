// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// JsonFlavourfulGenerator
// **************************************************************************

part of 'test_model.dart';

final _flavouredFields = Map<String, JsonFlavouredBase<Action>>.unmodifiable({
  'id': JsonFlavoured(idGenerator),
  'description': JsonFlavoured(nonNull),
  'created_at': CreatedAt(),
  'updatedAt': JsonFlavoured(serverTimestamp),
  'deletedAt': JsonFlavoured(deletedAtTimestamp),
  'deleted': JsonFlavoured(deletedFlag),
});

extension TestModelJsonFlavourful on TestModel {
  Map<String, dynamic> toJsonFlavour(Action flavour) {
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
