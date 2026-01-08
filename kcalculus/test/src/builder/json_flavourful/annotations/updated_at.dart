import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class UpdatedAt extends JsonFlavouredBase<StorageAction> {
  const UpdatedAt(this.timestamp);

  final dynamic timestamp;

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ => JsonDecision.include(timestamp),
        StorageActionUpdate a =>
          a.skipAudit
              ? JsonDecision.exclude()
              : JsonDecision.include(timestamp),
        _ => JsonDecision.exclude(),
      };
}
