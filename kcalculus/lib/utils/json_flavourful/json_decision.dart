sealed class JsonDecision {
  const JsonDecision();

  const factory JsonDecision.include(dynamic value) = JsonInclude;

  factory JsonDecision.exclude() => JsonExclude.instance;
}

final class JsonInclude extends JsonDecision {
  const JsonInclude(this.value);

  final dynamic value;
}

final class JsonExclude extends JsonDecision {
  static const instance = JsonExclude._();

  const JsonExclude._();
}
