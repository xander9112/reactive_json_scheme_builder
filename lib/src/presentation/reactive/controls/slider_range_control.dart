import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveSliderRangeControl extends StatelessWidget {
  const ReactiveSliderRangeControl({
    required this.formControlName,
    required this.options,
    this.path,
    this.label,
    this.helper,
    this.hint,
    super.key,
    this.inputFormatters,
  });

  final String formControlName;
  final String? label;
  final String? helper;
  final String? hint;
  final List<String>? path;

  final SliderOptions options;

  final List<TextInputFormatter>? inputFormatters;

  Map<String, String Function(Object error)> get validationMessages {
    return options.validation?.map(
          (key, value) => MapEntry(
            key,
            (error) => value
                as String, // Игнорируем error и возвращаем статическое сообщение
          ),
        ) ??
        {};
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<RangeValues, RangeValues>(
      formControlName: formControlName,
      validationMessages: validationMessages,
      valueAccessor: RangeSliderValueAccessor(),
      builder: (field) {
        final control = JsonSchemeFormControl.fromFormControl(field.control);

        if (!control.visible) {
          return const SizedBox();
        }

        final min = options.min.toDouble();
        final max = options.max.toDouble();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RangeSlider(
              values: field.value ?? RangeValues(min, max),
              min: min,
              max: max,
              divisions: max.toInt(),
              labels: RangeLabels(
                '${field.value?.start.toStringAsFixed(0)}',
                '${field.value?.end.toStringAsFixed(0)}',
              ),
              onChanged: field.didChange,
            ),
            if (field.errorText != null)
              Text(
                field.errorText ?? '',
                style: const TextStyle(color: Colors.red),
              ),
          ],
        );
      },
    );
  }
}

class RangeSliderValueAccessor
    extends ControlValueAccessor<RangeValues, RangeValues> {
  @override
  RangeValues? modelToViewValue(RangeValues? modelValue) => modelValue;

  @override
  RangeValues? viewToModelValue(RangeValues? viewValue) => viewValue;

  static RangeValues? parse(Map<String, dynamic>? viewValue) {
    if (viewValue == null) {
      return null;
    }

    final start = double.tryParse(viewValue['start']?.toString() ?? '');
    final end = double.tryParse(viewValue['end']?.toString() ?? '');

    if (start == null || end == null) {
      return null;
    }
    return RangeValues(
      start,
      end,
    );
  }
}
