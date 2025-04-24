import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveIntegerControl extends StatefulWidget {
  const ReactiveIntegerControl({
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
  State<ReactiveIntegerControl> createState() => _ReactiveIntegerControlState();
}

class _ReactiveIntegerControlState extends State<ReactiveIntegerControl> {
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<num>(
      formControlName: widget.formControlName,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: widget.label,
        helperText: widget.description,
      ),
    );
  }
}
