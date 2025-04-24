import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveTextMaskControl extends StatefulWidget {
  const ReactiveTextMaskControl({
    required this.formControlName,
    required this.label,
    required this.path,
    required this.callback,
    required this.mask,
    super.key,
    this.description,
    this.minLength,
    this.multi,
  });

  final String formControlName;
  final String label;
  final String? description;
  final String mask;
  final List<String> path;

  final JsonFormsCallback callback;
  final int? minLength;
  final bool? multi;

  @override
  State<ReactiveTextMaskControl> createState() =>
      _ReactiveTextMaskControlState();
}

class _ReactiveTextMaskControlState extends State<ReactiveTextMaskControl> {
  late final MaskTextInputFormatter maskFormatter;

  @override
  void initState() {
    maskFormatter = MaskTextInputFormatter(
      mask: widget.mask.replaceAll('1', '#'), // '+1 (###) ###-##-##',
      filter: {'#': RegExp('[0-9]')},
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ReactiveTextField<String>(
        formControlName: widget.formControlName,
        inputFormatters: [maskFormatter],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.mask,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
