import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveRadioControl extends StatelessWidget {
  const ReactiveRadioControl({
    required this.formControlName,
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) Text(label ?? ''),
          ...(enumValues as List<Map>).map(
            (e) {
              return ReactiveRadioListTile(
                contentPadding: EdgeInsets.zero,
                formControlName: formControlName,
                value: e.entries.first.key,
                title: Text(e.entries.first.value.toString()),
                secondary: description != null ? Text(description ?? '') : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
