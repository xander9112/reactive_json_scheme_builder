import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveTextMaskControl extends StatefulWidget {
  const ReactiveTextMaskControl({
    required this.formControlName,
    required this.mask,
    this.path,
    this.label,
    super.key,
    this.description,
  });

  final String formControlName;
  final String? label;
  final String? description;
  final String mask;
  final List<String>? path;

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
          helperText: widget.mask,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
