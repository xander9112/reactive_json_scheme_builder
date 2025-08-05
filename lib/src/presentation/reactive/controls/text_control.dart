import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveTextControl extends StatelessWidget {
  const ReactiveTextControl({
    required this.formControlName,
    this.path,
    this.label,
    super.key,
    this.description,
    this.inputType = TextInputType.text,
  });

  final String formControlName;
  final String? label;
  final String? description;
  final List<String>? path;

  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<String, String>(
      formControlName: formControlName,
      builder: (field) {
        final control = JsonSchemeFormControl.fromFormControl(field.control);
        if (!control.visible) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
          child: ReactiveTextField<String>(
            formControlName: formControlName,
            keyboardType: inputType,
            decoration: InputDecoration(
              labelText: label,
              helperText: description,
              border: const OutlineInputBorder(),
            ),
          ),
        );
      },
    );
  }
}
