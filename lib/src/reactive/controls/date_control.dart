import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveDateControl extends StatefulWidget {
  const ReactiveDateControl({
    required this.formControlName,
    required this.label,
    required this.path,
    required this.jsonData,
    required this.callback,
    super.key,
    this.description,
    this.minLength,
    this.multi,
  });

  final String formControlName;
  final String label;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;
  final int? minLength;
  final bool? multi;

  @override
  State<ReactiveDateControl> createState() => _ReactiveDateControlState();
}

class _ReactiveDateControlState extends State<ReactiveDateControl> {
  @override
  Widget build(BuildContext context) {
    return ReactiveDatePicker(
      formControlName: widget.formControlName,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, picker, child) {
        // final format = field!['format'] ?? 'date';

        return InkWell(
          onTap: () async {
            picker.showPicker();
            // if (format == 'date') {

            //   return;
            // }
          },
          child: InputDecorator(
            decoration: const InputDecoration(
              labelText: 'Выберите дату',
            ),
            child: Text(
              picker.value?.toLocal().toString().split(' ')[0] ?? '',
            ),
          ),
        );
      },
    );
  }
}
