// ignore_for_file: avoid_catches_without_on_clauses

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
      scope: json['scope']?.toString() ?? '#',
      schema: ConditionSchema.fromJson(
        json['schema'] as Map<String, dynamic>? ?? {},
      ),
      failWhenUndefined: (json['failWhenUndefined'] as bool?) ?? false,
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
    this.notCondition,
    this.minimum,
    this.maximum,
    this.exclusiveMinimum,
    this.exclusiveMaximum,
  });

  factory ConditionSchema.fromJson(Map<String, dynamic> json) {
    return ConditionSchema(
      constCondition: json['const'],
      enumCondition: json['enum'] as List<dynamic>?,
      notCondition: json['not'] != null
          ? ConditionSchema.fromJson(json['not'] as Map<String, dynamic>)
          : null,
      minimum: json['minimum'] as num?,
      maximum: json['maximum'] as num?,
      exclusiveMinimum: json['exclusiveMinimum'] as num?,
      exclusiveMaximum: json['exclusiveMaximum'] as num?,
    );
  }

  final dynamic constCondition;

  final List<dynamic>? enumCondition;

  final ConditionSchema? notCondition;

  final num? minimum;

  final num? maximum;

  final num? exclusiveMinimum;

  final num? exclusiveMaximum;

  bool evaluate(dynamic value) {
    try {
      final results = [
        if (constCondition != null) value == constCondition,
        if (enumCondition != null) enumCondition!.contains(value),
        if (notCondition != null) !notCondition!.evaluate(value),
        if (minimum != null && value is num) value >= minimum!,
        if (maximum != null && value is num) value <= maximum!,
        if (exclusiveMinimum != null && value is num) value > exclusiveMinimum!,
        if (exclusiveMaximum != null && value is num) value < exclusiveMaximum!,
      ];

      return results.every((e) => e);
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  String toString() {
    return '{const: $constCondition, enum: $enumCondition}';
  }
}
