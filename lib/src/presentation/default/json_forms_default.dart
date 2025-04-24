import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class JsonFormsDefault implements JsonForms<GlobalKey<FormState>> {
  JsonFormsDefault({
    required Map<String, dynamic> jsonSchema,
    required Map<String, dynamic> dataJson,
    required List<Map<String, RenderType<GlobalKey<FormState>>>>?
        customRenderList,
    required this.onSubmit,
    Map<String, dynamic>? uiSchema,
  }) {
    jsonSchemaDTO = JsonSchema4.fromJson(jsonSchema);
    uiSchemaDTO = uiSchema != null
        ? UISchemaElement.fromJson(uiSchema)
        : UISchemaElement.fromJsonSchema(jsonSchema);
    data = dataJson;
    renderList = [...myRenderList];

    if (customRenderList != null && customRenderList.isNotEmpty) {
      renderList.addAll(customRenderList);
    }

    form = GlobalKey<FormState>();
  }

  @override
  late UISchemaElement uiSchemaDTO;

  @override
  late JsonSchema4 jsonSchemaDTO;

  @override
  late Map<String, dynamic> data;

  @override
  late final List<Map<String, RenderType<GlobalKey<FormState>>>> renderList;

  @override
  late final GlobalKey<FormState> form;

  @override
  void Function(Map<String, dynamic> value) onSubmit;

  @override
  List<Map<String, RenderType<GlobalKey<FormState>>>> get myRenderList => [
        {
          'HorizontalLayout': (
            JsonSchema4 schema,
            UISchemaElement uiSchema,
            JsonForms<GlobalKey<FormState>> jsonForms,
          ) {
            return HorizontalLayout(
              uiSchema: uiSchema,
              schema: schema,
              jsonForms: jsonForms,
              createWidgets: createWidgets,
            );
          },
        },
        {
          'VerticalLayout': (
            JsonSchema4 schema,
            UISchemaElement uiSchema,
            JsonForms<GlobalKey<FormState>> jsonForms,
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
            JsonForms<GlobalKey<FormState>> jsonForms,
          ) {
            return ListTile(
              title: Text(
                uiSchema.text!,
                // style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          },
        },
        {
          'Control': (
            JsonSchema4 schema,
            UISchemaElement uiSchema,
            JsonForms<GlobalKey<FormState>> jsonForms,
          ) {
            final List<String> parts = uiSchema.scope!.split('/')..removeAt(0);
            String label = uiSchema.label ?? camelCaseToWords(parts.last);

            if (schema.required != null &&
                schema.required!.contains(parts.last)) {
              label += '*';
            }

            final JsonSchema4 item = getItemFromJsonScheme(parts, schema);

            switch (item.type) {
              case 'string':
                final bool? multi = uiSchema.options?['multi'] as bool?;

                if (item.format == PropertyFormat.date.name) {
                  return DateControl(
                    label: label,
                    description: item.description,
                    path: getParts(uiSchema.scope!),
                    jsonData: const {},
                    callback: (Map<String, dynamic> data) {
                      // callback(data);
                    },
                  );
                }

                if (item.format == PropertyFormat.email.name) {
                  return EmailControl(
                    label: label,
                    description: item.description,
                    path: getParts(uiSchema.scope!),
                    jsonData: const {},
                    callback: (Map<String, dynamic> data) {
                      // callback(data);
                    },
                    multi: multi,
                  );
                }

                if (item.format == PropertyFormat.uri.name) {
                  return UriControl(
                    label: label,
                    description: item.description,
                    path: getParts(uiSchema.scope!),
                    jsonData: const {},
                    callback: (Map<String, dynamic> data) {
                      // callback(data);
                    },
                    multi: multi,
                  );
                }

                if (item.enumValues != null) {
                  return DropdownControl(
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

                return TextControl(
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
              case 'boolean':
                return CheckboxControl(
                  label: label,
                  path: getParts(uiSchema.scope!),
                  jsonData: const {},
                  callback: (Map<String, dynamic> data) {
                    // callback(data);
                  },
                );
              case 'integer':
                return IntegerControl(
                  label: label,
                  description: item.description,
                  path: getParts(uiSchema.scope!),
                  jsonData: const {},
                  callback: (Map<String, dynamic> data) {
                    // callback(data);
                  },
                );
              case 'number':
                return NumberControl(
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
            JsonForms<GlobalKey<FormState>> jsonForms,
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

  @override
  List<Widget> createWidgets(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
    List<Widget> widgets,
  ) {
    final render = renderList.firstWhereOrNull(
      (element) => element.entries.first.key == uiSchema.type,
    );

    if (render == null) {
      widgets.add(
        const Text(
          'Unknown render',
          style: TextStyle(color: Colors.red),
        ),
      );
    } else {
      widgets.add(render.entries.first.value(schema, uiSchema, this));
    }

    return widgets;
  }

  @override
  Widget getFormWidget(
    BuildContext context, {
    EdgeInsets padding = EdgeInsets.zero,
  }) {
    return Form(
      key: form,
      child: ListView(
        padding: padding,
        children: createWidgets(
          jsonSchemaDTO,
          uiSchemaDTO,
          [],
        ),
      ),
    );
  }
}
