import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class EmailControl extends StatefulWidget {
  const EmailControl({
    required this.label,
    required this.description,
    required this.path,
    required this.jsonData,
    required this.callback,
    super.key,
    this.multi,
  });

  final String label;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;
  final bool? multi;

  @override
  State<EmailControl> createState() => _EmailControlState();
}

class _EmailControlState extends State<EmailControl> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller
      ..text = getValueFromPath(widget.jsonData, widget.path) as String? ?? ''
      ..addListener(() {
        setValueAtPath(
          widget.jsonData,
          widget.path,
          controller.text,
        );

        widget.callback(widget.jsonData);
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: controller,
        maxLines: (widget.multi ?? false) ? 5 : 1,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value == null) {
            return null;
          }

          return RegExp(RegexPattern.email).hasMatch(value) ? null : 'Invalid';
        },
        decoration: InputDecoration(
          labelText: widget.label,
          helperText: widget.description,
        ),
      ),
    );
  }
}
