import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveDropdownControl extends StatefulWidget {
  const ReactiveDropdownControl({
    required this.formControlName,
    required this.options,
    this.path,
    this.label,
    super.key,
    this.description,
    this.enumValues = const [],
  });

  final String formControlName;
  final String? label;
  final String? description;
  final List<String>? path;

  final List<dynamic> enumValues;

  final DropDownOptions options;

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
      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
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
