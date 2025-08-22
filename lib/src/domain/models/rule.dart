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
    this.required,
    this.contains,
    this.properties,
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
      required: json['required'] as List<dynamic>?,
      contains: json['contains'] != null
          ? ContainsSchema.fromJson(json['contains'] as Map<String, dynamic>)
          : null,
      properties: json['properties'] != null
          ? (json['properties'] as Map<String, dynamic>)
              .map<String, ConditionSchema>(
              (key, value) => MapEntry(
                key,
                ConditionSchema.fromJson(value as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  final dynamic constCondition;

  final List<dynamic>? enumCondition;

  final ConditionSchema? notCondition;

  final num? minimum;

  final num? maximum;

  final num? exclusiveMinimum;

  final num? exclusiveMaximum;

  final List<dynamic>? required;

  final ContainsSchema? contains;

  final Map<String, ConditionSchema>? properties;

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
        if (contains != null) contains!.evaluate(value),
        if (required != null) evaluateRequired(value),
        if (properties != null) evaluateProperties(value),
      ];

      return results.every((e) => e);
    } catch (e) {
      print(e);
      return false;
    }
  }

  bool evaluateRequired(dynamic value) {
    if (value is Map<String, dynamic>) {
      for (final key in required ?? <String>[]) {
        if (value[key]?.toString().isEmpty ?? true) {
          return false;
        }
      }
      return true;
    }

    return false;
  }

  bool evaluateProperties(dynamic value) {
    if (value is Map<String, dynamic>) {
      for (final key in properties!.keys) {
        final propertyValue = value[key];

        if (propertyValue != null) {
          final result = properties![key]?.evaluate(value[key]) ?? false;

          if (result == false) {
            return false;
          }
        } else {
          return false;
        }
      }

      return true;
    }

    return false;
  }

  @override
  String toString() {
    return '{const: $constCondition, enum: $enumCondition}';
  }
}

class ContainsSchema {
  ContainsSchema({required this.constCondition});

  factory ContainsSchema.fromJson(Map<String, dynamic> json) {
    return ContainsSchema(
      constCondition: json['const'],
    );
  }

  final dynamic constCondition;

  bool evaluate(dynamic value) {
    if (value is List) {
      return value.contains(constCondition);
    } else {
      return value.toString().contains(constCondition.toString());
    }
  }
}
