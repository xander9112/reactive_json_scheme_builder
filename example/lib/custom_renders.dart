import 'package:example/grid_layout.dart';
import 'package:flutter/widgets.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

final List<Map<String, RenderType>> customRenders = [
  {
    'GridLayout': (
      BuildContext context,
      UISchemaElement uiSchema,
      JsonSchema4 schema,
      JsonForms jsonForms,
    ) {
      return GridLayout(
        uiSchema: uiSchema,
        schema: schema,
        jsonForms: jsonForms,
        createWidgets: jsonForms.createWidgets,
      );
    }
  },
  {
    'Switch': (
      BuildContext context,
      UISchemaElement uiSchema,
      JsonSchema4 schema,
      JsonForms jsonForms,
    ) {
      List<String> parts = uiSchema.scope!.split("/");
      parts.removeAt(0);
      String label = uiSchema.label ?? camelCaseToWords(parts.last);

      if (schema.required != null && schema.required!.contains(parts.last)) {
        label += "*";
      }

      // JsonSchema4 item = getItemFromJsonScheme(parts, schema);

      return SwitchControl(
        label: label,
        path: getParts(uiSchema.scope!),
        jsonData: {},
        callback: (Map<String, dynamic> data) {
          // callback(data);
        },
      );
    }
  }
];
