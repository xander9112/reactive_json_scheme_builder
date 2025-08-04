import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class JsonFormsReactive implements JsonForms<FormGroup> {
  JsonFormsReactive({
    required Map<String, dynamic> jsonSchema,
    required this.onSubmit,
    List<Map<String, RenderType<FormGroup>>>? customRenderList,
    Map<String, dynamic>? dataJson,
    Map<String, dynamic>? uiSchema,
  }) {
    jsonSchemaDTO = JsonSchema4.fromJson(jsonSchema);
    uiSchemaDTO = uiSchema != null
        ? UISchemaElement.fromJson(uiSchema)
        : UISchemaElement.fromJsonSchema(jsonSchema);
    data = dataJson ?? {};
    renderList = [...myRenderList];

    if (customRenderList != null && customRenderList.isNotEmpty) {
      renderList.addAll(customRenderList);
    }

    form = createFormGroup();

    addRules(uiSchemaDTO);

    initSubscribers();
  }

  @override
  late UISchemaElement uiSchemaDTO;

  @override
  late JsonSchema4 jsonSchemaDTO;

  @override
  late Map<String, dynamic> data;

  @override
  late final List<Map<String, RenderType<FormGroup>>> renderList;

  @override
  late final FormGroup form;

  @override
  void Function(Map<String, dynamic> value) onSubmit;

  @override
  List<Map<String, RenderType<FormGroup>>> get myRenderList =>
      reactiveRenderList(createWidgets);

//ключ = scope элемента, с правилом
  //мапа для быстрого обхода по всем правилам
  Map<String, Rule> rules = {};

  StreamSubscription<Map<String, Object?>?>? formSubscription;

  void initSubscribers() {
    formSubscription ??= form.valueChanges.listen((data) {
      //TODO: обсчет правил, применение/откат эффектов
      rules.forEach(
        (key, value) {
          if (key == '#/properties/Address/properties/residentialAddress') {
            final value2 = JFUtils.getValueFromPath(
              data!,
              JFUtils.getParts(value.condition.scope),
            );

            if (value.effect == Effect.hide) {
              (form.control(JFUtils.getParts(key)!.join('.'))
                      as JsonSchemeFormControl)
                  .visible = !(value2 as bool);
            }
          }
        },
      );
    });
  }

  FormGroup createFormGroup() {
    return _buildFormGroup(
      jsonSchemaDTO.properties!,
      jsonSchemaDTO.required,
    );
  }

  void addRules(UISchemaElement element) {
    if (element.rule != null) {
      rules[element.scope ?? ''] = Rule.fromJson(element.rule!);
    }

    for (final child in element.elements ?? <UISchemaElement>[]) {
      addRules(child);
    }
  }

  FormGroup _buildFormGroup(
    Map<String, JsonSchema4> properties,
    List<String>? requiredList, {
    String path = '',
  }) {
    final controls = <String, AbstractControl<dynamic>>{};

    properties.forEach((name, value) {
      final type = value.type;
      final String newPath = path.isEmpty ? name : '$path.$name';

      switch (type) {
        case 'object':
          controls[name] = _parseObject(
            value.properties,
            requiredList,
            path: newPath,
          );
        case 'array':
          // controls[name] = _parseArray(
          //   value.items,
          //   requiredList,
          //   path: newPath,
          // );
          break;
        case 'string':
        case 'number':
        case 'integer':
        case 'boolean':
        case 'null':
          controls[name] =
              _buildControl({name: value}, requiredList, path: newPath);
        default:
          throw ArgumentError('Неизвестный тип: $type');
      }
    });

    return FormGroup(controls);
  }

  // Преобразует тип "object" в FormGroup
  FormGroup _parseObject(
    Map<String, JsonSchema4>? properties,
    List<String>? requiredList, {
    String path = '',
  }) {
    final controls = <String, AbstractControl<dynamic>>{};

    properties?.forEach((name, value) {
      final String newPath = path.isEmpty ? name : '$path.$name';

      controls[name] = _buildControl(
        {name: value},
        requiredList,
        path: newPath,
      );
    });

    return FormGroup(controls);
  }

  // Преобразует тип "array" в FormArray
  // FormArray<dynamic> _parseArray(
  //   List<JsonSchema4>? items,
  //   List<String>? requiredList, {
  //   String path = '',
  // }) {
  //   if (items == null) {
  //     return FormArray([]);
  //   }

  //   final controls = <AbstractControl<dynamic>>[];

  //   for (final element in items) {
  //     switch (element.type) {
  //       case 'object':
  //         controls
  //             .add(_parseObject(element.properties, requiredList, path: path));
  //       case 'array':
  //         controls.add(_parseArray(element.items, requiredList, path: path));
  //       default:
  //         controls.add(_buildControl({'': element}, requiredList, path: path));
  //         print(element);
  //     }
  //   }

  //   return FormArray(controls);
  // }

  AbstractControl<dynamic> _buildControl(
    Map<String, JsonSchema4> schema,
    List<String>? requiredList, {
    String path = '',
  }) {
    // final controlName = schema.entries.first.key;
    final controlProperties = schema.entries.first.value;

    final type = controlProperties.type;
    final readOnly = controlProperties.constValue != null;

    final value = JFUtils.getValueFromPath(data, path.split('.'));

    switch (type) {
      case 'string':
        if (controlProperties.format == 'date') {
          return JsonSchemeFormControl<DateTime>(
            validators: _parseValidators(schema, requiredList, path),
            value: DateTime.tryParse(value.toString()),
            disabled: readOnly,
          );
        }
        return JsonSchemeFormControl<String>(
          validators: _parseValidators(schema, requiredList, path),
          value: readOnly ? schema['const'].toString() : value as String?,
          disabled: readOnly,
        );
      case 'number':
        return JsonSchemeFormControl<double>(
          validators: _parseValidators(schema, requiredList, path),
          value: double.tryParse(value.toString()),
          disabled: readOnly,
        );
      case 'integer':
        return JsonSchemeFormControl<int>(
          validators: _parseValidators(schema, requiredList, path),
          value: value as int?,
          disabled: readOnly,
        );
      case 'boolean':
        return JsonSchemeFormControl<bool>(
          value: value as bool?,
          disabled: readOnly,
        );
      case 'null':
        return JsonSchemeFormControl<Null>(
          disabled: readOnly,
        );
      default:
        throw Exception('Unsupported JSON Schema type: $type');
    }
  }

  // Добавляем валидаторы, если они присутствуют в схеме
  List<Validator<dynamic>> _parseValidators(
    Map<String, JsonSchema4> schema,
    List<String>? requiredList,
    String path,
  ) {
    final controlName = schema.entries.first.key;
    final Map<String, dynamic>? uiSchemaOptions =
        JFUtils.findElementByScope(uiSchemaDTO, path)?.options;

    final validators = <Validator<dynamic>>[];

    if (requiredList?.contains(controlName) ?? false) {
      validators.add(Validators.required);
    }

    if (uiSchemaOptions != null) {
      final type = uiSchemaOptions['type'] as String;
      final minimum = uiSchemaOptions['minimum'] as num?;
      final maximum = uiSchemaOptions['maximum'] as num?;
      final pattern = uiSchemaOptions['pattern'] as String?;

      if (pattern != null) {
        validators.add(Validators.pattern(pattern));
      }

      if (minimum != null) {
        if (type == 'string') {
          validators.add(Validators.minLength(minimum.toInt()));
        }

        if (type == 'number') {
          validators.add(Validators.min(minimum.toInt()));
        }
      }

      if (maximum != null) {
        if (type == 'string') {
          validators.add(Validators.maxLength(maximum.toInt()));
        }

        if (type == 'number') {
          validators.add(Validators.max(maximum.toInt()));
        }
      }
    }

    return validators;
  }

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
        Text(
          'Unknown render: ${uiSchema.type}',
          style: const TextStyle(color: Colors.red),
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
    return ReactiveForm(
      formGroup: form,
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

  @override
  void dispose() {
    formSubscription?.cancel();
  }
}
