import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class CreatedAt extends JsonFlavouredBase<StorageAction> {
  const CreatedAt(this.timestamp);

  final dynamic timestamp;

  @override
  JsonDecision decide(StorageAction action, _) => switch (action) {
    StorageActionCreate _ => JsonDecision.include(timestamp),
    _ => JsonDecision.exclude(),
  };
}
