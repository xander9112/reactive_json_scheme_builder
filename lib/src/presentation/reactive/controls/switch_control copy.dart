import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveSwitchControl extends StatelessWidget {
  const ReactiveSwitchControl({
    required this.label,
    required this.path,
    required this.jsonData,
    required this.formControlName,
    super.key,
    this.description,
    this.minLength,
    this.multi,
  });

  final String label;
  final String formControlName;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final int? minLength;
  final bool? multi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ReactiveSwitchListTile(
        formControlName: formControlName,
        title: Text(label),
      ),
    );
  }
}
