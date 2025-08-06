// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reactive_forms_json_scheme/src/domain/models/control_options/_control_options.dart';

class TextOptions extends ControlOptions {
  TextOptions({
    required super.name,
    required super.type,
    required super.validation,
    required super.description,
  });

  @override
  TextOptions copyWith({
    String? name,
    String? type,
    Map<String, dynamic>? validation,
    String? description,
  }) {
    return TextOptions(
      name: name ?? this.name,
      type: type ?? this.type,
      validation: validation ?? this.validation,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'validation': validation,
      'description': description,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  factory TextOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return TextOptions(
      name: options.name,
      type: options.type,
      validation: options.validation,
      description: options.description,
    );
  }

  @override
  String toString() =>
      'TextOptions(name: $name, type: $type, validation: $validation, description)';

  @override
  bool operator ==(covariant TextOptions other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.type == type &&
        mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      type.hashCode ^
      validation.hashCode ^
      description.hashCode;
}
