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

          final JsonSchema4 item = JFUtils.getItemFromJsonScheme(parts, schema);

          switch (item.type) {
            case 'string':
              if (item.format == PropertyFormat.date.name) {
                return ReactiveDateControl(
                  formControlName: JFUtils.getFormControlName(schema, uiSchema),
                  label: JFUtils.getLabel(schema, uiSchema),
                  description: JFUtils.getDescription(schema, uiSchema),
                  path: JFUtils.getParts(uiSchema.scope),
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
                  formControlName: JFUtils.getFormControlName(schema, uiSchema),
                  label: JFUtils.getLabel(schema, uiSchema),
                  description: JFUtils.getDescription(schema, uiSchema),
                  path: JFUtils.getParts(uiSchema.scope),
                  enumValues: item.enumValues! as List<String>,
                );
              }

              return ReactiveTextControl(
                formControlName: JFUtils.getFormControlName(schema, uiSchema),
                label: JFUtils.getLabel(schema, uiSchema),
                description: JFUtils.getDescription(schema, uiSchema),
                path: JFUtils.getParts(uiSchema.scope),
              );
            case 'boolean':
              return ReactiveCheckboxControl(
                formControlName: JFUtils.getFormControlName(schema, uiSchema),
                label: JFUtils.getLabel(schema, uiSchema),
                description: JFUtils.getDescription(schema, uiSchema),
                path: JFUtils.getParts(uiSchema.scope),
              );
            case 'integer':
              return ReactiveIntegerControl(
                formControlName: JFUtils.getFormControlName(schema, uiSchema),
                label: JFUtils.getLabel(schema, uiSchema),
                description: JFUtils.getDescription(schema, uiSchema),
                path: JFUtils.getParts(uiSchema.scope),
              );
            case 'number':
              return ReactiveNumberControl(
                formControlName: JFUtils.getFormControlName(schema, uiSchema),
                label: JFUtils.getLabel(schema, uiSchema),
                description: JFUtils.getDescription(schema, uiSchema),
                path: JFUtils.getParts(uiSchema.scope),
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
