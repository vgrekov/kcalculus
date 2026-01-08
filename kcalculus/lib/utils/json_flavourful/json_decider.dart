import 'package:kcalculus/utils/json_flavourful/json_decision.dart';
import 'package:kcalculus/utils/json_flavourful/json_request.dart';

typedef JsonDecider<Flavour> =
    JsonDecision Function(JsonRequest<Flavour> request);
