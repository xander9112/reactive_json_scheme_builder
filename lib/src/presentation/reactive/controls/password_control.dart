import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactivePasswordControl extends StatefulWidget {
  const ReactivePasswordControl({
    required this.formControlName,
    this.path,
    this.label,
    super.key,
    this.description,
  });

  final String formControlName;
  final String? label;
  final String? description;
  final List<String>? path;

  @override
  State<ReactivePasswordControl> createState() =>
      _ReactivePasswordControlState();
}

class _ReactivePasswordControlState extends State<ReactivePasswordControl> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveFormField<String, String>(
      formControlName: widget.formControlName,
      builder: (field) {
        final control = JsonSchemeFormControl.fromFormControl(field.control);
        if (!control.visible) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 16.0),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: ReactiveTextField<String>(
              formControlName: widget.formControlName,
              obscureText: _obscureText,
              decoration: InputDecoration(
                labelText: widget.label,
                helperText: widget.description,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _toggleVisibility,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
