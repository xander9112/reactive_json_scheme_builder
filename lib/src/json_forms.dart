import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

enum PropertyType { string, number, integer, boolean, array, object }

enum PropertyFormat {
  date,
  time,
  dateTime,
  email,
  hostname,
  uri;

  bool get isDateTime => this == date || this == dateTime || this == time;

// static bool isDate(String value) {
//   return value ==
// }

  String get value {
    switch (this) {
      case PropertyFormat.date:
        return 'date';
      case PropertyFormat.time:
        return 'time';
      case PropertyFormat.dateTime:
        return 'date-time';
      case PropertyFormat.email:
        return 'email';
      case PropertyFormat.hostname:
        return 'hostname';
      case PropertyFormat.uri:
        return 'uri';
    }
  }

  static PropertyFormat? fromString(String value) {
    switch (value) {
      case 'date':
        return PropertyFormat.date;
      case 'time':
        return PropertyFormat.time;
      case 'date-time':
        return PropertyFormat.dateTime;
      case 'email':
        return PropertyFormat.email;
      case 'hostname':
        return PropertyFormat.hostname;
      case 'uri':
        return PropertyFormat.uri;
      default:
        return null;
    }
  }
}

abstract class JsonForms<FormType> {
  JsonForms({
    required Map<String, dynamic> jsonSchema,
    required List<Map<String, RenderType<FormType>>>? customRenderList,
    required this.onSubmit,
    Map<String, dynamic>? dataJson,
    Map<String, dynamic>? uiSchema,
  }) {
    jsonSchemaDTO = JsonSchema4.fromJson(jsonSchema);
    uiSchemaDTO = uiSchema != null
        ? UISchemaElement.fromJson(uiSchema)
        : UISchemaElement.fromJsonSchema(jsonSchema);
    data = dataJson ?? {};
    renderList = [...myRenderList];

    if (customRenderList != null && customRenderList.isNotEmpty) {
      renderList.addAll(customRenderList);
    }
  }

  late UISchemaElement uiSchemaDTO;
  late JsonSchema4 jsonSchemaDTO;
  late Map<String, dynamic> data;

  late final List<Map<String, RenderType<FormType>>> renderList;
  late final FormType form;

  late final void Function(Map<String, dynamic> value) onSubmit;

  List<Map<String, RenderType<FormType>>> get myRenderList;

  List<Widget> createWidgets(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
    List<Widget> widgets,
  );

  Widget getFormWidget(BuildContext context, {EdgeInsets padding});

  void dispose();

  Map<String, dynamic> normalizeFormData(Map<String, Object?> input);
}
