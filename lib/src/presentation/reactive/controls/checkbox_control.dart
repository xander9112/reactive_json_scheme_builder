import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveCheckboxControl extends StatefulWidget {
  const ReactiveCheckboxControl({
    required this.label,
    required this.path,
    required this.jsonData,
    required this.callback,
    required this.formControlName,
    super.key,
  });

  final String formControlName;
  final String label;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;

  @override
  State<ReactiveCheckboxControl> createState() =>
      _ReactiveCheckboxControlState();
}

class _ReactiveCheckboxControlState extends State<ReactiveCheckboxControl> {
  @override
  Widget build(BuildContext context) {
    return ReactiveCheckboxListTile(
      formControlName: widget.formControlName,
      title: Text(widget.label),
    );
  }
}
