import 'dart:async';
import 'dart:convert';

import 'package:example/app_reactive.dart';
import 'package:example/schemas/_schemas.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      FlutterError.onError = (FlutterErrorDetails details) {
        // Логировать синхронные ошибки во Flutter виджетах
        if (kDebugMode) {
          print('FlutterError: ${details.exception}');
        }
      };

      // runApp(
      //   MyAppDefault(
      //     schema: jsonDecode(jsonSchemaStr) as Map<String, dynamic>,
      //     uiSchema: jsonDecode(uiSchemaStr) as Map<String, dynamic>,
      //   ),
      // );

      runApp(
        MyAppReactive(
          schema: jsonDecode(exampleJsonSchemaStr) as Map<String, dynamic>,
          // schema: jsonDecode(jsonSchemaStr) as Map<String, dynamic>,
          // uiSchema: jsonDecode(loanUiSchemaStr) as Map<String, dynamic>,
        ),
      );
    },
    (error, stackTrace) {
      // Здесь логируешь или обрабатываешь необработанные ошибки
      if (kDebugMode) {
        print('Произошла ошибка: $error');
        print('StackTrace: $stackTrace');
      }
      // Например, можно отправить в Sentry или Firebase Crashlytics
    },
  );
}
