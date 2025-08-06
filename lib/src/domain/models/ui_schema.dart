import 'package:reactive_forms_json_scheme/src/_src.dart';

class UISchemaElement {
  UISchemaElement({
    this.type,
    this.scope,
    this.elements,
    this.label,
    this.text,
    this.options,
    this.rule,
  });

  factory UISchemaElement.fromJsonSchema(
    Map<String, dynamic> json, {
    String path = '',
  }) {
    final bool hasProperties = json['properties'] != null;

    return UISchemaElement(
      type: hasProperties ? 'VerticalLayout' : 'Control',
      scope: hasProperties ? null : path,
      elements: (json['properties'] as Map?)?.entries.map(
        (e) {
          final String newPath = path.isEmpty
              ? '#/properties/${e.key}'
              : '$path/properties/${e.key}';

          return UISchemaElement.fromJsonSchema(
            e.value as Map<String, dynamic>,
            path: newPath,
          );
        },
      ).toList(),
      rule: json['rule'] as Map<String, dynamic>?,
      options: {
        'name': JFUtils.getLastNameFromPath(path),
        'type': json['type'],
        'format': json['format'],

// final String name;
// final String type;
      },
    );
  }

  factory UISchemaElement.fromJson(Map<String, dynamic> json) {
    return UISchemaElement(
      type: json['type'] as String?,
      scope: json['scope'] as String?,
      elements: json['elements'] != null
          ? (json['elements'] as List)
              .map((e) => UISchemaElement.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      label: json['label'] as String?,
      text: json['text'] as String?,
      options: json['options'] as Map<String, dynamic>?,
      rule: json['rule'] as Map<String, dynamic>?,
    );
  }
  String? type;
  String? scope;
  List<UISchemaElement>? elements;
  String? label;
  String? text;
  Map<String, dynamic>? options;
  Map<String, dynamic>? rule;

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'scope': scope,
      'elements': elements?.map((e) => e.toJson()).toList(),
      'label': label,
      'text': text,
      'options': options,
      'rules': rule,
    };
  }

  @override
  String toString() {
    return 'type: $type, scope: $scope, elements: $elements, label: $label, text: $text, options: $options, rules: $rule';
  }
}

class ControlElement extends UISchemaElement {
  ControlElement({
    super.type,
    super.scope,
    super.elements,
    super.label,
    super.text,
    super.options,
  });

  factory ControlElement.fromJson(Map<String, dynamic> json) {
    return ControlElement(
      type: json['type'] as String?,
      scope: json['scope'] as String?,
      elements: json['elements'] != null
          ? (json['elements'] as List)
              .map((e) => UISchemaElement.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      label: json['label'] as String?,
      text: json['text'] as String?,
      options: json['options'] as Map<String, dynamic>?,
    );
  }
}

class Layout extends UISchemaElement {
  Layout({
    super.type,
    super.scope,
    super.elements,
    super.label,
    super.text,
    super.options,
  });

  factory Layout.fromJson(Map<String, dynamic> json) {
    return Layout(
      type: json['type'] as String?,
      scope: json['scope'] as String?,
      elements: json['elements'] != null
          ? (json['elements'] as List)
              .map((e) => UISchemaElement.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      label: json['label'] as String?,
      text: json['text'] as String?,
      options: json['options'] as Map<String, dynamic>?,
    );
  }
}

class LabelElement extends UISchemaElement {
  LabelElement({
    super.type,
    super.scope,
    super.elements,
    super.label,
    super.text,
    super.options,
  });

  factory LabelElement.fromJson(Map<String, dynamic> json) {
    return LabelElement(
      type: json['type'] as String?,
      scope: json['scope'] as String?,
      elements: json['elements'] != null
          ? (json['elements'] as List)
              .map((e) => UISchemaElement.fromJson(e as Map<String, dynamic>))
              .toList()
          : null,
      label: json['label'] as String?,
      text: json['text'] as String?,
      options: json['options'] as Map<String, dynamic>?,
    );
  }
}
