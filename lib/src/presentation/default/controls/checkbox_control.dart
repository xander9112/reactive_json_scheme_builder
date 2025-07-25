import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class CheckboxControl extends StatefulWidget {
  const CheckboxControl({
    required this.label,
    required this.jsonData,
    required this.callback,
    this.path,
    super.key,
  });

  final String label;
  final List<String>? path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;

  @override
  State<CheckboxControl> createState() => _CheckboxState();
}

class _CheckboxState extends State<CheckboxControl> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final bool value =
        JFUtils.getValueFromPath(widget.jsonData, widget.path) as bool? ??
            false;

    return CheckboxListTile(
      value: value,
      onChanged: (bool? value) {
        setState(() {
          JFUtils.setValueAtPath(widget.jsonData, widget.path, value);
        });
        widget.callback(widget.jsonData);
      },
      title: Text(widget.label),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }
}
