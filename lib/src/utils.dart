import 'package:reactive_forms_json_scheme/reactive_forms_json_scheme.dart';

typedef JsonFormsCallback = void Function(Map<String, dynamic> data);

JsonSchema4 getItemFromJsonScheme(List<String> parts, JsonSchema4 schema) {
  final JsonSchema4? item = schema.properties?[parts[1]];

  if (item == null) return JsonSchema4();

  if (item.type == PropertyType.object.name && parts.length > 2) {
    parts.removeRange(0, 2);

    return getItemFromJsonScheme(parts, item);
  }

  return item;
}

dynamic getValueFromPath(Map<String, dynamic> json, List<String> path) {
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

void setValueAtPath(
  Map<String, dynamic> json,
  List<String> path,
  dynamic newValue,
) {
  dynamic value = json;

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
}

String properties = 'properties';

List<String> getParts(String key) {
  final List<String> parts = key.split('/')
    ..removeAt(0)
    ..removeWhere((part) => part == properties);

  return parts;
}

String camelCaseToWords(String s) {
  final result = s.replaceAllMapped(
    RegExp('([A-Z])'),
    (Match m) => ' ${m[1]}',
  );
  return result[0].toUpperCase() + result.substring(1);
}

class RegexPattern {
  static String uri =
      r'^(?!.*[?@!&`()*+,;=_\-~\]\[#$]{2})(?!.*[?@!&`()*+,;=_.\-~:?\[\]]$)(?!.*(\/\.|\.\/))(\w+:(\/\/)?)\S*$';
  static String email = r'^[\w\.-]+@[a-zA-Z\d\.-]+\.[a-zA-Z]{2,}$';
}
