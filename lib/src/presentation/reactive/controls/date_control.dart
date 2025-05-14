import 'package:flutter/material.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class ReactiveDateControl extends StatelessWidget {
  const ReactiveDateControl({
    required this.formControlName,
    required this.label,
    required this.path,
    required this.jsonData,
    required this.callback,
    super.key,
    this.description,
    this.minLength,
    this.multi,
  });

  final String formControlName;
  final String label;
  final String? description;
  final List<String> path;
  final Map<String, dynamic> jsonData;
  final JsonFormsCallback callback;
  final int? minLength;
  final bool? multi;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ReactiveDateTimePicker(
        formControlName: formControlName,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
          hintText: description,
        ),
      ),
      // builder: (context, picker, child) {
      //   // final format = field!['format'] ?? 'date';

      //   return InkWell(
      //     onTap: () async {
      //       picker.showPicker();
      //       // if (format == 'date') {

      //       //   return;
      //       // }
      //     },
      //     child: InputDecorator(
      //       decoration: const InputDecoration(
      //         labelText: 'Выберите дату',
      //       ),
      //       child: Text(
      //         picker.value?.toLocal().toString().split(' ')[0] ?? '',
      //       ),
      //     ),
      //   );
      // },
    );
  }
}
