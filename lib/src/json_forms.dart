import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

enum PropertyType { string, number, integer, boolean, array, object }

enum PropertyFormat { date, time, email, hostname, uri }

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
}
