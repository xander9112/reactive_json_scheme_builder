import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class UiFormWidget extends StatelessWidget {
  const UiFormWidget({super.key, required this.jsonForm});

  final JsonForms jsonForm;

  @override
  Widget build(BuildContext context) {
    return jsonForm.getFormWidget(context, padding: EdgeInsets.all(16));
  }
}
