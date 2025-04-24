import 'package:example/custom_renders.dart';
import 'package:example/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class MyAppDefault extends StatelessWidget {
  const MyAppDefault(
      {super.key, required this.schema, this.uiSchema, this.data});

  final Map<String, dynamic> schema;
  final Map<String, dynamic>? uiSchema;
  final Map<String, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    final jsonForms = JsonFormsReactive(
      schema,
      uiSchema ?? {},
      data ?? {},
      customRenders,
      (data) {},
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('JSON Schema Form')),
        body: UiFormWidget(jsonForm: jsonForms),
      ),
    );
  }
}
