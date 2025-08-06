import 'dart:convert';

import 'package:example/force_ui_renders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveFormExample extends StatefulWidget {
  const ReactiveFormExample({
    super.key,
    required this.schema,
    this.uiSchema,
    this.data,
    required this.title,
  });

  final String title;

  final Map<String, dynamic> schema;
  final Map<String, dynamic>? uiSchema;
  final Map<String, dynamic>? data;

  @override
  State<ReactiveFormExample> createState() => _ReactiveFormExampleState();
}

class _ReactiveFormExampleState extends State<ReactiveFormExample> {
  late final JsonFormsReactive jsonForms;

  @override
  void initState() {
    jsonForms = JsonFormsReactive(
      jsonSchema: widget.schema,
      uiSchema: widget.uiSchema,
      dataJson: widget.data,
      customRenderList: forceUIRenders,
      onSubmit: (value) {
        jsonForms.form.markAllAsTouched();
        if (kDebugMode) {
          try {
            print(
                '${widget.title}: value: ${jsonEncode(jsonForms.normalizeFormData(jsonForms.form.value))}');
          } catch (error) {
            print('${widget.title}: ERROR: $error');
          }
          if (jsonForms.form.valid) {
            print('${widget.title}: Form is valid');
          } else {
            print('${widget.title}: Form is invalid');
            print('${widget.title}: errors: ${jsonForms.form.errors}');
          }
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: jsonForms.getFormWidget(context,
            padding: EdgeInsets.only(bottom: 16)));
  }
}
