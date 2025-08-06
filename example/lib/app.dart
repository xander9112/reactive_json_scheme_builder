import 'dart:convert';

import 'package:flutter/material.dart';

import 'reactive_form_example.dart';
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
        {
          'title': 'Full json schema',
          'page': ReactiveFormExample(
            title: 'Full json schema',
            schema: jsonDecode(fullJsonSchemaStr),
            uiSchema: jsonDecode(fullUiSchemaStr),
          ),
        },
        {
          'title': 'Short json schema',
          'page': ReactiveFormExample(
            title: 'Short json schema',
            schema: jsonDecode(shortJsonSchemaStr),
            uiSchema: jsonDecode(shortUiSchemaStr),
          ),
        },
        {
          'title': 'Pages',
          'page': ReactiveFormExample(
            title: 'Pages',
            schema: jsonDecode(pagesJsonSchemaStr),
            uiSchema: jsonDecode(pagesUiSchemaStr),
          ),
        }
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
