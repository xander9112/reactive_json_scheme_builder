import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveTextAreaControl extends StatelessWidget {
  const ReactiveTextAreaControl({
    required this.formControlName,
    required this.label,
    required this.path,
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

  final JsonFormsCallback callback;
  final int? minLength;
  final bool? multi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ReactiveTextField<String>(
        formControlName: formControlName,
        maxLines: 5,
        minLines: 2,
        decoration: InputDecoration(
          labelText: label,
          hintText: description,
          border: const OutlineInputBorder(),
          alignLabelWithHint: true,
        ),
      ),
    );
  }
}
