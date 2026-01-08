import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class CreateOnly extends JsonFlavouredBase<StorageAction> {
  const CreateOnly() : _override = null, _overrideProvided = false;

  const CreateOnly.override(Object? value)
    : _override = value,
      _overrideProvided = true;

  final Object? _override;

  final bool _overrideProvided;

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ =>
          _overrideProvided
              ? JsonDecision.include(_override)
              : JsonDecision.passThrough(),
        _ => JsonDecision.exclude(),
      };
}
