import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class TouchedAt extends JsonFlavouredBase<StorageAction> {
  const TouchedAt(this.timestamp);

  final dynamic timestamp;

  @override
  JsonDecision decide(StorageAction action, _) => switch (action) {
    StorageActionUpdate a =>
      a.skipAudit ? JsonDecision.exclude() : JsonDecision.include(timestamp),
    _ => JsonDecision.include(timestamp),
  };
}
