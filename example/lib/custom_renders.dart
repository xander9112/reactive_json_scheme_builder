import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

import 'layouts/grid_layout.dart';

final List<Map<String, RenderType>> customRenders = [
  {
    'GridLayout': (
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
    GridLayout.type: (
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
    'INPUT_TEXT': (
      UISchemaElement uiSchema,
      JsonSchema4 schema,
      JsonForms jsonForms,
    ) {
      final List<String> parts = uiSchema.scope!.split('/')..removeAt(0);
      String label = uiSchema.label ?? camelCaseToWords(parts.last);

      final String formControlName =
          parts.whereNot((element) => element == 'properties').join('.');

      if (schema.required != null && schema.required!.contains(parts.last)) {
        label += '*';
      }

      final JsonSchema4 item = getItemFromJsonScheme(parts, schema);

      final bool? multi = uiSchema.options?['multi'] as bool?;

      return ReactiveTextControl(
        formControlName: formControlName,
        label: label,
        description: item.description,
        path: getParts(uiSchema.scope!),
        jsonData: const {},
        callback: (Map<String, dynamic> data) {
          // callback(data);
        },
        minLength: item.minLength,
        multi: multi,
      );
    }
  },
  {
    'INPUT_NUMBER': (
      UISchemaElement uiSchema,
      JsonSchema4 schema,
      JsonForms jsonForms,
    ) {
      final List<String> parts = uiSchema.scope!.split('/')..removeAt(0);
      String label = uiSchema.label ?? camelCaseToWords(parts.last);
      final String formControlName =
          parts.whereNot((element) => element == 'properties').join('.');

      if (schema.required != null && schema.required!.contains(parts.last)) {
        label += '*';
      }

      final JsonSchema4 item = getItemFromJsonScheme(parts, schema);

      return ReactiveNumberControl(
        formControlName: formControlName,
        label: label,
        description: item.description,
        path: getParts(uiSchema.scope!),
        jsonData: const {},
        callback: (Map<String, dynamic> data) {
          // callback(data);
        },
      );
    }
  },
  {
    'DROP_DOWN': (
      UISchemaElement uiSchema,
      JsonSchema4 schema,
      JsonForms jsonForms,
    ) {
      final List<String> parts = uiSchema.scope!.split('/')..removeAt(0);
      String label = uiSchema.label ?? camelCaseToWords(parts.last);
      final String formControlName =
          parts.whereNot((element) => element == 'properties').join('.');

      if (schema.required != null && schema.required!.contains(parts.last)) {
        label += '*';
      }

      final JsonSchema4 item = getItemFromJsonScheme(parts, schema);

      return ReactiveDropdownControl(
        formControlName: formControlName,
        label: label,
        description: item.description,
        path: getParts(uiSchema.scope!),
        jsonData: const {},
        callback: (Map<String, dynamic> data) {
          // callback(data);
        },
        enumValues: item.enumValues! as List<String>,
      );
    }
  },
  {
    'SWITCH': (
      UISchemaElement uiSchema,
      JsonSchema4 schema,
      JsonForms jsonForms,
    ) {
      final List<String> parts = uiSchema.scope!.split('/')..removeAt(0);
      String label = uiSchema.label ?? camelCaseToWords(parts.last);
      final String formControlName =
          parts.whereNot((element) => element == 'properties').join('.');

      if (schema.required != null && schema.required!.contains(parts.last)) {
        label += '*';
      }

      final JsonSchema4 item = getItemFromJsonScheme(parts, schema);

      return ReactiveSwitchControl(
        formControlName: formControlName,
        label: label,
        description: item.description,
        path: getParts(uiSchema.scope!),
        jsonData: const {},
      );
    }
  },
  {
    'BUTTON': (
      UISchemaElement uiSchema,
      JsonSchema4 schema,
      JsonForms jsonForms,
    ) {
      String label = uiSchema.label ?? 'Button';

      return ElevatedButton(onPressed: () {}, child: Text(label));
    }
  },
];
