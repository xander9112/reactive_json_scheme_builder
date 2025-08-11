import 'package:example/table.dart';
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
        helper: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
        options: TextOptions.fromJson(uiSchema.options!),
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
        options: TextAreaOptions.fromJson(uiSchema.options!),
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
        helper: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
        mask: uiSchema.options?['mask'],
        options: TextOptions.fromJson(uiSchema.options!),
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
        options: NumberOptions.fromJson(uiSchema.options!),
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
  // {
  //   'CHECKBOX': (
  //     JsonSchema4 schema,
  //     UISchemaElement uiSchema,
  //     JsonForms<FormGroup> jsonForms,
  //   ) {
  //     return ReactiveCheckboxControl(
  //       formControlName: JFUtils.getFormControlName(schema, uiSchema),
  //       label: JFUtils.getLabel(schema, uiSchema),
  //       description: JFUtils.getDescription(schema, uiSchema),
  //       path: JFUtils.getParts(uiSchema.scope),
  //     );
  //   }
  // },

  {
    'SLIDER': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      final JsonSchema4 item = JFUtils.getItemFromJsonScheme(
          JFUtils.getParts(uiSchema.scope)!, schema);

      if (item.isNumber) {
        return ReactiveSliderControl(
          formControlName: JFUtils.getFormControlName(schema, uiSchema),
          label: JFUtils.getLabel(schema, uiSchema),
          helper: JFUtils.getDescription(schema, uiSchema),
          path: JFUtils.getParts(uiSchema.scope),
          options: SliderOptions.fromJson(uiSchema.options!),
        );
      }

      return ReactiveSliderRangeControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        helper: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
        options: SliderOptions.fromJson(uiSchema.options!),
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
        options: DateOptions.fromJson({
          ...uiSchema.options!,
          'format': JFUtils.getItemFromJsonScheme(
                  JFUtils.getParts(uiSchema.scope)!, schema)
              .format
        }),
      );
    }
  },
  {
    'DATE_RANGE': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return ReactiveDateRangeControl(
        formControlName: JFUtils.getFormControlName(schema, uiSchema),
        label: JFUtils.getLabel(schema, uiSchema),
        description: JFUtils.getDescription(schema, uiSchema),
        path: JFUtils.getParts(uiSchema.scope),
        options: DateOptions.fromJson({
          ...uiSchema.options!,
          'format': JFUtils.getItemFromJsonScheme(
                  JFUtils.getParts(uiSchema.scope)!, schema)
              .format
        }),
      );
    }
  },
  {
    'BUTTON': (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      String label = JFUtils.getLabel(schema, uiSchema) ?? 'Button';

      final options = ButtonOptions.fromJson(uiSchema.options!);

      if (options.buttonType.isSubmit) {
        return ElevatedButton(
            onPressed: () {
              jsonForms.onSubmit(jsonForms.form.value);
            },
            child: Text(label));
      }

      if (options.buttonType.isReset) {
        return OutlinedButton(onPressed: jsonForms.onReset, child: Text(label));
      }

      return TextButton(
          onPressed: () {
            jsonForms.onPressed('custom_event');
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
        padding: const EdgeInsets.all(16),
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
  {
    PagesComponent.type: (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return PagesComponent(
        uiSchema: uiSchema,
        schema: schema,
        jsonForms: jsonForms,
        createWidgets: jsonForms.createWidgets,
      );
    }
  },
  {
    UiTable.type: (
      JsonSchema4 schema,
      UISchemaElement uiSchema,
      JsonForms<FormGroup> jsonForms,
    ) {
      return UiTable(
        uiSchema: uiSchema,
        schema: schema,
        jsonForms: jsonForms,
        createWidgets: jsonForms.createWidgets,
        options: TableOptions.fromJson(uiSchema.options!),
      );
    }
  },
];
