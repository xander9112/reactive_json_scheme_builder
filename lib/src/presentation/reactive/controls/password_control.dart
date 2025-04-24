import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactivePasswordControl extends StatefulWidget {
  const ReactivePasswordControl({
    required this.formControlName,
    required this.label,
    required this.path,
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

  final JsonFormsCallback callback;
  final int? minLength;
  final bool? multi;

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ReactiveTextField<String>(
        formControlName: widget.formControlName,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.description,
          border: const OutlineInputBorder(),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: _toggleVisibility,
          ),
        ),
      ),
    );
  }
}
