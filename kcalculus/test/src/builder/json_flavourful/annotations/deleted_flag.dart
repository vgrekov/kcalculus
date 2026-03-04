import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class DeletedFlag extends JsonFlavouredBase<StorageAction> {
  const DeletedFlag();

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ => JsonDecision.include(false),
        _ => JsonDecision.exclude(),
      };
}
