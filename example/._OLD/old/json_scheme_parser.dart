import 'package:reactive_forms/reactive_forms.dart';

class JsonSchemaParser {
  // Метод для преобразования JSON Schema в FormGroup с вложенными полями
  static FormGroup parse(Map<String, dynamic> schema) {
    return _buildFormGroup(
      schema['properties'] as Map<String, dynamic>,
      List.castFrom<dynamic, String>(schema['required'] as List),
    );
  }

  static FormGroup _buildFormGroup(
    Map<String, dynamic> properties,
    List<String>? requiredList,
  ) {
    final controls = <String, AbstractControl<dynamic>>{};

    properties.forEach((name, value) {
      final type = value['type'];

      switch (type) {
        case 'object':
          controls[name] = _parseObject(
            (value as Map<String, dynamic>)['properties']
                as Map<String, dynamic>,
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

  static AbstractControl<dynamic> _buildControl(
    Map<String, dynamic> schema,
    List<String>? requiredList,
  ) {
    final controlName = schema.entries.first.key;
    final controlProperties =
        schema.entries.first.value as Map<String, dynamic>;

    final type = controlProperties['type'];
    final readOnly = controlProperties.containsKey('const');

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

  // Преобразует тип "object" в FormGroup
  static FormGroup _parseObject(
    Map<String, dynamic> schema,
    List<String>? requiredList,
  ) {
    final controls = <String, AbstractControl<dynamic>>{};

    schema.forEach((name, value) {
      controls[name] = _buildControl(
        {name: value},
        requiredList,
      ); // рекурсивный вызов для вложенных объектов
    });

    return FormGroup(controls);
  }

  // Преобразует тип "array" в FormArray
  static FormArray _parseArray(Map<String, dynamic> schema) {
    // final items = schema['items'] ?? [];
    // final controls = <AbstractControl<dynamic>>[];

    // Преобразуем каждый элемент массива в соответствующий контроль
    // for (var item in items) {
    //   controls
    //       .add(parse(item)); // рекурсивный вызов для каждого элемента массива
    // }

    // return FormArray<dynamic>(controls);
    return FormArray<dynamic>([]);
  }

  // Преобразует базовые типы в FormControl
  static FormControl<dynamic> _parseBasicType(
    Map<String, dynamic> schema,
    List<String>? requiredList,
  ) {
    return FormControl<dynamic>(
      value: schema['default'],
      validators: _parseValidators(schema, requiredList),
    );
  }

  // Добавляем валидаторы, если они присутствуют в схеме
  static List<Validator<dynamic>> _parseValidators(
    Map<String, dynamic> schema,
    List<String>? requiredList,
  ) {
    final controlName = schema.entries.first.key;
    final controlProperties =
        schema.entries.first.value as Map<String, dynamic>;

    final validators = <Validator<dynamic>>[];

    if (requiredList?.contains(controlName) ?? false) {
      validators.add(Validators.required);
    }
    if (schema['minLength'] != null) {
      validators
          .add(Validators.minLength(controlProperties['minLength'] as int));
    }

    if (schema['maxLength'] != null) {
      validators
          .add(Validators.maxLength(controlProperties['maxLength'] as int));
    }

    if (schema['pattern'] != null) {
      validators
          .add(Validators.pattern(controlProperties['pattern'].toString()));
    }

    return validators;
  }
}
