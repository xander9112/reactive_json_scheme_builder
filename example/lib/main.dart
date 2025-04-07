import 'dart:convert';

import 'package:example/app_default.dart';
import 'package:example/json_schema.dart';
import 'package:example/ui_schema.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MyAppDefault(
      schema: jsonDecode(jsonSchemaStr) as Map<String, dynamic>,
      uiSchema: jsonDecode(uiSchemaStr) as Map<String, dynamic>,
    ),
  );
  // runApp(
  //   MyAppReactive(
  //     schema: jsonDecode(jsonSchemaStr) as Map<String, dynamic>,
  //     uiSchema: jsonDecode(uiSchemaStr) as Map<String, dynamic>,
  //   ),
  // );
}
