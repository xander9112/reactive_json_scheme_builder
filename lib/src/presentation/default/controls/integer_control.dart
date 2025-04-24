import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class IntegerControl extends StatefulWidget {
  const IntegerControl({
    required this.label,
    required this.description,
    required this.path,
    required this.jsonData,
    required this.callback,
    super.key,
  });

  final String label;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;

  @override
  State<IntegerControl> createState() => _IntegerControlState();
}

class _IntegerControlState extends State<IntegerControl> {
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
          int.tryParse(controller.text),
        );

        widget.callback(widget.jsonData);
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextFormField(
        controller: controller,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: widget.label,
          helperText: widget.description,
        ),
      ),
    );
  }
}
