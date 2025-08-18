import 'package:collection/collection.dart';
import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

typedef JsonFormsCallback = void Function(Map<String, dynamic> data);

/// Json Forms
abstract class JFUtils {
  static String properties = 'properties';

  static JsonSchema4 getItemFromJsonScheme(
    List<String> parts,
    JsonSchema4 schema,
  ) {
    final JsonSchema4? item = schema.properties?[parts.last];

    if (item == null) return JsonSchema4();

    if (item.type == PropertyType.object.name && parts.length > 2) {
      parts.removeRange(0, 2);

      return getItemFromJsonScheme(parts, item);
    }

    return item;
  }

  static dynamic getValueFromPath(
    Map<String, dynamic> json,
    List<String>? path,
  ) {
    if (path == null) {
      return null;
    }

    dynamic value = json;

    for (final String key in path) {
      if (value is Map<String, dynamic> && value.containsKey(key)) {
        value = value[key];
      } else {
        return null;
      }
    }

    return value;
  }

  static dynamic setValueAtPath(
    Map<String, dynamic> json,
    List<String>? path,
    dynamic newValue,
  ) {
    if (path == null) {
      return null;
    }

    dynamic value = Map<String, dynamic>.from(json);

    for (int i = 0; i < path.length - 1; i++) {
      final String key = path[i];
      if (value is Map<String, dynamic>) {
        if (!value.containsKey(key)) {
          value[key] = <String, dynamic>{};
        }
        value = value[key];
      } else {
        return;
      }
    }

    (value as Map<String, dynamic>)[path.last] = newValue;

    return value;
  }

  static List<String>? getParts(String? key) {
    final List<String>? parts = key?.split('/');

    if (parts != null) {
      parts
        ..removeAt(0)
        ..removeWhere((part) => part == properties);
    }

    return parts;
  }

  static String camelCaseToWords(String s) {
    final result = s.replaceAllMapped(
      RegExp('([A-Z])'),
      (Match m) => ' ${m[1]}',
    );
    return result[0].toUpperCase() + result.substring(1);
  }

  static String? getLabel(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
  ) {
    final List<String>? parts = getParts(uiSchema.scope);

    if (parts == null) {
      return uiSchema.label;
    }

    final JsonSchema4 item = getItemFromJsonScheme(parts, schema);
    String label = uiSchema.label ?? item.title ?? camelCaseToWords(parts.last);

    if (schema.required != null && schema.required!.contains(parts.last)) {
      label += '*';
    }

    return label;
  }

  static String? getDescription(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
  ) {
    final List<String>? parts = getParts(uiSchema.scope);

    if (parts == null) {
      return uiSchema.options?['description'] as String?;
    }

    final JsonSchema4 item = getItemFromJsonScheme(parts, schema);

    return (uiSchema.options?['description'] as String?) ?? item.description;
  }

  static String getFormControlName(
    JsonSchema4 schema,
    UISchemaElement uiSchema,
  ) {
    final List<String> parts = uiSchema.scope!.split('/')..removeAt(0);

    return parts.whereNot((element) => element == properties).join('.');
  }

  static List<Map<dynamic, dynamic>> getItems(
    UISchemaElement uiSchema, [
    List<Map<String, dynamic>>? sourceData,
  ]) {
    if (sourceData != null) {
      return sourceData;
    }

    return ((uiSchema.options?['data'] as Map?)?['items'] as Map?)
            ?.entries
            .map((e) => {e.key: e.value})
            .toList() ??
        [];
  }

  static UISchemaElement? findElementByScope(
    UISchemaElement root,
    String path,
  ) {
    final expectedScope =
        '#/properties/${path.replaceAll('.', '/properties/')}';

    UISchemaElement? search(UISchemaElement element) {
      if (element.scope == expectedScope) {
        return element;
      }

      if (element.elements != null) {
        for (final child in element.elements!) {
          final result = search(child);
          if (result != null) return result;
        }
      }

      return null;
    }

    return search(root);
  }

  static String? getLastNameFromPath(String path) {
    final items = path.split('/');

    if (items.isNotEmpty) {
      return items.last;
    }

    return null;
  }
}

class RegexPattern {
  static String uri =
      r'^(?!.*[?@!&`()*+,;=_\-~\]\[#$]{2})(?!.*[?@!&`()*+,;=_.\-~:?\[\]]$)(?!.*(\/\.|\.\/))(\w+:(\/\/)?)\S*$';
  static String email = r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$';
}
