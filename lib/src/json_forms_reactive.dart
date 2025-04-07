import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class JsonFormsReactive implements JsonForms {
  JsonFormsReactive(
    Map<String, dynamic> dataSchemaJson,
    Map<String, dynamic> uiSchemaJson,
    Map<String, dynamic> dataJson,
    List<Map<String, RenderType>>? customRenderList,
    this.callback,
  ) {
    dataSchema = JsonSchema4.fromJson(dataSchemaJson);
    uiSchema = UISchemaElement.fromJson(uiSchemaJson);
    data = dataJson;
    renderList = [...myRenderList];

    if (customRenderList != null && customRenderList.isNotEmpty) {
      renderList.addAll(customRenderList);
    }
  }
  @override
  late UISchemaElement uiSchema;
  @override
  late JsonSchema4 dataSchema;
  @override
  late Map<String, dynamic> data;
  @override
  final JsonFormsCallback callback;
  @override
  late final List<Map<String, RenderType>> renderList;

  @override
  final formKey = GlobalKey<FormState>();

  @override
  List<Map<String, RenderType>> get myRenderList => [
        {
          'HorizontalLayout': (
            BuildContext context,
            UISchemaElement uiSchema,
            JsonSchema4 schema,
            JsonForms jsonForms,
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
            BuildContext context,
            UISchemaElement uiSchema,
            JsonSchema4 schema,
            JsonForms jsonForms,
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
            BuildContext context,
            UISchemaElement uiSchema,
            JsonSchema4 schema,
            JsonForms jsonForms,
          ) {
            return ListTile(
              title: Text(
                uiSchema.text!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          },
        },
        {
          'Control': (
            BuildContext context,
            UISchemaElement uiSchema,
            JsonSchema4 schema,
            JsonForms jsonForms,
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
                  jsonData: const {},
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
            BuildContext context,
            UISchemaElement uiSchema,
            JsonSchema4 schema,
            JsonForms jsonForms,
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

  FormGroup createFormGroup() {
    return _buildFormGroup(
      dataSchema.properties!,
      dataSchema.required,
    );
  }

  FormGroup _buildFormGroup(
    Map<String, JsonSchema4> properties,
    List<String>? requiredList,
  ) {
    final controls = <String, AbstractControl<dynamic>>{};

    properties.forEach((name, value) {
      final type = value.type;

      switch (type) {
        case 'object':
          controls[name] = _parseObject(
            value.properties,
            requiredList,
          );
        case 'array':
          // _parseArray(value);
          break;
        case 'string':
        case 'number':
        case 'integer':
        case 'boolean':
        case 'null':
          controls[name] = _buildControl({name: value}, requiredList);
        default:
          throw ArgumentError('Неизвестный тип: $type');
      }
    });

    return FormGroup(controls);
  }

  // Преобразует тип "object" в FormGroup
  FormGroup _parseObject(
    Map<String, JsonSchema4>? properties,
    List<String>? requiredList,
  ) {
    final controls = <String, AbstractControl<dynamic>>{};

    properties?.forEach((name, value) {
      controls[name] = _buildControl(
        {name: value},
        requiredList,
      ); // рекурсивный вызов для вложенных объектов
    });

    return FormGroup(controls);
  }

  AbstractControl<dynamic> _buildControl(
    Map<String, JsonSchema4> schema,
    List<String>? requiredList,
  ) {
    // final controlName = schema.entries.first.key;
    final controlProperties = schema.entries.first.value;

    final type = controlProperties.type;
    final readOnly = controlProperties.constValue != null;

    switch (type) {
      case 'string':
        return FormControl<String>(
          validators: _parseValidators(schema, requiredList),
          disabled: readOnly,
          value: readOnly ? schema['const'].toString() : null,
        );
      case 'number':
        return FormControl<double>(
          validators: _parseValidators(schema, requiredList),
        );
      case 'integer':
        return FormControl<int>(
          validators: _parseValidators(schema, requiredList),
        );
      case 'boolean':
        return FormControl<bool>();
      case 'null':
        return FormControl<Null>();
      default:
        throw Exception('Unsupported JSON Schema type: $type');
    }
  }

  // Добавляем валидаторы, если они присутствуют в схеме
  List<Validator<dynamic>> _parseValidators(
    Map<String, JsonSchema4> schema,
    List<String>? requiredList,
  ) {
    final controlName = schema.entries.first.key;
    // final controlProperties = schema.entries.first.value;

    final validators = <Validator<dynamic>>[];

    if (requiredList?.contains(controlName) ?? false) {
      validators.add(Validators.required);
    }
    // if (schema['minLength'] != null) {
    //   validators
    //       .add(Validators.minLength(controlProperties.minLength as int));
    // }

    // if (schema['maxLength'] != null) {
    //   validators
    //       .add(Validators.maxLength(controlProperties['maxLength'] as int));
    // }

    // if (schema['pattern'] != null) {
    //   validators
    //       .add(Validators.pattern(controlProperties['pattern'].toString()));
    // }

    return validators;
  }

  @override
  Widget getControl(
    UISchemaElement uiSchema,
    JsonSchema4 schema,
    BuildContext context,
  ) {
    final List<String> parts = uiSchema.scope!.split('/')..removeAt(0);
    String label = uiSchema.label ?? camelCaseToWords(parts.last);

    if (schema.required != null && schema.required!.contains(parts.last)) {
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
            jsonData: data,
            callback: callback,
          );
        }

        if (item.format == PropertyFormat.email.name) {
          return EmailControl(
            label: label,
            description: item.description,
            path: getParts(uiSchema.scope!),
            jsonData: data,
            callback: callback,
            multi: multi,
          );
        }

        if (item.format == PropertyFormat.uri.name) {
          return UriControl(
            label: label,
            description: item.description,
            path: getParts(uiSchema.scope!),
            jsonData: data,
            callback: callback,
            multi: multi,
          );
        }

        if (item.enumValues != null) {
          return DropdownControl(
            label: label,
            description: item.description,
            path: getParts(uiSchema.scope!),
            jsonData: data,
            callback: callback,
            enumValues: item.enumValues! as List<String>,
          );
        }

        return TextControl(
          label: label,
          description: item.description,
          path: getParts(uiSchema.scope!),
          jsonData: data,
          callback: callback,
          minLength: item.minLength,
          multi: multi,
        );
      case 'boolean':
        return CheckboxControl(
          label: label,
          path: getParts(uiSchema.scope!),
          jsonData: data,
          callback: callback,
        );
      case 'integer':
        return IntegerControl(
          label: label,
          description: item.description,
          path: getParts(uiSchema.scope!),
          jsonData: data,
          callback: callback,
        );
      case 'number':
        return NumberControl(
          label: label,
          description: item.description,
          path: getParts(uiSchema.scope!),
          jsonData: data,
          callback: callback,
        );
      default:
        return Container();
    }
  }

  @override
  List<Widget> createWidgets(
    UISchemaElement uiSchema,
    JsonSchema4 schema,
    BuildContext context,
    List<Widget> widgets,
  ) {
    final render = renderList.firstWhereOrNull(
      (element) => element.entries.first.key == uiSchema.type,
    );

    if (render == null) {
      widgets.add(
        Text(
          'Unknown render',
          style: TextStyle(color: Theme.of(context).colorScheme.error),
        ),
      );
    } else {
      widgets.add(render.entries.first.value(context, uiSchema, schema, this));
    }

    return widgets;
  }

  @override
  Widget getFormWidget(BuildContext context) {
    return ReactiveForm(
      formGroup: createFormGroup(),
      child: ListView(
        children: createWidgets(uiSchema, dataSchema, context, []),
      ),
    );
  }
}
