import 'dart:async';
import 'dart:convert';

import 'package:example/app_reactive.dart';
import 'package:example/schemas/_schemas.dart';
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
          schema: jsonDecode(exampleJsonSchemaStr) as Map<String, dynamic>,
          // uiSchema: jsonDecode(exampleUiSchemaStr) as Map<String, dynamic>,
          uiSchema:
              jsonDecode(exampleUiSchemaWithTabsStr) as Map<String, dynamic>,
          data: {
            "firstName": "Иван",
            "lastName": "Иванов",
            "email": "ivanov@mail.ru",
            "phone": "+79999999999",
            "birthDate": "1991-07-10 00:00:00.000",
            "gender": "male",
            "city": null,
            "position": null,
            "department": null,
            "about": null,
            "photoUrl": null,
            "title": "Специалист"
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
