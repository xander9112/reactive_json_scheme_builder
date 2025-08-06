// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reactive_forms_json_scheme/src/_src.dart';

class SliderOptions extends ControlOptions {
  SliderOptions({
    required super.name,
    required super.type,
    required super.validation,
    required super.description,
    this.min = 1,
    this.max = 100,
    this.step = 1,
  });

  final int min;
  final int max;
  final int step;

  @override
  SliderOptions copyWith({
    int? min,
    int? max,
    int? step,
    String? name,
    String? type,
    Map<String, dynamic>? validation,
    String? description,
  }) {
    return SliderOptions(
      min: min ?? this.min,
      max: max ?? this.max,
      step: step ?? this.step,
      name: name ?? this.name,
      type: type ?? this.type,
      validation: validation ?? this.validation,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'min': min,
      'max': max,
      'step': step,
      'name': name,
      'type': type,
      'validation': validation,
      'description': description,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  factory SliderOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return SliderOptions(
      min: map['min'] as int,
      max: map['max'] as int,
      step: map['step'] as int,
      name: options.name,
      type: options.type,
      validation: options.validation,
      description: options.description,
    );
  }

  @override
  String toString() =>
      'SliderOptions(name: $name, type: $type, validation: $validation, description, min: $min, max: $max, step: $step)';

  @override
  bool operator ==(covariant SliderOptions other) {
    if (identical(this, other)) return true;

    return other.min == min &&
        other.max == max &&
        other.step == step &&
        other.name == name &&
        other.type == type &&
        mapEquals(other.validation, validation) &&
        other.description == description;
  }

  @override
  int get hashCode =>
      min.hashCode ^
      max.hashCode ^
      step.hashCode ^
      name.hashCode ^
      type.hashCode ^
      validation.hashCode ^
      description.hashCode;
}
