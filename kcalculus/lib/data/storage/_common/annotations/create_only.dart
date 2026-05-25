import 'package:kcalculus/data/storage/_common/utils/storage_action.dart';
import 'package:kcalculus/utils/json_flavourful/json_flavourful.dart';

class CreateOnly extends JsonFlavouredBase<StorageAction> {
  const CreateOnly();

  const factory CreateOnly.override(Object? Function() provider) =
      _CreateOnlyOverride;

  const factory CreateOnly.overrideValue(Object? value) =
      _CreateOnlyOverrideValue;

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ => JsonDecision.passThrough(),
        _ => JsonDecision.exclude(),
      };
}

class _CreateOnlyOverride extends CreateOnly {
  const _CreateOnlyOverride(this._overrideProvider);

  final Object? Function() _overrideProvider;

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ => JsonDecision.include(_overrideProvider()),
        _ => JsonDecision.exclude(),
      };
}

class _CreateOnlyOverrideValue extends CreateOnly {
  const _CreateOnlyOverrideValue(this._overrideValue);

  final Object? _overrideValue;

  @override
  JsonDecision decide(JsonRequest<StorageAction> request) =>
      switch (request.flavour) {
        StorageActionCreate _ => JsonDecision.include(_overrideValue),
        _ => JsonDecision.exclude(),
      };
}
