import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class DeletedAt extends JsonFlavouredBase<StorageAction> {
  const DeletedAt();

  @override
  JsonDecision decide(StorageAction action, _) => switch (action) {
    StorageActionCreate _ => JsonDecision.include(null),
    _ => JsonDecision.exclude(),
  };
}
