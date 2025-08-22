import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveCheckboxControl extends StatelessWidget {
  const ReactiveCheckboxControl({
    required this.formControlName,
    this.path,
    this.label,
    this.description,
    super.key,
  });

  final String formControlName;
  final String? label;
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
        return ReactiveCheckboxListTile(
          formControlName: formControlName,
          title: label != null ? Text(label ?? '') : null,
          subtitle: description != null ? Text(description ?? '') : null,
        );
      },
    );
  }
}
