import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class NonNull extends JsonFlavouredBase<StorageAction> {
  const NonNull();

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ || StorageActionUpdate _ =>
          request.actualValue != null
              ? JsonDecision.include(request.actualValue)
              : JsonDecision.exclude(),
        _ => JsonDecision.exclude(),
      };
}
