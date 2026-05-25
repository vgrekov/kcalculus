import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class Id extends JsonFlavouredBase<StorageAction> {
  const Id(this.value);

  final dynamic value;

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ => JsonDecision.include(
          request.actualValue ?? value,
        ),
        _ => JsonDecision.include(request.actualValue),
      };
}
