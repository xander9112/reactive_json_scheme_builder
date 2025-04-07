import 'package:example/old/_old.dart';
import 'package:flutter/material.dart';

class HorizontalLayout extends StatelessWidget {
  const HorizontalLayout({
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: (uiSchema?['elements'] as List?)
              ?.cast<Map<String, dynamic>>()
              .map(
            (e) {
              return Expanded(
                child: JsonSchemaGenerator.buildUiSchema(schema, e, renderers),
              );
            },
          ).toList() ??
          [],
    );
  }
}
