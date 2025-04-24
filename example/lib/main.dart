import 'dart:async';
import 'dart:convert';

import 'package:example/app_reactive.dart';
import 'package:flutter/material.dart';

import 'schemas/_schemas.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (FlutterErrorDetails details) {
        // Логировать синхронные ошибки во Flutter виджетах
        print('FlutterError: ${details.exception}');
      };

      // runApp(
      //   MyAppDefault(
      //     schema: jsonDecode(jsonSchemaStr) as Map<String, dynamic>,
      //     uiSchema: jsonDecode(uiSchemaStr) as Map<String, dynamic>,
      //   ),
      // );

      runApp(
        MyAppReactive(
          schema: jsonDecode(fullJsonSchemaStr) as Map<String, dynamic>,
          uiSchema: jsonDecode(fullUiSchemaStr) as Map<String, dynamic>,
        ),
      );
    },
    (error, stackTrace) {
      // Здесь логируешь или обрабатываешь необработанные ошибки
      print('Произошла ошибка: $error');
      print('StackTrace: $stackTrace');
      // Например, можно отправить в Sentry или Firebase Crashlytics
    },
  );
}
