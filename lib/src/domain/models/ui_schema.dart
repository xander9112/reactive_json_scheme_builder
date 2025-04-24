class UISchemaElement {
  UISchemaElement({
    this.type,
    this.scope,
    this.elements,
    this.label,
    this.text,
    this.options,
  });

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
    );
  }
  String? type;
  String? scope;
  List<UISchemaElement>? elements;
  String? label;
  String? text;
  Map<String, dynamic>? options;

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'scope': scope,
      'elements': elements?.map((e) => e.toJson()).toList(),
      'label': label,
      'text': text,
      'options': options,
    };
  }

  @override
  String toString() {
    return 'type: $type, scope: $scope, elements: $elements, label: $label, text: $text, options: $options';
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
