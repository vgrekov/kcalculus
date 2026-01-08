import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class FirestoreCreatedAt extends JsonFlavouredBase<StorageAction> {
  const FirestoreCreatedAt();

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ => JsonDecision.include(
          FieldValue.serverTimestamp(),
        ),
        _ => JsonDecision.exclude(),
      };
}
