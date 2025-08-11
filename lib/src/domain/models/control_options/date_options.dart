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
    required super.validation,
    required super.description,
    required this.format,
  });

  factory DateOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return DateOptions(
      format: DateOptionsFormat.fromString(map['format'] as String),
      validation: options.validation,
      description: options.description,
    );
  }

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
      validation: validation ?? this.validation,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'format': format.toStringValue(),
      'validation': validation,
      'description': description,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'DateOptions(validation: $validation, description: $description, format: $format)';

  @override
  bool operator ==(covariant DateOptions other) {
    if (identical(this, other)) return true;

    return other.format == format &&
        mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      format.hashCode ^ validation.hashCode ^ description.hashCode;
}
