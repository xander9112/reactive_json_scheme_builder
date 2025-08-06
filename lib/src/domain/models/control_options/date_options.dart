// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reactive_forms_json_scheme/src/domain/models/control_options/_control_options.dart';

enum DateOptionsFormat {
  date,
  dateTime,
  time;

  static DateOptionsFormat fromString(String value) {
    switch (value) {
      case 'date':
        return DateOptionsFormat.date;
      case 'date-time':
        return DateOptionsFormat.dateTime;
      case 'time':
        return DateOptionsFormat.time;
    }

    throw Exception('Unknown format type');
  }

  String toStringValue() {
    switch (this) {
      case date:
        return 'date';
      case dateTime:
        return 'date-time';
      case time:
        return 'time';
    }
  }
}

class DateOptions extends ControlOptions {
  DateOptions({
    required super.name,
    required super.type,
    required super.validation,
    required super.description,
    required this.format,
  });

  final DateOptionsFormat format;

  @override
  DateOptions copyWith({
    DateOptionsFormat? format,
    String? decimalSeparator,
    String? name,
    String? type,
    Map<String, dynamic>? validation,
    String? description,
  }) {
    return DateOptions(
      format: format ?? this.format,
      name: name ?? this.name,
      type: type ?? this.type,
      validation: validation ?? this.validation,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'format': format.toStringValue(),
      'name': name,
      'type': type,
      'validation': validation,
      'description': description,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  factory DateOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return DateOptions(
      format: DateOptionsFormat.fromString(map['format'] as String),
      name: options.name,
      type: options.type,
      validation: options.validation,
      description: options.description,
    );
  }

  @override
  String toString() =>
      'DateOptions(name: $name, type: $type, validation: $validation, description: $description, format: $format)';

  @override
  bool operator ==(covariant DateOptions other) {
    if (identical(this, other)) return true;

    return other.format == format &&
        other.name == name &&
        other.type == type &&
        mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      format.hashCode ^
      name.hashCode ^
      type.hashCode ^
      validation.hashCode ^
      description.hashCode;
}
