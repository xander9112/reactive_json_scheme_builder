import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return ReactiveFormField(
      formControlName: widget.formControlName,
      builder: (field) {
        final control = JsonSchemeFormControl.fromFormControl(field.control);
        if (!control.visible) {
          return const SizedBox();
        }

        return ReactiveTextField<num>(
          formControlName: widget.formControlName,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: widget.label,
            helperText: widget.description,
          ),
        );
      },
    );
  }
}
