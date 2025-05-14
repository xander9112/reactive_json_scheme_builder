import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class TabComponent extends StatefulWidget {
  const TabComponent({
    super.key,
    required this.uiSchema,
    required this.schema,
    required this.jsonForms,
    required this.createWidgets,
  });

  final JsonSchema4 schema;
  final UISchemaElement uiSchema;
  final JsonForms jsonForms;
  final List<Widget> Function(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
    List<Widget> widgets,
  ) createWidgets;

  static const String type = 'TABS_COMPONENT';

  @override
  State<TabComponent> createState() => _TabComponentState();
}

class _TabComponentState extends State<TabComponent>
    with SingleTickerProviderStateMixin {
  late final List<Map<String, dynamic>> tabs;
  late TabController _tabController;
  int _currentIndex = 0;

  List<UISchemaElement> get elements => widget.uiSchema.elements ?? [];

  @override
  void initState() {
    tabs = (widget.uiSchema.options?['data']?['items'] as List)
        .whereType<Map>()
        .map((e) => Map<String, dynamic>.from(e))
        .toList();

    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildTabContent(UISchemaElement element) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        key: ValueKey(_currentIndex), // Ключ нужен для AnimatedSize
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.createWidgets(
          widget.schema,
          element,
          [],
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.black45,
            // padding: EdgeInsets.zero,
            // labelPadding: EdgeInsets.zero,
            // indicatorPadding: EdgeInsets.zero,
            tabs: tabs.map((t) => Tab(text: t['label'])).toList(),
          ),
          SizedBox(height: 16),
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: _buildTabContent(elements[_currentIndex]),
          ),
        ],
      ),
    );
  }
}
