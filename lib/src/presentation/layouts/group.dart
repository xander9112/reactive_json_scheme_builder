import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class GroupLayout extends StatelessWidget {
  const GroupLayout({
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
      final List<Widget> current = createWidgets(schema, element, []);

      localWidgets.addAll(current);
    }

    return Column(
      children: [
        ListTile(
          title: Text(
            uiSchema.label!,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          visualDensity: const VisualDensity(
            horizontal: VisualDensity.minimumDensity,
            vertical: VisualDensity.minimumDensity,
          ),
        ),
        ...localWidgets,
      ],
    );
  }
}
