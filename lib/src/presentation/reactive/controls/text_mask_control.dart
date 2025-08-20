import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveTextMaskControl extends StatefulWidget {
  const ReactiveTextMaskControl({
    required this.formControlName,
    required this.mask,
    required this.options,
    this.path,
    this.label,
    super.key,
    this.helper,
    this.hint,
  });

  final String formControlName;
  final String? label;
  final String? helper;
  final String? hint;
  final String mask;
  final List<String>? path;

  final TextOptions options;

  @override
  State<ReactiveTextMaskControl> createState() =>
      _ReactiveTextMaskControlState();
}

class _ReactiveTextMaskControlState extends State<ReactiveTextMaskControl> {
  late final MaskTextInputFormatter maskFormatter;

  @override
  void initState() {
    maskFormatter = MaskTextInputFormatter(
      mask: widget.mask,
      filter: {
        'a': RegExp('[A-Za-z]'),
        '9': RegExp(r'\d'),
        '*': RegExp('[A-Za-z0-9]'),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField(
      formControlName: widget.formControlName,
      builder: (field) {
        final control = JsonSchemeFormControl.fromFormControl(field.control);
        if (!control.visible) {
          return const SizedBox();
        }

        return ReactiveTextControl(
          formControlName: widget.formControlName,
          inputFormatters: [maskFormatter],
          keyboardType: TextInputType.number,
          label: widget.label,
          options: widget.options,
          hint: widget.hint ?? widget.mask,
          helper: widget.helper,
        );
      },
    );
  }
}
