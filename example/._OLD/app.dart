import 'dart:convert';

import 'package:example/custom_renderers.dart';
import 'package:example/old/json_schemas.dart';
import 'package:example/old/json_scheme_form.dart';
import 'package:example/old/json_scheme_parser.dart';
import 'package:example/src/json_forms.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final schema = jsonDecode(newSchema) as Map<String, dynamic>;
    final jsonFormsSchema = jsonDecode(jsonForms) as Map<String, dynamic>;
    final jsonFormsUiSchemaa =
        jsonDecode(jsonFormsUiSchema) as Map<String, dynamic>;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text('JSON Schema Form')),
          body: JsonFormsSchemaFormWidget(
            schema: schema,
            uiSchema: jsonFormsUiSchemaa,
          )

          // JsonSchemaFormWidget(schema: schema),
          ),
    );
  }
}

class JsonSchemaFormWidget extends StatelessWidget {
  const JsonSchemaFormWidget({super.key, required this.schema});

  final Map<String, dynamic> schema;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: JsonSchemaForm(
        formGroup: JsonSchemaParser.parse(schema),
        schema: schema,
        // uiSchema: jsonDecode(uiSchema) as Map<String, dynamic>,
        customRenderers: customRenderers,
      ),
    );
  }
}

class JsonFormsSchemaFormWidget extends StatelessWidget {
  const JsonFormsSchemaFormWidget(
      {super.key, required this.schema, required this.uiSchema});

  final Map<String, dynamic> schema;
  final Map<String, dynamic> uiSchema;

  jsonFormUpdate(Map<String, dynamic> newData) {
    print(newData);
  }

  @override
  Widget build(BuildContext context) {
    final jsonForms = JsonForms(schema, uiSchema, {}, jsonFormUpdate);

    return jsonForms.getWidget(context);
  }
}
