class JsonSchema4 {
  JsonSchema4({
    this.id,
    this.$schema,
    this.title,
    this.description,
    this.type,
    this.required,
    this.properties,
    this.items,
    this.allOf,
    this.anyOf,
    this.oneOf,
    this.not,
    this.defaultValue,
    this.enumValues,
    this.format,
    this.readOnly,
    this.writeOnly,
    this.deprecated,
    this.multipleOf,
    this.maximum,
    this.exclusiveMaximum,
    this.minimum,
    this.exclusiveMinimum,
    this.maxLength,
    this.minLength,
    this.pattern,
    this.maxItems,
    this.minItems,
    this.uniqueItems,
    this.maxProperties,
    this.minProperties,
    this.definitions,
    this.patternProperties,
    this.dependencies,
    this.additionalProperties,
    this.additionalItems,
    this.propertyNames,
    this.contains,
    this.constValue,
    this.examples,
    this.extensions,
  });

  factory JsonSchema4.fromJson(Map<String, dynamic> json) {
    return JsonSchema4(
      id: json['id'] as String?,
      $schema: json[r'$schema'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      required: json['required'] != null
          ? List<String>.from(json['required'] as List)
          : null,
      properties: json['properties'] != null
          ? (json['properties'] as Map<String, dynamic>).map(
              (k, v) =>
                  MapEntry(k, JsonSchema4.fromJson(v as Map<String, dynamic>)),
            )
          : null,
      // items: json['items'] != null
      //     ? (json['items'] as List)
      //         .map(
      //           (e) => JsonSchema4.fromJson(e as Map<String, dynamic>),
      //         )
      //         .toList()
      //     : null,
      items: json['items'] != null
          ? JsonSchema4.fromJson(json['items'] as Map<String, dynamic>)
          : null,
      allOf: json['allOf'] != null
          ? (json['allOf'] as List)
              .map((e) => JsonSchema4.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      anyOf: json['anyOf'] != null
          ? (json['anyOf'] as List)
              .map((e) => JsonSchema4.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      oneOf: json['oneOf'] != null
          ? (json['oneOf'] as List)
              .map((e) => JsonSchema4.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      not: json['not'] != null
          ? JsonSchema4.fromJson(json['not'] as Map<String, dynamic>)
          : null,
      defaultValue: json['default'],
      enumValues: json['enum'] != null
          ? json['type'] == 'string'
              ? List<String>.from(json['enum'] as List)
              : List<dynamic>.from(json['enum'] as List)
          : null,
      format: json['format'] as String?,
      readOnly: json['readOnly'] as bool?,
      writeOnly: json['writeOnly'] as bool?,
      deprecated: json['deprecated'] as bool?,
      multipleOf: json['multipleOf'] as num?,
      maximum: json['maximum'] as num?,
      exclusiveMaximum: json['exclusiveMaximum'] as bool?,
      minimum: json['minimum'] as num?,
      exclusiveMinimum: json['exclusiveMinimum'] as bool?,
      maxLength: json['maxLength'] as int?,
      minLength: json['minLength'] as int?,
      pattern: json['pattern'] as String?,
      maxItems: json['maxItems'] as int?,
      minItems: json['minItems'] as int?,
      uniqueItems: json['uniqueItems'] as bool?,
      maxProperties: json['maxProperties'] as int?,
      minProperties: json['minProperties'] as int?,
      definitions: json['definitions'] != null
          ? (json['definitions'] as Map<String, dynamic>).map(
              (k, v) =>
                  MapEntry(k, JsonSchema4.fromJson(v as Map<String, dynamic>)),
            )
          : null,
      patternProperties: json['patternProperties'] != null
          ? (json['patternProperties'] as Map<String, dynamic>).map(
              (k, v) =>
                  MapEntry(k, JsonSchema4.fromJson(v as Map<String, dynamic>)),
            )
          : null,
      dependencies: json['dependencies'] != null
          ? (json['dependencies'] as Map<String, dynamic>).map(
              (k, v) =>
                  MapEntry(k, JsonSchema4.fromJson(v as Map<String, dynamic>)),
            )
          : null,
      additionalProperties: json['additionalProperties'] != null
          ? JsonSchema4.fromJson(
              json['additionalProperties'] as Map<String, dynamic>,
            )
          : null,
      additionalItems: json['additionalItems'] != null
          ? JsonSchema4.fromJson(
              json['additionalItems'] as Map<String, dynamic>,
            )
          : null,
      propertyNames: json['propertyNames'] != null
          ? JsonSchema4.fromJson(json['propertyNames'] as Map<String, dynamic>)
          : null,
      contains: json['contains'] != null
          ? JsonSchema4.fromJson(json['contains'] as Map<String, dynamic>)
          : null,
      constValue: json['const'] as JsonSchema4?,
      examples: json['examples'] != null
          ? (json['examples'] as List)
              .map((e) => JsonSchema4.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      extensions: json['extensions'] as Map<String, dynamic>?,
    );
  }
  String? id;
  String? $schema;
  String? title;
  String? description;
  String? type;
  List<String>? required;
  Map<String, JsonSchema4>? properties;
  JsonSchema4? items;
  List<JsonSchema4>? allOf;
  List<JsonSchema4>? anyOf;
  List<JsonSchema4>? oneOf;
  JsonSchema4? not;
  dynamic defaultValue;
  List<dynamic>? enumValues;
  String? format;
  bool? readOnly;
  bool? writeOnly;
  bool? deprecated;
  num? multipleOf;
  num? maximum;
  bool? exclusiveMaximum;
  num? minimum;
  bool? exclusiveMinimum;
  int? maxLength;
  int? minLength;
  String? pattern;
  int? maxItems;
  int? minItems;
  bool? uniqueItems;
  int? maxProperties;
  int? minProperties;
  Map<String, JsonSchema4>? definitions;
  Map<String, JsonSchema4>? patternProperties;
  Map<String, JsonSchema4>? dependencies;
  JsonSchema4? additionalProperties;
  JsonSchema4? additionalItems;
  JsonSchema4? propertyNames;
  JsonSchema4? contains;
  JsonSchema4? constValue;
  List<JsonSchema4>? examples;
  Map<String, dynamic>? extensions;

  bool get isDate => format == 'date';
  bool get isNumber => type == 'number';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      r'$schema': $schema,
      'title': title,
      'description': description,
      'type': type,
      'required': required,
      'properties': properties?.map((k, v) => MapEntry(k, v.toJson())),
      'items': items?.toJson(),
      'allOf': allOf?.map((e) => e.toJson()).toList(),
      'anyOf': anyOf?.map((e) => e.toJson()).toList(),
      'oneOf': oneOf?.map((e) => e.toJson()).toList(),
      'not': not?.toJson(),
      'default': defaultValue,
      'enum': enumValues,
      'format': format,
      'readOnly': readOnly,
      'writeOnly': writeOnly,
      'deprecated': deprecated,
      'multipleOf': multipleOf,
      'maximum': maximum,
      'exclusiveMaximum': exclusiveMaximum,
      'minimum': minimum,
      'exclusiveMinimum': exclusiveMinimum,
      'maxLength': maxLength,
      'minLength': minLength,
      'pattern': pattern,
      'maxItems': maxItems,
      'minItems': minItems,
      'uniqueItems': uniqueItems,
      'maxProperties': maxProperties,
      'minProperties': minProperties,
      'definitions': definitions?.map((k, v) => MapEntry(k, v.toJson())),
      'patternProperties': patternProperties?.map(
        (k, v) => MapEntry(k, v.toJson()),
      ),
      'dependencies': dependencies?.map((k, v) => MapEntry(k, v.toJson())),
      'additionalProperties': additionalProperties?.toJson(),
      'additionalItems': additionalItems?.toJson(),
      'propertyNames': propertyNames?.toJson(),
      'contains': contains?.toJson(),
      'const': constValue,
      'examples': examples?.map((e) => e.toJson()).toList(),
      'extensions': extensions,
    };
  }
}
