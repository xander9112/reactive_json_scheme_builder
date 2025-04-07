import 'package:example/old/_old.dart';
import 'package:flutter/widgets.dart';

typedef RenderDef = Widget Function(
  Map<String, dynamic>,
  Map<String, dynamic>?,
  bool, [
  List<Map<String, dynamic>>,
]);

List<Map<String, RenderDef>> renderers = [
  {
    'VerticalLayout': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) =>
        VerticalLayout(
          schema: schema,
          uiSchema: uiSchema,
          renderers: renderers as List<Map<String, RenderDef>>,
        ),
  },
  {
    'HorizontalLayout': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) =>
        HorizontalLayout(
          schema: schema,
          uiSchema: uiSchema,
          renderers: renderers as List<Map<String, RenderDef>>,
        ),
  },
  {
    'object': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) {
      final fieldName = schema.entries.first.key;

      final title =
          schema['title'] as String? ?? schema['description'] as String?;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) Text(title),
          ...(schema.entries.first.value['properties'] as Map<String, dynamic>)
              .entries
              .map(
            (e) {
              return JsonSchemaGenerator.buildProperty(
                '$fieldName.${e.key}',
                e.value as Map<String, dynamic>,
                uiSchema,
                renderers as List<Map<String, RenderDef>>,
              );
            },
          ),
        ],
      );
    },
  },
  {
    'string': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) {
      if (useUiSchema) {
        return JsonSchemaGeneratorUiSchema.buildTextField(schema, uiSchema);
      }

      return JsonSchemaGenerator.buildTextField(schema, uiSchema);
    },
  },
  {
    'number': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) {
      if (useUiSchema) {
        return JsonSchemaGeneratorUiSchema.buildNumberField(schema, uiSchema);
      }

      return JsonSchemaGenerator.buildNumberField(schema, uiSchema);
    },
  },
  {
    'integer': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) {
      if (useUiSchema) {
        return JsonSchemaGeneratorUiSchema.buildIntField(schema, uiSchema);
      }

      return JsonSchemaGenerator.buildIntField(schema, uiSchema);
    },
  },
  {
    'boolean': (
      Map<String, dynamic> schema,
      Map<String, dynamic>? uiSchema,
      bool useUiSchema, [
      List<Map<String, dynamic>> renderers = const [],
    ]) {
      if (useUiSchema) {
        return JsonSchemaGeneratorUiSchema.buildBoolField(schema, uiSchema);
      }

      return JsonSchemaGenerator.buildBoolField(schema, uiSchema);
    },
  }
];
