import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.uiSchema,
    required this.schema,
    required this.jsonForms,
    required this.createWidgets,
  });

  final UISchemaElement uiSchema;
  final JsonSchema4 schema;
  final JsonForms jsonForms;
  final List<Widget> Function(
    UISchemaElement uiSchema,
    JsonSchema4 schema,
    BuildContext context,
    List<Widget> widgets,
  ) createWidgets;

  @override
  Widget build(BuildContext context) {
    List<Widget> localWidgets = [];

    for (var element in uiSchema.elements!) {
      List<Widget> current = createWidgets(
        element,
        schema,
        context,
        [],
      ).toList();

      localWidgets.addAll(current);
    }

    return Container(
      color: Colors.green.withValues(alpha: 0.2),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        children: localWidgets,
      ),
    );
  }
}
