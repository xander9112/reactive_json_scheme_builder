import 'package:example/old/_old.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class JsonSchemaForm extends StatelessWidget {
  const JsonSchemaForm({
    required this.schema,
    required this.formGroup,
    this.uiSchema,
    super.key,
    this.canPop,
    this.onPopInvoked,
    this.customRenderers = const [],
  });

  final FormGroup formGroup;

  final List<Map<String, RenderDef>> customRenderers;
  final Map<String, dynamic> schema;
  final Map<String, dynamic>? uiSchema;

  /// Determine whether a route can popped. See [PopScope] for more details.
  final bool Function(FormGroup formGroup)? canPop;

  /// A callback invoked when a route is popped. See [PopScope] for more details.
  final void Function(
    FormGroup formGroup,
    bool didPop,
  )? onPopInvoked;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: formGroup,
      canPop: canPop,
      onPopInvoked: onPopInvoked,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JsonSchemaGenerator.buildUiSchema(
            schema,
            uiSchema,
            [...renderers, ...customRenderers],
          ),
          ElevatedButton(
            onPressed: () {
              if (formGroup.valid) {
                print('RESULT: ${formGroup.value}');
              }
            },
            child: const Text('submit'),
          ),
        ],
      ),
    );
  }
}
