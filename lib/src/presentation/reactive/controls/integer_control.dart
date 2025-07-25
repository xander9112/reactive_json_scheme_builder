import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveIntegerControl extends StatefulWidget {
  const ReactiveIntegerControl({
    required this.formControlName,
    this.path,
    this.label,
    super.key,
    this.description,
  });

  final String? label;
  final String formControlName;
  final String? description;
  final List<String>? path;

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
