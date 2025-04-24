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

  final JsonSchema4 schema;
  final UISchemaElement uiSchema;
  final JsonForms jsonForms;
  final List<Widget> Function(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
    List<Widget> widgets,
  ) createWidgets;

  static const int cellsCount = 24;
  static const String type = 'GRID_COMPONENT';

  static const int sm = 576;
  static const int md = 768;
  static const int lg = 992;

  @override
  Widget build(BuildContext context) {
    final List<UISchemaElement> elements = uiSchema.elements ?? [];
    List<Widget> localWidgets = [];

    final bool hasGridInChildren =
        elements.firstWhereOrNull((e) => e.type == type) != null;

    for (var element in elements) {
      List<Widget> current = createWidgets(
        schema,
        element,
        [],
      ).toList();

      localWidgets.addAll(current);
    }

    if (localWidgets.isEmpty) {
      return SizedBox();
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final fullSize = MediaQuery.of(context).size.width;
        final widgetSize = constraints.maxWidth;
        final cellSize = widgetSize / cellsCount;

        final size = (uiSchema.options ?? {})[_getSize(fullSize)];

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

  String _getSize(double size) {
    if (size < sm) {
      return 'xs';
    }

    if (size < md) {
      return 'sm';
    }

    if (size < lg) {
      return 'md';
    }

    return 'lg';
  }
}
