import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveDropdownControl extends StatefulWidget {
  const ReactiveDropdownControl({
    required this.formControlName,
    required this.label,
    required this.path,
    required this.jsonData,
    required this.callback,
    super.key,
    this.description,
    this.enumValues = const [],
  });

  final String formControlName;
  final String label;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;
  final List<dynamic> enumValues;

  @override
  State<ReactiveDropdownControl> createState() =>
      _ReactiveDropdownControlState();
}

class _ReactiveDropdownControlState extends State<ReactiveDropdownControl> {
  List<DropdownMenuItem<String>> get items {
    if (widget.enumValues is List<String>) {
      return widget.enumValues.map(
        (e) {
          return DropdownMenuItem<String>(
            value: e.toString(),
            child: Text(e.toString()),
          );
        },
      ).toList();
    }

    return (widget.enumValues as List<Map>)
        .map(
          (e) => DropdownMenuItem<String>(
            value: e.entries.first.key.toString(),
            child: Text(e.entries.first.value.toString()),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ReactiveDropdownField<String>(
        formControlName: widget.formControlName,
        decoration: InputDecoration(
          labelText: widget.label,
          helperText: widget.description,
          border: const OutlineInputBorder(),
        ),
        items: items,
      ),
    );
  }
}
