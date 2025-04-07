import 'package:example/old/_old.dart';
import 'package:flutter/material.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
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
    if (((uiSchema?['elements'] as List?)?.length ?? 1) > 1) {
      print(uiSchema?['elements']);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: (uiSchema?['elements'] as List?)
              ?.cast<Map<String, dynamic>>()
              .map(
            (e) {
              return JsonSchemaGenerator.buildUiSchema(schema, e, renderers);
            },
          ).toList() ??
          [],
    );
  }
}
