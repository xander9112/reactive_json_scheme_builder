import 'dart:async';

import 'package:example/app.dart';
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

      runApp(MaterialApp(home: App()));
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
