import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reactive_forms_json_scheme/src/domain/models/control_options/_control_options.dart';

class TextAreaOptions extends ControlOptions {
  TextAreaOptions({
    required super.validation,
    required super.description,
    this.rows,
    this.rowsMax,
  });

  factory TextAreaOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return TextAreaOptions(
      rows: map['rows'] != null ? map['rows'] as int : null,
      rowsMax: map['rowsMax'] != null ? map['rowsMax'] as int : null,
      validation: options.validation,
      description: options.description,
    );
  }

  final int? rows;
  final int? rowsMax;

  @override
  TextAreaOptions copyWith({
    int? rows,
    int? rowsMax,
    Map<String, dynamic>? validation,
    String? description,
  }) {
    return TextAreaOptions(
      rows: rows ?? this.rows,
      rowsMax: rowsMax ?? this.rowsMax,
      validation: validation ?? this.validation,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rows': rows.toString,
      'rowsMax': rowsMax.toString,
      ...super.toMap(),
    };
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'TextAreaOptions(validation: $validation, description rows: $rows, rowsMax: $rowsMax)';

  @override
  bool operator ==(covariant TextAreaOptions other) {
    if (identical(this, other)) return true;

    return other.rows == rows &&
        other.rowsMax == rowsMax &&
        mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      rows.hashCode ^
      rowsMax.hashCode ^
      validation.hashCode ^
      description.hashCode;
}
