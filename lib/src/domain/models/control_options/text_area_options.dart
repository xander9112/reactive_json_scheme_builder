// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reactive_forms_json_scheme/src/domain/models/control_options/_control_options.dart';

class TextAreaOptions extends ControlOptions {
  TextAreaOptions({
    required super.name,
    required super.type,
    required super.validation,
    required super.description,
    this.rows,
    this.rowsMax,
  });

  final int? rows;
  final int? rowsMax;

  @override
  TextAreaOptions copyWith({
    int? rows,
    int? rowsMax,
    String? name,
    String? type,
    Map<String, dynamic>? validation,
    String? description,
  }) {
    return TextAreaOptions(
      rows: rows ?? this.rows,
      rowsMax: rowsMax ?? this.rowsMax,
      name: name ?? this.name,
      type: type ?? this.type,
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

  factory TextAreaOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return TextAreaOptions(
      rows: map['rows'] != null ? map['rows'] as int : null,
      rowsMax: map['rowsMax'] != null ? map['rowsMax'] as int : null,
      name: options.name,
      type: options.type,
      validation: options.validation,
      description: options.description,
    );
  }

  @override
  String toString() =>
      'TextAreaOptions(name: $name, type: $type, validation: $validation, description rows: $rows, rowsMax: $rowsMax)';

  @override
  bool operator ==(covariant TextAreaOptions other) {
    if (identical(this, other)) return true;

    return other.rows == rows &&
        other.rowsMax == rowsMax &&
        other.name == name &&
        other.type == type &&
        mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      rows.hashCode ^
      rowsMax.hashCode ^
      name.hashCode ^
      type.hashCode ^
      validation.hashCode ^
      description.hashCode;
}
