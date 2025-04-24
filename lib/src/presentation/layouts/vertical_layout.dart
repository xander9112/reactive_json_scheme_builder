import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class VerticalLayout extends StatelessWidget {
  const VerticalLayout({
    required this.uiSchema,
    required this.schema,
    required this.jsonForms,
    required this.createWidgets,
    super.key,
  });

  final JsonSchema4 schema;
  final UISchemaElement uiSchema;
  final JsonForms<dynamic> jsonForms;
  final List<Widget> Function(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
    List<Widget> widgets,
  ) createWidgets;

  @override
  Widget build(BuildContext context) {
    final List<Widget> localWidgets = [];

    for (final element in uiSchema.elements!) {
      final List<Widget> current = createWidgets(
        schema,
        element,
        [],
      ).toList();

      localWidgets.addAll(current);
    }

    return Column(children: localWidgets);
  }
}
