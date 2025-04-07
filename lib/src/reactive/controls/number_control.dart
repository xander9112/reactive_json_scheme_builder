import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveNumberControl extends StatefulWidget {
  const ReactiveNumberControl({
    required this.label,
    required this.formControlName,
    required this.path,
    required this.jsonData,
    required this.callback,
    super.key,
    this.description,
    this.minLength,
    this.multi,
  });

  final String label;
  final String formControlName;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;
  final int? minLength;
  final bool? multi;

  @override
  State<ReactiveNumberControl> createState() => _ReactiveNumberControlState();
}

class _ReactiveNumberControlState extends State<ReactiveNumberControl> {
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<num>(
      formControlName: widget.formControlName,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
        // FilteringTextInputFormatter.allow(RegExp(r'^\d*[.,]?\d*$')) // Чтобы можно было вводить и 12.34 и 12,34
      ],
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: widget.label,
        helperText: widget.description,
      ),
    );
  }
}
