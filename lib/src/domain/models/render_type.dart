import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

typedef RenderType<T> = Widget Function(
  JsonSchema4,
  UISchemaElement,
  JsonForms<T>,
);
