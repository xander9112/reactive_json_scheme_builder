import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final HttpClientAdapter client = IOHttpClientAdapter(
  createHttpClient: () {
    final client = HttpClient();

    client.badCertificateCallback = (
      X509Certificate cert,
      String host,
      int port,
    ) {
      return true;
    };

    return client;
  },
);
