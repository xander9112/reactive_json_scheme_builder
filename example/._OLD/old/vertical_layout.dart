import 'package:example/old/_old.dart';
import 'package:flutter/material.dart';

class VerticalLayout extends StatelessWidget {
  const VerticalLayout({
    required this.schema,
    this.uiSchema,
    super.key,
    this.renderers = const [],
  });

  final Map<String, dynamic> schema;
  final Map<String, dynamic>? uiSchema;

  final List<Map<String, RenderDef>> renderers;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          (uiSchema?['elements'] as List).cast<Map<String, dynamic>>().map(
        (e) {
          return JsonSchemaGenerator.buildUiSchema(schema, e, renderers);
        },
      ).toList(),
    );
  }
}
