import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveSwitchControl extends StatelessWidget {
  const ReactiveSwitchControl({
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
  Widget build(BuildContext context) {
    return ReactiveFormField(
      formControlName: formControlName,
      builder: (field) {
        final control = JsonSchemeFormControl.fromFormControl(field.control);
        if (!control.visible) {
          return const SizedBox();
        }
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ReactiveSwitchListTile(
            formControlName: formControlName,
            title: label != null ? Text(label ?? '') : null,
            subtitle: description != null ? Text(description ?? '') : null,
          ),
        );
      },
    );
  }
}
