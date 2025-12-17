// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// JsonFlavourfulGenerator
// **************************************************************************

part of 'test_model.dart';

final _flavouredFields = Map<String, JsonFlavoured<Action>>.unmodifiable({
  'id': JsonFlavoured({Action.create}, value: idGenerator, exclusive: false),
  'description': JsonFlavoured({Action.create, Action.update}, filter: nonNull),
  'created_at': JsonFlavoured({Action.create}, value: serverTimestamp),
  'updatedAt': JsonFlavoured({
    Action.create,
    Action.update,
  }, value: serverTimestamp),
  'deletedAt': JsonFlavoured({
    Action.create,
    Action.delete,
  }, value: deletedAtTimestamp),
  'deleted': JsonFlavoured({Action.create, Action.delete}, value: deletedFlag),
});

extension TestModelJsonFlavourful on TestModel {
  Map<String, dynamic> toJsonFlavour(Action flavour) {
    final json = toJson();

    for (final key in json.keys.toList()) {
      final flavouredField = _flavouredFields[key];
      if (flavouredField != null) {
        if (flavouredField.flavours.contains(flavour)) {
          final originalValue = json[key];

          final shouldBeIncluded =
              flavouredField.filter == null ||
              flavouredField.filter!(flavour, originalValue);

          if (shouldBeIncluded) {
            if (flavouredField.value != null) {
              json[key] = flavouredField.value!(flavour, originalValue);
            }
          } else {
            json.remove(key);
          }
        } else if (flavouredField.exclusive) {
          json.remove(key);
        }
      }
    }

    return json;
  }
}
