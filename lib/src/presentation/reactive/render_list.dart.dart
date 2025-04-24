import 'package:collection/collection.dart';
import 'package:flutter/material.dart' show ListTile;
import 'package:flutter/widgets.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/src/_src.dart';

List<Map<String, RenderType<FormGroup>>> reactiveRenderList(
  List<Widget> Function(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
    List<Widget> widgets,
  ) createWidgets,
) =>
    [
      {
        HorizontalLayout.type: (
          JsonSchema4 schema,
          UISchemaElement uiSchema,
          JsonForms<FormGroup> jsonForms,
        ) =>
            HorizontalLayout.render(schema, uiSchema, jsonForms, createWidgets),
      },
      {
        'VerticalLayout': (
          JsonSchema4 schema,
          UISchemaElement uiSchema,
          JsonForms<FormGroup> jsonForms,
        ) {
          return VerticalLayout(
            uiSchema: uiSchema,
            schema: schema,
            jsonForms: jsonForms,
            createWidgets: createWidgets,
          );
        },
      },
      {
        'Label': (
          JsonSchema4 schema,
          UISchemaElement uiSchema,
          JsonForms<FormGroup> jsonForms,
        ) {
          return ListTile(
            title: Text(
              uiSchema.text!,
            ),
          );
        },
      },
      {
        'Control': (
          JsonSchema4 schema,
          UISchemaElement uiSchema,
          JsonForms<FormGroup> jsonForms,
        ) {
          final List<String> parts = uiSchema.scope!.split('/')..removeAt(0);
          String label = uiSchema.label ?? camelCaseToWords(parts.last);

          final String formControlName =
              parts.whereNot((element) => element == 'properties').join('.');

          if (schema.required != null &&
              schema.required!.contains(parts.last)) {
            label += '*';
          }

          final JsonSchema4 item = getItemFromJsonScheme(parts, schema);

          switch (item.type) {
            case 'string':
              final bool? multi = uiSchema.options?['multi'] as bool?;

              if (item.format == PropertyFormat.date.name) {
                return ReactiveDateControl(
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

              // if (item.format == PropertyFormat.email.name) {
              //   return EmailControl(
              //     label: label,
              //     description: item.description,
              //     path: getParts(uiSchema.scope!),
              //     jsonData: {},
              //     callback: (Map<String, dynamic> data) {
              //       // callback(data);
              //     },
              //     multi: multi,
              //   );
              // }

              // if (item.format == PropertyFormat.uri.name) {
              //   return UriControl(
              //     label: label,
              //     description: item.description,
              //     path: getParts(uiSchema.scope!),
              //     jsonData: {},
              //     callback: (Map<String, dynamic> data) {
              //       // callback(data);
              //     },
              //     multi: multi,
              //   );
              // }

              if (item.enumValues != null) {
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
            case 'boolean':
              return ReactiveCheckboxControl(
                formControlName: formControlName,
                label: label,
                path: getParts(uiSchema.scope!),
                jsonData: const {},
                callback: (Map<String, dynamic> data) {
                  // callback(data);
                },
              );
            case 'integer':
              return ReactiveIntegerControl(
                formControlName: formControlName,
                label: label,
                description: item.description,
                path: getParts(uiSchema.scope!),
                jsonData: const {},
                callback: (Map<String, dynamic> data) {
                  // callback(data);
                },
              );
            case 'number':
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
            default:
              return Container();
          }
        },
      },
      {
        'Group': (
          JsonSchema4 schema,
          UISchemaElement uiSchema,
          JsonForms<FormGroup> jsonForms,
        ) {
          return GroupLayout(
            uiSchema: uiSchema,
            schema: schema,
            jsonForms: jsonForms,
            createWidgets: createWidgets,
          );
        },
      }
    ];
