import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class DeletedAt extends JsonFlavouredBase<StorageAction> {
  const DeletedAt(this.timestamp);

  final dynamic timestamp;

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ => JsonDecision.include(null),
        _ => JsonDecision.exclude(),
      };
}
