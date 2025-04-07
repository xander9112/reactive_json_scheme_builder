import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class UriControl extends StatefulWidget {
  const UriControl({
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
  State<UriControl> createState() => _UriControlState();
}

class _UriControlState extends State<UriControl> {
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
        validator: (value) {
          if (value == null) {
            return null;
          }

          return RegExp(RegexPattern.uri).hasMatch(value) ? null : 'Invalid';
        },
        decoration: InputDecoration(
          labelText: widget.label,
          helperText: widget.description,
        ),
      ),
    );
  }
}
