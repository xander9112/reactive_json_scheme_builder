import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_range_picker/reactive_date_range_picker.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_forms_json_scheme/src/_src.dart';

class ReactiveDateRangeControl extends StatelessWidget {
  const ReactiveDateRangeControl({
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
    final form = ReactiveForm.of(context)! as FormGroup;
    // print(form.controls);
    // return const Text('DATE RANMge');
    return ReactiveFormField<DateTimeRange, DateTimeRange>(
      formControlName: formControlName,
      builder: (field) {
        final control = JsonSchemeFormControl.fromFormControl(field.control);

        if (!control.visible) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
          child: ReactiveDateRangePicker(
            formControlName: formControlName,
            // valueAccessor: DateRangeValueAccessor(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
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

class DateRangeValueAccessor
    extends ControlValueAccessor<DateTimeRange, String> {
  DateRangeValueAccessor({DateFormat? format})
      : _format = format ?? DateFormat.yMd();

  final DateFormat _format;

  @override
  String? modelToViewValue(DateTimeRange? modelValue) {
    if (modelValue == null) return null;

    return '${_format.format(modelValue.start)} - ${_format.format(modelValue.end)}';
  }

  @override
  DateTimeRange? viewToModelValue(String? viewValue) {
    if (viewValue == null) {
      return null;
    }

    final values = viewValue.split(' - ');

    if (values.length < 2) {
      return null;
    }

    return DateTimeRange(
      start: _format.parse(values.first),
      end: _format.parse(values.last),
    );
  }

  static DateTimeRange? parse(Map<String, dynamic>? viewValue) {
    if (viewValue == null) {
      return null;
    }

    final start = DateTime.tryParse(viewValue['start']?.toString() ?? '');
    final end = DateTime.tryParse(viewValue['end']?.toString() ?? '');

    if (start == null || end == null) {
      return null;
    }
    return DateTimeRange(
      start: start,
      end: end,
    );
  }
}
