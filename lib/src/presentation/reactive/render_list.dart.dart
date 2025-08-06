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
            HorizontalLayout(
              createWidgets: createWidgets,
              schema: schema,
              uiSchema: uiSchema,
              jsonForms: jsonForms,
            ),
      },
      {
        VerticalLayout.type: (
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
          return ListTile(title: Text(uiSchema.text!));
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
              if (PropertyFormat.fromString(item.format ?? '')?.isDateTime ??
                  false) {
                return ReactiveDateControl(
                  formControlName: JFUtils.getFormControlName(schema, uiSchema),
                  label: JFUtils.getLabel(schema, uiSchema),
                  description: JFUtils.getDescription(schema, uiSchema),
                  path: JFUtils.getParts(uiSchema.scope),
                  options: DateOptions.fromJson(uiSchema.options!),
                );
              }

              if (item.format == PropertyFormat.email.name) {
                return ReactiveEmailControl(
                  formControlName: JFUtils.getFormControlName(schema, uiSchema),
                  label: JFUtils.getLabel(schema, uiSchema),
                  helper: item.description,
                  path: JFUtils.getParts(uiSchema.scope),
                  options: TextOptions.fromJson(uiSchema.options!),
                );
              }

              if (item.format == PropertyFormat.uri.name) {
                return ReactiveUriControl(
                  formControlName: JFUtils.getFormControlName(schema, uiSchema),
                  label: JFUtils.getLabel(schema, uiSchema),
                  helper: item.description,
                  path: JFUtils.getParts(uiSchema.scope),
                  options: TextOptions.fromJson(uiSchema.options!),
                );
              }

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
                helper: JFUtils.getDescription(schema, uiSchema),
                path: JFUtils.getParts(uiSchema.scope),
                options: TextOptions.fromJson(uiSchema.options!),
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
                options: NumberOptions.fromJson(uiSchema.options!),
              );
            // case 'array':
            //   final JsonSchema4 item = JFUtils.getItemFromJsonScheme(
            //     JFUtils.getParts(uiSchema.scope)!,
            //     schema,
            //   );

            //   print(item.type);
            //   if (item.isNumber) {
            //     return ReactiveSliderControl(
            //       formControlName: JFUtils.getFormControlName(schema, uiSchema),
            //       label: JFUtils.getLabel(schema, uiSchema),
            //       helper: JFUtils.getDescription(schema, uiSchema),
            //       path: JFUtils.getParts(uiSchema.scope),
            //       options: SliderOptions.fromJson(uiSchema.options!),
            //     );
            //   }

            //   return const SizedBox();

            //   return ReactiveSliderRangeControl(
            //     formControlName: JFUtils.getFormControlName(schema, uiSchema),
            //     label: JFUtils.getLabel(schema, uiSchema),
            //     helper: JFUtils.getDescription(schema, uiSchema),
            //     path: JFUtils.getParts(uiSchema.scope),
            //     options: SliderOptions.fromJson(uiSchema.options!),
            //   );

            default:
              return const SizedBox();
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
