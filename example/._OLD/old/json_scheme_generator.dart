import 'package:collection/collection.dart';
import 'package:example/old/_old.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class JsonSchemaGenerator {
  static Widget buildUiSchema(
    Map<String, dynamic> schema,
    Map<String, dynamic>? uiSchema, [
    List<Map<String, RenderDef>> renderers = const [],
  ]) {
    if (uiSchema == null) {
      return buildSchema(schema, uiSchema, renderers);
    }

    final render = renderers
        .firstWhereOrNull(
          (element) {
            return element.entries.first.key == uiSchema['type'];
          },
        )
        ?.entries
        .first
        .value;

    if (render == null) {
      print('Unknown render: ${uiSchema['type']}');
    }

    return render?.call(schema, uiSchema, true, renderers) ?? const SizedBox();
  }

// case 'object':
// case 'array':

  static Widget buildSchema(
    Map<String, dynamic> schema,
    Map<String, dynamic>? uiSchema, [
    List<Map<String, RenderDef>> renderers = const [],
  ]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: (schema['properties'] as Map<String, dynamic>).entries.map(
        (e) {
          return buildProperty(
            e.key,
            e.value as Map<String, dynamic>,
            uiSchema,
            renderers,
          );
        },
      ).toList(),
    );
  }

  static Widget buildProperty(
    String fieldName,
    Map<String, dynamic> schema,
    Map<String, dynamic>? uiSchema, [
    List<Map<String, RenderDef>> renderers = const [],
  ]) {
    final type = schema['type'].toString();

    // final render = renderers
    //     .firstWhereOrNull((element) => element.entries.first.key == type)
    //     ?.entries
    //     .first
    //     .value;

    // if (render == null) {

    // }

    // return render?.call(schema, uiSchema, renderers) ?? const SizedBox();

    switch (type) {
      case 'object':
        final title =
            schema['title'] as String? ?? schema['description'] as String?;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) Text(title),
            ...(schema['properties'] as Map<String, dynamic>).entries.map(
              (e) {
                return buildProperty(
                  '$fieldName.${e.key}',
                  e.value as Map<String, dynamic>,
                  uiSchema,
                );
              },
            ),
          ],
        );

      case 'array':
        return const Text('Array');
      case 'string':
        return buildTextField({fieldName: schema});
      case 'number':
        return buildNumberField({fieldName: schema});
      case 'integer':
        return buildIntField({fieldName: schema});
      case 'boolean':
        return buildBoolField({fieldName: schema});
      case 'null':
        return buildNullField({fieldName: schema});

      default:
        throw ArgumentError('Неизвестный тип: $type');
    }
  }

  static Widget buildTextField(
    Map<String, dynamic> schema, [
    Map<String, dynamic>? uiSchema,
  ]) {
    late String formControlName;
    late Map<String, dynamic>? field;

    if (uiSchema == null) {
      formControlName = schema.entries.first.key;
      field = schema.entries.first.value as Map<String, dynamic>;
    } else {
      formControlName = scopes(uiSchema).last;
      field = findByJsonPointer(schema, uiSchema, uiSchema['scope'].toString());
    }

    if (field == null) {
      return Text('Unknown field: ${uiSchema!['scope']}');
    }

    final bool readOnly = field.containsKey('const') ?? false;
    final bool isEnum = field.containsKey('enum') ?? false;
    final bool isDate = (field.containsKey('format') ?? false) &&
        ['date', 'date-time'].contains(field['format'].toString());

    if (isEnum) {
      return ReactiveDropdownField<String>(
        formControlName: formControlName,
        decoration: InputDecoration(
          labelText: field['title'] as String?,
          helperText: field['description'] as String?,
        ),
        items: (field['enum'] as List)
            .map(
              (e) => DropdownMenuItem<String>(
                value: e.toString(),
                child: Text(e.toString()),
              ),
            )
            .toList(),
      );
    }

    if (isDate) {
      return ReactiveDatePicker(
        formControlName: formControlName,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        builder: (context, picker, child) {
          // final format = field!['format'] ?? 'date';

          return InkWell(
            onTap: () async {
              picker.showPicker();
              // if (format == 'date') {

              //   return;
              // }
            },
            child: InputDecorator(
              decoration: const InputDecoration(
                labelText: 'Выберите дату',
              ),
              child: Text(
                picker.value?.toLocal().toString().split(' ')[0] ?? '',
              ),
            ),
          );
        },
      );
    }

    return ReactiveTextField<String>(
      formControlName: formControlName,
      readOnly: readOnly,
      decoration: InputDecoration(
        labelText: field['title'] as String?,
        helperText: field['description'] as String?,
      ),
    );
  }

  static Widget buildNumberField(
    Map<String, dynamic> schema, [
    Map<String, dynamic>? uiSchema,
  ]) {
    late String formControlName;
    late Map<String, dynamic>? field;

    if (uiSchema == null) {
      formControlName = schema.entries.first.key;

      field = schema.entries.first.value as Map<String, dynamic>;
    } else {
      formControlName = scopes(uiSchema).last;
      field = findByJsonPointer(schema, uiSchema, uiSchema['scope'].toString());
    }

    return ReactiveTextField<num>(
      formControlName: formControlName,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
        // FilteringTextInputFormatter.allow(RegExp(r'^\d*[.,]?\d*$')) // Чтобы можно было вводить и 12.34 и 12,34
      ],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: field!['title'] as String?,
        helperText: field['description'] as String?,
      ),
    );
  }

  static Widget buildIntField(
    Map<String, dynamic> schema, [
    Map<String, dynamic>? uiSchema,
  ]) {
    late String formControlName;
    late Map<String, dynamic>? field;

    if (uiSchema == null) {
      formControlName = schema.entries.first.key;
      field = schema.entries.first.value as Map<String, dynamic>;
    } else {
      formControlName = scopes(uiSchema).last;
      field = findByJsonPointer(schema, uiSchema, uiSchema['scope'].toString());
    }

    return ReactiveTextField<int>(
      formControlName: formControlName,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: field!['title'] as String?,
        helperText: field['description'] as String?,
      ),
    );
  }

  static Widget buildBoolField(
    Map<String, dynamic> schema, [
    Map<String, dynamic>? uiSchema,
  ]) {
    late String formControlName;
    late Map<String, dynamic>? field;

    if (uiSchema == null) {
      formControlName = schema.entries.first.key;
      field = schema.entries.first.value as Map<String, dynamic>;
    } else {
      formControlName = scopes(uiSchema).last;
      field = findByJsonPointer(schema, uiSchema, uiSchema['scope'].toString());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (field!['title'] != null) Text(field['title'] as String? ?? ''),
            ReactiveSwitch(formControlName: formControlName),
          ],
        ),
        if (field['description'] != null)
          Text(
            field['description'] as String? ?? '',
            style: const TextStyle(fontSize: 12),
          ),
      ],
    );
  }

  static Widget buildNullField(
    Map<String, dynamic>? schema, [
    Map<String, dynamic>? uiSchema,
  ]) {
    return const SizedBox();
  }

  static List<String> scopes(Map<String, dynamic> uiSchema) =>
      uiSchema['scope'].toString().split('/')..removeAt(0);

  static Map<String, dynamic>? findByJsonPointer(
    Map<String, dynamic> schema,
    Map<String, dynamic> uiSchema,
    String pointer,
  ) {
    final localScopes = scopes(uiSchema);
    dynamic current = schema;

    for (final part in localScopes) {
      if (current is Map<String, dynamic> && current.containsKey(part)) {
        current = current[part];
      } else {
        return null; // Не найдено
      }
    }

    return current is Map<String, dynamic> ? current : null;
  }
}
