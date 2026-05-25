import 'package:kcalculus/utils/json_flavourful/json_decision.dart';
import 'package:kcalculus/utils/json_flavourful/json_request.dart';

abstract class JsonFlavouredBase<Flavour> {
  const JsonFlavouredBase();

  JsonDecision decide(JsonRequest<Flavour> request);
}
