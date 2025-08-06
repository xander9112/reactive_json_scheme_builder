import 'package:example/layouts/_layouts.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class PagesComponent extends StatefulWidget {
  const PagesComponent({
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

  static const String type = 'PAGES';

  @override
  State<PagesComponent> createState() => _PagesComponentState();
}

class _PagesComponentState extends State<PagesComponent>
    with SingleTickerProviderStateMixin {
  late final List<Map<String, dynamic>> pages;
  late TabController _tabController;
  int _currentIndex = 0;

  List<UISchemaElement> get elements => widget.uiSchema.elements ?? [];

  @override
  void initState() {
    pages = (widget.uiSchema.options?['data']?['items'] as List)
        .whereType<Map>()
        .map((e) => Map<String, dynamic>.from(e))
        .toList();

    super.initState();
    _tabController = TabController(length: pages.length, vsync: this);

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
    final String label = pages.elementAt(_currentIndex)['label'] ?? '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        key: ValueKey(_currentIndex), // Ключ нужен для AnimatedSize
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ...widget.createWidgets(
            widget.schema,
            element,
            [],
          ),
          UiPagesBottomBar(
            count: pages.length,
            currentPage: _currentIndex,
            onPressedPrev: onPressedPrev(),
            onPressedNext: onPressedNext(),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: _buildTabContent(elements[_currentIndex]),
    );
  }

  VoidCallback? onPressedPrev() {
    return _currentIndex == 0
        ? null
        : () {
            setState(() {
              _currentIndex -= 1;
            });
          };
  }

  VoidCallback? onPressedNext() {
    return _currentIndex == pages.length - 1
        ? null
        : () {
            setState(() {
              _currentIndex += 1;
            });
          };
  }
}
