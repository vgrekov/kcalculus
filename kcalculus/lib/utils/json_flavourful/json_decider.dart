import 'package:kcalculus/utils/json_flavourful/json_decision.dart';

typedef JsonDecider<Flavour> =
    JsonDecision Function(
      Flavour flavour,
      dynamic actual,
    );
