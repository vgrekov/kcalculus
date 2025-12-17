import 'package:kcalculus/utils/json_flavourful/json_decision.dart';

abstract class JsonFlavouredBase<Flavour> {
  const JsonFlavouredBase();

  JsonDecision decide(
    Flavour flavour,
    dynamic actual,
  );
}
