import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveUriControl extends StatelessWidget {
  const ReactiveUriControl({
    required this.formControlName,
    this.path,
    this.label,
    super.key,
    this.description,
  });

  final String formControlName;
  final String? label;
  final String? description;
  final List<String>? path;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextControl(
      formControlName: formControlName,
      label: label,
      description: description,
      path: path,
      inputType: TextInputType.url,
    );
  }
}
