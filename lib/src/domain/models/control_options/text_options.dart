import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reactive_forms_json_scheme/src/domain/models/control_options/_control_options.dart';

class TextOptions extends ControlOptions {
  TextOptions({
    required super.validation,
    required super.description,
  });

  factory TextOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return TextOptions(
      validation: options.validation,
      description: options.description,
    );
  }

  @override
  TextOptions copyWith({
    String? name,
    String? type,
    Map<String, dynamic>? validation,
    String? description,
  }) {
    return TextOptions(
      validation: validation ?? this.validation,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'validation': validation,
      'description': description,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  String toString() => 'TextOptions(validation: $validation, description)';

  @override
  bool operator ==(covariant TextOptions other) {
    if (identical(this, other)) return true;

    return mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode => validation.hashCode ^ description.hashCode;
}
