import 'package:example/old/grid_layout.dart';
import 'package:example/old/json_scheme_generator.dart';
import 'package:example/old/json_scheme_generator_ui_schema.dart';
import 'package:example/old/renderers.dart';
import 'package:flutter/widgets.dart';

final List<Map<String, RenderDef>> customRenderers = [
  {
    'GRID_COMPONENT': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) =>
        GridLayout(
          schema: schema,
          uiSchema: uiSchema,
          renderers: renderers as List<Map<String, RenderDef>>,
        ),
  },
  {
    'INPUT_TEXT': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) {
      if (useUiSchema) {
        return Column(
          children: [
            const Text('Custom text field'),
            JsonSchemaGeneratorUiSchema.buildTextField(schema, uiSchema),
          ],
        );
      }

      return Column(
        children: [
          const Text('Custom text field'),
          JsonSchemaGenerator.buildTextField(schema, uiSchema),
        ],
      );
    },
  },
  {
    'INPUT_INT': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) {
      if (useUiSchema) {
        return Column(
          children: [
            const Text('Custom text field'),
            JsonSchemaGeneratorUiSchema.buildIntField(schema, uiSchema),
          ],
        );
      }

      return Column(
        children: [
          const Text('Custom text field'),
          JsonSchemaGenerator.buildIntField(schema, uiSchema),
        ],
      );
    },
  },
  {
    'DROP_DOWN': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) {
      return const Column(
        children: [
          Text('DROP_DOWN text field'),
          // JsonSchemaGenerator.buildTextField(schema, uiSchema),
        ],
      );
    },
  },
];
