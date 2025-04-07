import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

typedef RenderType = Widget Function(
  BuildContext,
  UISchemaElement,
  JsonSchema4,
  JsonForms,
);
