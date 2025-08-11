import 'dart:convert';

import 'package:flutter/foundation.dart';

class ControlOptions {
  ControlOptions({
    required this.validation,
    required this.description,
  });

  factory ControlOptions.fromJson(Map<String, dynamic> map) {
    return ControlOptions(
      validation: map['validation'] != null
          ? Map<String, dynamic>.from(map['validation'] as Map<String, dynamic>)
          : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  final Map<String, dynamic>? validation;
  final String? description;

  ControlOptions copyWith({
    Map<String, dynamic>? validation,
    String? description,
  }) {
    return ControlOptions(
      validation: validation ?? this.validation,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'validation': validation,
      'description': description,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ControlOptions(validation: $validation, description: $description)';
  }

  @override
  bool operator ==(covariant ControlOptions other) {
    if (identical(this, other)) return true;

    return mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode {
    return validation.hashCode ^ description.hashCode;
  }
}
