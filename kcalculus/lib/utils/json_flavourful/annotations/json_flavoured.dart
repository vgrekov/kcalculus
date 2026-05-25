import 'package:kcalculus/utils/json_flavourful/annotations/json_flavoured_base.dart';
import 'package:kcalculus/utils/json_flavourful/json_decider.dart';
import 'package:kcalculus/utils/json_flavourful/json_decision.dart';
import 'package:kcalculus/utils/json_flavourful/json_request.dart';

class JsonFlavoured<Flavour> extends JsonFlavouredBase<Flavour> {
  const JsonFlavoured(this.decider);

  final JsonDecider<Flavour> decider;

  @override
  JsonDecision decide(JsonRequest<Flavour> request) => decider(request);
}
