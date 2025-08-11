import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class UiTable extends StatelessWidget {
  const UiTable({
    super.key,
    required this.uiSchema,
    required this.schema,
    required this.jsonForms,
    required this.createWidgets,
    required this.options,
  });

  final JsonSchema4 schema;
  final UISchemaElement uiSchema;
  final JsonForms jsonForms;
  final List<Widget> Function(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
    List<Widget> widgets,
  ) createWidgets;

  final TableOptions options;

  static const String type = 'TABLE_COMPONENT';

  @override
  Widget build(BuildContext context) {
    final items = options.data.items;

    final source = options.data.source;
    final data = jsonForms.sources[source] as List<Map<String, dynamic>>;

    return Table(
      border: TableBorder.all(color: Colors.grey), // рамки
      // columnWidths: const {
      //   0: FixedColumnWidth(120), // фиксированная ширина первой колонки
      //   1: FlexColumnWidth(), // гибкая ширина второй колонки
      //   2: FixedColumnWidth(80), // фиксированная ширина третьей колонки
      // },
      children: [
        TableRow(
            decoration: BoxDecoration(color: Colors.blueGrey),
            children: items.entries.map(
              (e) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    e.value.title,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: e.value.align.textAlign,
                  ),
                );
              },
            ).toList()),
        ...data.map(
          (e) {
            return TableRow(
                children: items.entries.map(
              (entry) {
                return Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    e[entry.key],
                    textAlign: entry.value.align.textAlign,
                  ),
                );
              },
            ).toList());
          },
        )
      ],
    );
  }
}
