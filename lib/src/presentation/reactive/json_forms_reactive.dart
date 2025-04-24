import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class JsonFormsReactive implements JsonForms<FormGroup> {
  JsonFormsReactive({
    required Map<String, dynamic> jsonSchema,
    required List<Map<String, RenderType<FormGroup>>>? customRenderList,
    required this.onSubmit,
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

  FormGroup createFormGroup() {
    return _buildFormGroup(
      jsonSchemaDTO.properties!,
      jsonSchemaDTO.required,
    );
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
          // _parseArray(value);
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

  AbstractControl<dynamic> _buildControl(
    Map<String, JsonSchema4> schema,
    List<String>? requiredList, {
    String path = '',
  }) {
    // final controlName = schema.entries.first.key;
    final controlProperties = schema.entries.first.value;

    final type = controlProperties.type;
    final readOnly = controlProperties.constValue != null;

    final value = getValueFromPath(data, path.split('.'));

    switch (type) {
      case 'string':
        if (controlProperties.format == 'date') {
          return FormControl<DateTime>(
            validators: _parseValidators(schema, requiredList),
            disabled: readOnly,
            // value: readOnly ? schema['const'].toString() : value as String?,
          );
        }
        return FormControl<String>(
          validators: _parseValidators(schema, requiredList),
          disabled: readOnly,
          value: readOnly ? schema['const'].toString() : value as String?,
        );
      case 'number':
        return FormControl<double>(
          validators: _parseValidators(schema, requiredList),
          value: double.tryParse(value.toString()),
        );
      case 'integer':
        return FormControl<int>(
          validators: _parseValidators(schema, requiredList),
          value: value as int?,
        );
      case 'boolean':
        return FormControl<bool>(value: value as bool?);
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
}
