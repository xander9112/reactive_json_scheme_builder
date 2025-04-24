import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class HorizontalLayout extends StatelessWidget {
  const HorizontalLayout({
    required this.schema,
    required this.uiSchema,
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

  static String type = 'HorizontalLayout';

  static Widget render(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
    JsonForms<FormGroup> jsonForms,
    List<Widget> Function(
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      List<Widget> widgets,
    ) createWidgets,
  ) =>
      HorizontalLayout(
        schema: schema,
        uiSchema: uiSchema,
        jsonForms: jsonForms,
        createWidgets: createWidgets,
      );

  @override
  Widget build(BuildContext context) {
    final List<Widget> localWidgets = [];

    for (final element in uiSchema.elements!) {
      final List<Widget> current = createWidgets(schema, element, []).toList();

      localWidgets.addAll(current);
    }

    return Row(
      children: localWidgets.map((e) => Expanded(child: e)).toList(),
    );
  }
}
