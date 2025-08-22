import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveNumberControl extends StatefulWidget {
  const ReactiveNumberControl({
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

  final NumberOptions options;

  @override
  State<ReactiveNumberControl> createState() => _ReactiveNumberControlState();
}

class _ReactiveNumberControlState extends State<ReactiveNumberControl> {
  @override
  Widget build(BuildContext context) {
    return ReactiveFormField(
      formControlName: widget.formControlName,
      builder: (field) {
        final control = JsonSchemeFormControl.fromFormControl(field.control);
        if (!control.visible) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
          child: ReactiveTextField<num>(
            formControlName: widget.formControlName,
            inputFormatters: [
              // DecimalThousandsFormatter(locale: 'ru_RU'),
              // FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
              FilteringTextInputFormatter.allow(
                RegExp(
                  r'^\d*[.,]?\d*$',
                ),
              ), // Чтобы можно было вводить и 12.34 и 12,34
            ],
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            valueAccessor: NumValueAccessor(
                 // locale: 'ru_RU', // или другой локаль
                 ),
            decoration: InputDecoration(
              labelText: widget.label,
              helperText: widget.description,
              border: const OutlineInputBorder(),
            ),
    );
  }
}
