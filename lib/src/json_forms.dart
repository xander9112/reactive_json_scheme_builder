import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

enum PropertyType { string, number, integer, boolean, array, object }

enum PropertyFormat { date, time, email, hostname, uri }

abstract class JsonForms<FormType> {
  JsonForms(
    Map<String, dynamic> dataSchemaJson,
    Map<String, dynamic> uiSchemaJson,
    Map<String, dynamic> dataJson,
    List<Map<String, RenderType<FormType>>>? customRenderList,
    this.callback,
  ) {
    dataSchema = JsonSchema4.fromJson(dataSchemaJson);
    uiSchema = UISchemaElement.fromJson(uiSchemaJson);
    data = dataJson;
    renderList = [...myRenderList];

    if (customRenderList != null && customRenderList.isNotEmpty) {
      renderList.addAll(customRenderList);
    }
  }

  final JsonFormsCallback callback;

  late UISchemaElement uiSchema;
  late JsonSchema4 dataSchema;
  late Map<String, dynamic> data;

  late final List<Map<String, RenderType<FormType>>> renderList;
  late final FormType form;

  List<Map<String, RenderType<FormType>>> get myRenderList;

  Widget getControl(
    UISchemaElement uiSchema,
    JsonSchema4 schema,
    BuildContext context,
  );

  List<Widget> createWidgets(
    UISchemaElement uiSchema,
    JsonSchema4 schema,
    BuildContext context,
    List<Widget> widgets,
  );

  Widget getFormWidget(BuildContext context);
}
