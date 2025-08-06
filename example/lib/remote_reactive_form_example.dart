import 'dart:convert';
import 'dart:io';

import 'package:dio/browser.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:example/force_ui_renders.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class RemoteReactiveFormExample extends StatefulWidget {
  const RemoteReactiveFormExample({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<RemoteReactiveFormExample> createState() =>
      _RemoteReactiveFormExampleState();
}

class _RemoteReactiveFormExampleState extends State<RemoteReactiveFormExample> {
  late final Dio _dio;

  JsonFormsReactive? jsonForms;

  String? error;

  final FormControl _control = FormControl<String>(value: '25');

  @override
  void initState() {
    _dio = createUnsafeDio('https://g-form2.pikachu.do.neoflex.ru');
    _initForm();

    super.initState();
  }

  Future<void> _initForm() async {
    try {
      final response = await _dio.get('/api/forms/${_control.value}/version');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = response.data as Map<String, dynamic>;

        try {
          error = null;
          jsonForms = JsonFormsReactive(
            jsonSchema: data['jsonSchema'] as Map<String, dynamic>,
            uiSchema: data['uiSchema'] as Map<String, dynamic>,
            customRenderList: forceUIRenders,
            onReset: () {
              jsonForms?.form.reset();
            },
            onPressed: (event) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog.adaptive(
                    content: Text('Название события: $event'),
                  );
                },
              );
            },
            onSubmit: (value) {
              jsonForms?.form.markAllAsTouched();

              if (kDebugMode) {
                try {
                  print(
                      '${widget.title}: value: ${jsonEncode(jsonForms?.normalizeFormData(jsonForms!.form.value))}');
                } catch (error) {
                  print('${widget.title}: ERROR: $error');
                }
                if (jsonForms?.form.valid ?? false) {
                  print('${widget.title}: Form is valid');
                } else {
                  print('${widget.title}: Form is invalid');
                  print('${widget.title}: errors: ${jsonForms?.form.errors}');
                }
              }
            },
          );
        } catch (e) {
          error = e.toString();
        }

        setState(() {});
      } else {
        error = response.data.toString();
      }
    } on DioException catch (e) {
      error = (e.response?.data as Map<String, dynamic>?)?['message'];
      setState(() {});
    } catch (e) {
      error = e.toString();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ReactiveTextField(
          formControl: _control,
          decoration: InputDecoration(labelText: 'ID формы'),
          onSubmitted: (control) {
            _initForm();
          },
        ),
        actions: [IconButton(onPressed: _initForm, icon: Icon(Icons.update))],
      ),
      body: Builder(
        builder: (context) {
          if (error != null) {
            return Center(child: Text(error ?? ''));
          }

          if (jsonForms != null) {
            return jsonForms?.getFormWidget(context,
                    padding: EdgeInsets.only(bottom: 16)) ??
                SizedBox();
          }

          return SizedBox();
        },
      ),
    );
  }

  Dio createUnsafeDio(String baseUrl) {
    final dio = Dio(BaseOptions(baseUrl: baseUrl));

    if (kIsWeb) {
      dio.httpClientAdapter = BrowserHttpClientAdapter();
    } else {
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();

          // Отключение валидации сертификатов (НЕ использовать на проде)
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
    }

    return dio;
  }
}
