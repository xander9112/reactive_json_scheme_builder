import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

import 'layouts/grid_layout.dart';

final List<Map<String, RenderType<FormGroup>>> customRenders = [
  {
    'GridLayout': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
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
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
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
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
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
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
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
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
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
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
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
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      String label = uiSchema.label ?? 'Button';

      return ElevatedButton(
          onPressed: () {
            jsonForms.onSubmit(jsonForms.form.value);
          },
          child: Text(label));
    }
  },
];
