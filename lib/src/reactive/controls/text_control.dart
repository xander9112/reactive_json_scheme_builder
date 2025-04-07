import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveTextControl extends StatefulWidget {
  const ReactiveTextControl({
    required this.formControlName,
    required this.label,
    required this.path,
    required this.jsonData,
    required this.callback,
    super.key,
    this.description,
    this.minLength,
    this.multi,
  });

  final String formControlName;
  final String label;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;
  final int? minLength;
  final bool? multi;

  @override
  State<ReactiveTextControl> createState() => _ReactiveTextControlState();
}

class _ReactiveTextControlState extends State<ReactiveTextControl> {
  @override
  Widget build(BuildContext context) {
    return ReactiveTextField<String>(
      formControlName: widget.formControlName,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.description,
      ),
    );
  }
}
