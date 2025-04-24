import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveRadioControl extends StatelessWidget {
  const ReactiveRadioControl({
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: (enumValues as List<Map>).map(
          (e) {
            return ReactiveRadioListTile(
              formControlName: formControlName,
              value: e.entries.first.key,
              title: Text(e.entries.first.value.toString()),
            );
          },
        ).toList(),
      ),
    );
  }
}
