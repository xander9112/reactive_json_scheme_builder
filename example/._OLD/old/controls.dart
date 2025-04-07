import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class CommonControl extends StatelessWidget {
  const CommonControl({
    required this.schema,
    required this.uiSchema,
    required this.renderers,
    super.key,
  });

  final Map<String, dynamic> schema;
  final Map<String, dynamic> uiSchema;
  final List<Map<String, dynamic>> renderers;

  List<String> get scopes =>
      uiSchema['scope'].toString().split('/')..removeAt(0);

  Map<String, dynamic>? get field =>
      findByJsonPointer(uiSchema['scope'].toString());

  Map<String, dynamic>? findByJsonPointer(String pointer) {
    dynamic current = schema;

    for (final part in scopes) {
      if (current is Map<String, dynamic> && current.containsKey(part)) {
        current = current[part];
      } else {
        return null; // Не найдено
      }
    }

    return current is Map<String, dynamic> ? current : null;
  }

  @override
  Widget build(BuildContext context) {
    return Text('Unknown Field: ${uiSchema['scope']}');
  }
}

class StringControl extends CommonControl {
  const StringControl({
    required super.schema,
    required super.uiSchema,
    super.key,
    super.renderers = const [],
  });

  @override
  Widget build(BuildContext context) {
    if (field == null) {
      return super.build(context);
    }

    return ReactiveTextField<String>(
      formControlName: scopes[1],
      decoration: InputDecoration(
        labelText: field!['title'] as String?,
        helperText: field!['description'] as String?,
      ),
    );
  }
}

class NumberControl extends CommonControl {
  const NumberControl({
    required super.schema,
    required super.uiSchema,
    super.key,
    super.renderers = const [],
  });

  @override
  Widget build(BuildContext context) {
    if (field == null) {
      return super.build(context);
    }

    return ReactiveTextField<num>(
      formControlName: scopes[1],
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
        // FilteringTextInputFormatter.allow(RegExp(r'^\d*[.,]?\d*$')) // Чтобы можно было вводить и 12.34 и 12,34
      ],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: field!['title'] as String?,
        helperText: field!['description'] as String?,
      ),
    );
  }
}

class IntControl extends CommonControl {
  const IntControl({
    required super.schema,
    required super.uiSchema,
    super.key,
    super.renderers = const [],
  });
  @override
  Widget build(BuildContext context) {
    final scopes = uiSchema['scope'].toString().split('/')..removeAt(0);

    return ReactiveTextField<int>(
      formControlName: scopes[1],
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: field!['title'] as String?,
        helperText: field!['description'] as String?,
      ),
    );
  }
}

class BoolControl extends CommonControl {
  const BoolControl({
    required super.schema,
    required super.uiSchema,
    super.key,
    super.renderers = const [],
  });

  @override
  Widget build(BuildContext context) {
    final scopes = uiSchema['scope'].toString().split('/')..removeAt(0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (field!['title'] != null) Text(field!['title'] as String? ?? ''),
            ReactiveSwitch(
              formControlName: scopes[1],
            ),
          ],
        ),
        if (field!['description'] != null)
          Text(
            field!['description'] as String? ?? '',
            style: const TextStyle(fontSize: 12),
          ),
      ],
    );
  }
}
