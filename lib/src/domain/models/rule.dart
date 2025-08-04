class Rule {
  Rule({required this.condition, required this.effect});

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      condition: Condition.fromJson(json['condition'] as Map<String, dynamic>),
      effect: Effect.fromJson(json['effect'].toString()),
    );
  }

  final Effect effect;
  final Condition condition;

  @override
  String toString() {
    return '{effect: ${effect.name}, condition: $condition}';
  }
}

enum Effect {
  hide,
  show,
  enable,
  disable,
  unknown;

  static Effect fromJson(String json) => switch (json.toUpperCase()) {
        'HIDE' => hide,
        'SHOW' => show,
        'ENABLE' => enable,
        'DISABLE' => disable,
        String() => unknown,
      };
}

class Condition {
  Condition({
    required this.schema,
    required this.scope,
    this.failWhenUndefined = false,
  });

  factory Condition.fromJson(Map<String, dynamic> json) {
    return Condition(
      scope: json['scope']?.toString() ?? '',
      schema: ConditionSchema.fromJson(
        json['schema'] as Map<String, dynamic>? ?? {},
      ),
    );
  }

  final String scope;

  final ConditionSchema schema;

  final bool failWhenUndefined;

  @override
  String toString() {
    return '{scope: $scope, schema: $schema, failWhenUndefined: $failWhenUndefined}';
  }
}

class ConditionSchema {
  ConditionSchema({
    this.constCondition,
    this.enumCondition,
  });

  factory ConditionSchema.fromJson(Map<String, dynamic> json) {
    return ConditionSchema(
      constCondition: json['const'],
      enumCondition: json['enum'] as List<dynamic>?,
    );
  }

  //TODO: добавить поддержку всей схемы

  final dynamic constCondition;

  final List<dynamic>? enumCondition;

  @override
  String toString() {
    return '{const: $constCondition, enum: $enumCondition}';
  }
}
