import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class FirestoreTouchedAt extends JsonFlavouredBase<StorageAction> {
  const FirestoreTouchedAt();

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionUpdate a =>
          a.skipAudit
              ? JsonDecision.exclude()
              : JsonDecision.include(FieldValue.serverTimestamp()),
        _ => JsonDecision.include(FieldValue.serverTimestamp()),
      };
}
