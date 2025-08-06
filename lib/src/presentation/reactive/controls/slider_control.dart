import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveSliderControl extends StatelessWidget {
  const ReactiveSliderControl({
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
    return ReactiveFormField<num, num>(
      formControlName: formControlName,
      validationMessages: validationMessages,
      builder: (field) {
        final control = JsonSchemeFormControl.fromFormControl(field.control);

        if (!control.visible) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label != null) Text(label ?? ''),
              ReactiveSlider(
                formControlName: formControlName,
                max: options.max.toDouble(),
                labelBuilder: (value) => '$value',
                min: options.min.toDouble(),
                divisions: options.max,
              ),
            ],
          ),
        );
      },
    );
  }
}
