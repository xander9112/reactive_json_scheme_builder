import 'package:flutter/material.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/src/_src.dart';

class ReactiveDateControl extends StatelessWidget {
  const ReactiveDateControl({
    required this.formControlName,
    required this.options,
    this.path,
    this.label,
    super.key,
    this.description,
  });

  final String formControlName;
  final String? label;
  final String? description;
  final List<String>? path;

  final DateOptions options;

  ReactiveDatePickerFieldType get type {
    switch (options.format) {
      case DateOptionsFormat.date:
        return ReactiveDatePickerFieldType.date;
      case DateOptionsFormat.dateTime:
        return ReactiveDatePickerFieldType.dateTime;
      case DateOptionsFormat.time:
        return ReactiveDatePickerFieldType.time;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<DateTime, DateTime>(
      formControlName: formControlName,
      builder: (field) {
        final control = JsonSchemeFormControl.fromFormControl(field.control);

        if (!control.visible) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
          child: ReactiveDateTimePicker(
            formControl: control,
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            type: type,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: label,
              helperText: description,
            ),
          ),
        );
      },
    );
  }
}
