import 'package:kcalculus/utils/json_flavourful/annotations/json_flavoured_base.dart';
import 'package:kcalculus/utils/json_flavourful/json_decision.dart';

import 'test_model.dart';

class CreatedAt extends JsonFlavouredBase<Action> {
  const CreatedAt();

  @override
  JsonDecision decide(Action action, _) => switch (action) {
    Action.create => const JsonDecision.include(kServerTimestamp),
    _ => JsonDecision.exclude(),
  };
}
