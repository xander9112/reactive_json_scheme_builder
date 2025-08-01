import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class DateControl extends StatefulWidget {
  const DateControl({
    required this.label,
    required this.description,
    required this.jsonData,
    required this.callback,
    this.path,
    super.key,
  });

  final String label;
  final String? description;
  final List<String>? path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;

  @override
  State<DateControl> createState() => _DateControlState();
}

class _DateControlState extends State<DateControl> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: OutlinedButton(
        onPressed: () async {
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2100),
          );

          if (pickedDate != null) {
            JFUtils.setValueAtPath(
              widget.jsonData,
              widget.path,
              pickedDate,
            );
          }
        },
        child: Text(widget.label),
      ),
    );
  }
}
