import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class HorizontalLayout extends StatelessWidget {
  const HorizontalLayout({
    required this.uiSchema,
    required this.schema,
    required this.jsonForms,
    required this.createWidgets,
    super.key,
  });

  final UISchemaElement uiSchema;
  final JsonSchema4 schema;
  final JsonForms<dynamic> jsonForms;
  final List<Widget> Function(
    UISchemaElement uiSchema,
    JsonSchema4 schema,
    BuildContext context,
    List<Widget> widgets,
  ) createWidgets;

  static String type = 'HorizontalLayout';

  static Widget render(
    UISchemaElement uiSchema,
    JsonSchema4 schema,
    JsonForms<FormGroup> jsonForms,
    List<Widget> Function(
      UISchemaElement uiSchema,
      JsonSchema4 schema,
      BuildContext context,
      List<Widget> widgets,
    ) createWidgets,
  ) =>
      HorizontalLayout(
        uiSchema: uiSchema,
        schema: schema,
        jsonForms: jsonForms,
        createWidgets: createWidgets,
      );

  @override
  Widget build(BuildContext context) {
    final List<Widget> localWidgets = [];

    for (final element in uiSchema.elements!) {
      final List<Widget> current =
          createWidgets(element, schema, context, []).toList();

      localWidgets.addAll(current);
    }

    return Row(
      children: localWidgets.map((e) => Expanded(child: e)).toList(),
    );
  }
}
