import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveUriControl extends StatelessWidget {
  const ReactiveUriControl({
    required this.formControlName,
    required this.options,
    this.path,
    this.label,
    super.key,
    this.helper,
  });

  final String formControlName;
  final String? label;
  final String? helper;
  final List<String>? path;

  final TextOptions options;

  @override
  Widget build(BuildContext context) {
    return ReactiveTextControl(
      formControlName: formControlName,
      label: label,
      helper: helper,
      path: path,
      keyboardType: TextInputType.url,
      options: options,
    );
  }
}
