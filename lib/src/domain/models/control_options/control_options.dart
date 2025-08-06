// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ControlOptions {
  ControlOptions({
    required this.name,
    required this.type,
    required this.validation,
    required this.description,
  });

  final String name;
  final String type;
  final Map<String, dynamic>? validation;
  final String? description;

  ControlOptions copyWith({
    String? name,
    String? type,
    Map<String, dynamic>? validation,
    String? description,
  }) {
    return ControlOptions(
      name: name ?? this.name,
      type: type ?? this.type,
      validation: validation ?? this.validation,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'validation': validation,
      'description': description,
    };
  }

  factory ControlOptions.fromJson(Map<String, dynamic> map) {
    return ControlOptions(
      name: map['name'] as String,
      type: map['type'] as String,
      validation: map['validation'] != null
          ? Map<String, dynamic>.from(map['validation'] as Map<String, dynamic>)
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ControlOptions(name: $name, type: $type, validation: $validation, description: $description)';
  }

  @override
  bool operator ==(covariant ControlOptions other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.type == type &&
        mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        type.hashCode ^
        validation.hashCode ^
        description.hashCode;
  }
}
