import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.uiSchema,
    required this.schema,
    required this.jsonForms,
    required this.createWidgets,
  });

  final UISchemaElement uiSchema;
  final JsonSchema4 schema;
  final JsonForms jsonForms;
  final List<Widget> Function(
    UISchemaElement uiSchema,
    JsonSchema4 schema,
    BuildContext context,
    List<Widget> widgets,
  ) createWidgets;

  static const int cellsCount = 24;
  static const String type = 'GRID_COMPONENT';

  @override
  Widget build(BuildContext context) {
    final List<UISchemaElement> elements = uiSchema.elements ?? [];
    List<Widget> localWidgets = [];

    final size = (uiSchema.options ?? {})['lg'];

    final bool hasGridInChildren =
        elements.firstWhereOrNull((e) => e.type == type) != null;

    for (var element in elements) {
      List<Widget> current = createWidgets(
        element,
        schema,
        context,
        [],
      ).toList();

      localWidgets.addAll(current);
    }

    if (localWidgets.isEmpty) {
      return SizedBox();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final widgetSize = constraints.maxWidth;
        final cellSize = widgetSize / cellsCount;

        return SizedBox(
          width: cellSize * size,
          child: Wrap(
            children: [
              if (hasGridInChildren) ...localWidgets,
              if (!hasGridInChildren && localWidgets.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: localWidgets,
                ),
            ],
          ),
        );
      },
    );
  }
}
