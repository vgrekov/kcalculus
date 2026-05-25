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
      'deletedAt': DeletedAt(kServerTimestamp),
      'deleted': DeletedFlag(),
    });

extension TestModelJsonFlavourful on TestModel {
  Map<String, dynamic> toJsonFlavour(StorageAction flavour) {
    final json = toJson();

    for (final key in json.keys.toList()) {
      final flavouredField = _flavouredFields[key];
      if (flavouredField != null) {
        final actualValue = _getActualValue(key);
        final request = JsonRequest(flavour, actualValue);
        final decision = flavouredField.decide(request);
        if (decision is JsonInclude) {
          json[key] = decision.value;
        } else if (decision is JsonExclude) {
          json.remove(key);
        }
      }
    }

    return json;
  }

  Map<String, dynamic> extractJsonFlavour(StorageAction flavour) {
    final json = <String, dynamic>{};

    for (final e in _flavouredFields.entries) {
      final actualValue = _getActualValue(e.key);
      final request = JsonRequest(flavour, actualValue);
      final decision = e.value.decide(request);
      if (decision is JsonPassThrough) {
        json[e.key] = actualValue;
      } else if (decision is JsonInclude) {
        json[e.key] = decision.value;
      }
    }

    return json;
  }

  Object? _getActualValue(String jsonName) => switch (jsonName) {
    'id' => id,
    'description' => description,
    'created_at' => createdAt,
    'updatedAt' => updatedAt,
    'deletedAt' => deletedAt,
    'deleted' => deleted,
    _ => null,
  };
}
