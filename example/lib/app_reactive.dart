import 'package:example/force_ui_renders.dart';
import 'package:example/form_widget.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class MyAppReactive extends StatefulWidget {
  const MyAppReactive({
    super.key,
    required this.schema,
    this.uiSchema,
    this.data,
  });

  final Map<String, dynamic> schema;
  final Map<String, dynamic>? uiSchema;
  final Map<String, dynamic>? data;

  @override
  State<MyAppReactive> createState() => _MyAppReactiveState();
}

class _MyAppReactiveState extends State<MyAppReactive> {
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
        print(jsonForms.form.errors);
        print(jsonForms.form.value);
        if (jsonForms.form.valid) {
          // print(jsonEncode(
          //     {...value, 'birthDate': value['birthDate'].toString()}));
        } else {
          // print(jsonForms.form.errors);
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('JSON Schema Form')),
        body: UiFormWidget(jsonForm: jsonForms),
      ),
    );
  }
}
