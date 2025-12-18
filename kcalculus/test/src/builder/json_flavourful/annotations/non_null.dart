import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class NonNull extends JsonFlavouredBase<StorageAction> {
  const NonNull();

  @override
  JsonDecision decide(StorageAction action, actual) => switch (action) {
    StorageActionCreate _ || StorageActionUpdate _ =>
      actual != null ? JsonDecision.include(actual) : JsonDecision.exclude(),
    _ => JsonDecision.exclude(),
  };
}
