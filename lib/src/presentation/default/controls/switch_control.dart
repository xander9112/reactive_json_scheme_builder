import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class SwitchControl extends StatefulWidget {
  const SwitchControl({
    required this.label,
    required this.path,
    required this.jsonData,
    required this.callback,
    super.key,
  });

  final String label;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;

  @override
  State<SwitchControl> createState() => _SwitchState();
}

class _SwitchState extends State<SwitchControl> {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    final bool value =
        JFUtils.getValueFromPath(widget.jsonData, widget.path) as bool? ??
            false;

    return SwitchListTile(
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
