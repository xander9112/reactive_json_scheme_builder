import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

import 'layouts/_layouts.dart';

final List<Map<String, RenderType<FormGroup>>> forceUIRenders = [
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
      return ReactiveTextControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
      );
    }
  },
  {
    'INPUT_PASSWORD': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return ReactivePasswordControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
      );
    }
  },
  {
    'TEXT_AREA': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return ReactiveTextAreaControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
      );
    }
  },
  {
    'INPUT_MASK': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return ReactiveTextMaskControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
        mask: uiSchema.options?['mask'],
      );
    }
  },
  {
    'INPUT_NUMBER': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return ReactiveNumberControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
      );
    }
  },
  {
    'DROP_DOWN': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return ReactiveDropdownControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
        enumValues: JFUtils.getItems(uiSchema),
      );
    }
  },
  {
    'RADIO': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return ReactiveRadioControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
        enumValues: JFUtils.getItems(uiSchema),
      );
    }
  },
  {
    'SWITCH': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return ReactiveSwitchControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
      );
    }
  },
  {
    'CHECKBOX': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return ReactiveCheckboxControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
      );
    }
  },
  {
    'DATE': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return ReactiveDateControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
      );
    }
  },

  // {
  //   'DATE_RANGE': (
  //     JsonSchema4 schema,
  //     UISchemaElement uiSchema,
  //     JsonForms<FormGroup> jsonForms,
  //   ) {
  //     final List<String> parts = uiSchema.scope.split('/')..removeAt(0);
  //     String label = uiSchema.label ?? camelCaseToWords(parts.last);
  //     final String formControlName =
  //         parts.whereNot((element) => element == 'properties').join('.');

  //     if (schema.required != null && schema.required!.contains(parts.last)) {
  //       label += '*';
  //     }

  //     final JsonSchema4 item = getItemFromJsonScheme(parts, schema);

  //     return ReactiveRangeDateControl(
  //       formControlName: formControlName,
  //       label: label,
  //       callback: (data) {},
  //       path: getParts(uiSchema.scope),
  //       jsonData: const {},
  //     );
  //   }
  // },
  {
    'BUTTON': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      String label = JFUtils.getLabel(schema, uiSchema) ?? 'Button';

      return ElevatedButton(
          onPressed: () {
            jsonForms.onSubmit(jsonForms.form.value);
          },
          child: Text(label));
    }
  },
  {
    'TITLE': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      String label = JFUtils.getLabel(schema, uiSchema) ?? 'Title';

      return Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Text(
          label,
          style: TextStyle(fontSize: 18),
        ),
      );
    }
  },
  {
    'DIVIDER': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return Divider();
    }
  },
  {
    TabComponent.type: (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return TabComponent(
        uiSchema: uiSchema,
        schema: schema,
        jsonForms: jsonForms,
        createWidgets: jsonForms.createWidgets,
      );
    }
  },
];
