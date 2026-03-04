// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// JsonFlavourfulGenerator
// **************************************************************************

part of 'nutrient_goal_firestore_model.dart';

final _flavouredFields =
    Map<String, JsonFlavouredBase<StorageAction>>.unmodifiable({
      'createdAt': FirestoreCreatedAt(),
      'deletedAt': CreateOnly.override(
        NutrientGoalFirestoreModel._maxTimestampProvider,
      ),
    });

extension NutrientGoalFirestoreModelJsonFlavourful
    on NutrientGoalFirestoreModel {
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
      if (decision is JsonInclude) {
        json[e.key] = decision.value;
      }
    }

    return json;
  }

  Object? _getActualValue(String jsonName) => switch (jsonName) {
    'createdAt' => createdAt,
    'deletedAt' => deletedAt,
    _ => null,
  };
}
