import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reactive_forms_json_scheme/src/domain/models/control_options/_control_options.dart';

class NumberOptions extends ControlOptions {
  NumberOptions({
    required super.validation,
    required super.description,
    this.labelPosition,
    this.decimalSeparator,
  });

  factory NumberOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return NumberOptions(
      labelPosition:
          map['labelPosition'] != null ? map['labelPosition'] as String : null,
      decimalSeparator: map['decimalSeparator'] != null
          ? map['decimalSeparator'] as String
          : null,
      validation: options.validation,
      description: options.description,
    );
  }

  final String? labelPosition;
  final String? decimalSeparator;

  @override
  NumberOptions copyWith({
    String? labelPosition,
    String? decimalSeparator,
    Map<String, dynamic>? validation,
    String? description,
  }) {
    return NumberOptions(
      labelPosition: labelPosition ?? this.labelPosition,
      decimalSeparator: decimalSeparator ?? this.decimalSeparator,
      validation: validation ?? this.validation,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'labelPosition': labelPosition,
      'decimalSeparator': decimalSeparator,
      'validation': validation,
      'description': description,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'NumberOptions(validation: $validation, description: $description, labelPosition: $labelPosition, decimalSeparator: $decimalSeparator)';

  @override
  bool operator ==(covariant NumberOptions other) {
    if (identical(this, other)) return true;

    return other.labelPosition == labelPosition &&
        other.decimalSeparator == decimalSeparator &&
        mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      labelPosition.hashCode ^
      decimalSeparator.hashCode ^
      validation.hashCode ^
      description.hashCode;
}
