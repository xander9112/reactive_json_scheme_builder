import 'dart:convert';

import 'package:flutter/material.dart';

import 'reactive_form_example.dart';
import 'remote_reactive_form_example.dart';
import 'schemas/_schemas.dart';

class App extends StatelessWidget {
  const App({super.key});

  List<Map<String, dynamic>> get _items => [
        {
          'title': 'Loan',
          'page': ReactiveFormExample(
            title: 'Loan',
            schema: jsonDecode(loanJsonSchemaStr),
            uiSchema: jsonDecode(loanUiSchemaStr),
          ),
        },
        // {
        //   'title': 'Full json schema',
        //   'page': ReactiveFormExample(
        //       title: 'Full json schema',
        //       schema: jsonDecode(fullJsonSchemaStr),
        //       uiSchema: jsonDecode(fullUiSchemaStr),
        //       data: {
        //         "text_validation_input": "dsdaa@mail.ru",
        //         "select_input": "element_2",
        //         "radio_control": "other",
        //         "letter_mask": "a 111 dd",
        //         "slider": 5821.299999999999,
        //         "slider_range": {"start": 6626.8, "end": 7302.7},
        //         "date_range_control": {
        //           "start": "2025-08-18T00:00:00.000",
        //           "end": "2025-09-19T00:00:00.000"
        //         }
        //       }),
        // },
        // {
        //   'title': 'Short json schema',
        //   'page': ReactiveFormExample(
        //     title: 'Short json schema',
        //     schema: jsonDecode(shortJsonSchemaStr),
        //     uiSchema: jsonDecode(shortUiSchemaStr),
        //   ),
        // },
        {
          'title': 'Remote form',
          'page': RemoteReactiveFormExample(
            title: 'Pages',
          ),
        },
        {
          'title': 'Pages',
          'page': ReactiveFormExample(
            title: 'Pages',
            schema: jsonDecode(pagesJsonSchemaStr),
            uiSchema: jsonDecode(pagesUiSchemaStr),
          ),
        },
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Examples'),
      ),
      body: ListView(
          children: _items.map(
        (e) {
          return ListTile(
            title: Text(e['title']),
            tileColor: Colors.grey[200],
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => e['page'],
              ));
            },
          );
        },
      ).toList()),
    );
  }
}
