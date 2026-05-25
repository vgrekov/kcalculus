import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class FirestoreUpdatedAt extends JsonFlavouredBase<StorageAction> {
  const FirestoreUpdatedAt();

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ => JsonDecision.include(
          FieldValue.serverTimestamp(),
        ),
        StorageActionUpdate a =>
          a.skipAudit
              ? JsonDecision.exclude()
              : JsonDecision.include(FieldValue.serverTimestamp()),
        _ => JsonDecision.exclude(),
      };
}
