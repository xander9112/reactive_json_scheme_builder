import 'dart:async';
import 'dart:convert';

import 'package:example/app_reactive.dart';
import 'package:example/json_schema.dart';
import 'package:example/ui_schema.dart';
import 'package:flutter/material.dart';

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
          schema: jsonDecode(jsonSchemaStr) as Map<String, dynamic>,
          uiSchema: jsonDecode(uiSchemaStr) as Map<String, dynamic>,
          data: {
            "firstName": "Alexander",
            "lastName": "Ivanov",
            "age": 33,
            "gender": "Female",
            "height": 180.0,
            "dateOfBirth": "2019-11-02 17:07:27.166353",
            "rating": 4,
            "committer": false,
            "address": {
              "street": "Московский",
              "number": 22.0,
              "postalCode": 2345,
              "city": "Воронеж"
            }
          },
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
