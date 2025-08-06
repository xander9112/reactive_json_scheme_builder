// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reactive_forms_json_scheme/src/domain/models/control_options/_control_options.dart';

class NumberOptions extends ControlOptions {
  NumberOptions({
    required super.name,
    required super.type,
    required super.validation,
    required super.description,
    this.labelPosition,
    this.decimalSeparator,
  });

  final String? labelPosition;
  final String? decimalSeparator;

  @override
  NumberOptions copyWith({
    String? labelPosition,
    String? decimalSeparator,
    String? name,
    String? type,
    Map<String, dynamic>? validation,
    String? description,
  }) {
    return NumberOptions(
      labelPosition: labelPosition ?? this.labelPosition,
      decimalSeparator: decimalSeparator ?? this.decimalSeparator,
      name: name ?? this.name,
      type: type ?? this.type,
      validation: validation ?? this.validation,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'labelPosition': labelPosition,
      'decimalSeparator': decimalSeparator,
      'name': name,
      'type': type,
      'validation': validation,
      'description': description,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  factory NumberOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return NumberOptions(
      labelPosition:
          map['labelPosition'] != null ? map['labelPosition'] as String : null,
      decimalSeparator: map['decimalSeparator'] != null
          ? map['decimalSeparator'] as String
          : null,
      name: options.name,
      type: options.type,
      validation: options.validation,
      description: options.description,
    );
  }

  @override
  String toString() =>
      'NumberOptions(name: $name, type: $type, validation: $validation, description: $description, labelPosition: $labelPosition, decimalSeparator: $decimalSeparator)';

  @override
  bool operator ==(covariant NumberOptions other) {
    if (identical(this, other)) return true;

    return other.labelPosition == labelPosition &&
        other.decimalSeparator == decimalSeparator &&
        other.name == name &&
        other.type == type &&
        mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      labelPosition.hashCode ^
      decimalSeparator.hashCode ^
      name.hashCode ^
      type.hashCode ^
      validation.hashCode ^
      description.hashCode;
}
