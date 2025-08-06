// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:reactive_forms_json_scheme/src/_src.dart';

enum ButtonOptionsType {
  submit,
  reset,
  button;

  bool get isSubmit => this == submit;
  bool get isReset => this == reset;
  bool get isButton => this == button;

  static ButtonOptionsType fromString(String? value) {
    switch (value) {
      case 'submit':
        return submit;
      case 'reset':
        return reset;
      case 'button':
        return button;

      default:
        return submit;
    }
  }
}

class ButtonOptions extends ControlOptions {
  ButtonOptions({
    required super.name,
    required super.type,
    required super.validation,
    required super.description,
    required this.buttonType,
  });

  final ButtonOptionsType buttonType;

  @override
  ButtonOptions copyWith({
    String? name,
    String? type,
    Map<String, dynamic>? validation,
    String? description,
    ButtonOptionsType? buttonType,
  }) {
    return ButtonOptions(
      name: name ?? this.name,
      type: type ?? this.type,
      validation: validation ?? this.validation,
      description: description ?? this.description,
      buttonType: buttonType ?? this.buttonType,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'type': type,
      'validation': validation,
      'description': description,
      'htmlType': buttonType.name,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  factory ButtonOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return ButtonOptions(
      name: options.name,
      type: options.type,
      validation: options.validation,
      description: options.description,
      buttonType: ButtonOptionsType.fromString(map['htmlType'] as String?),
    );
  }

  @override
  String toString() =>
      'ButtonOptions(name: $name, type: $type, validation: $validation, description, buttonType: $buttonType)';

  @override
  bool operator ==(covariant ButtonOptions other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.type == type &&
        mapEquals(other.validation, validation) &&
        other.description == description &&
        other.buttonType == buttonType;
  }

  @override
  int get hashCode =>
      name.hashCode ^
      type.hashCode ^
      buttonType.hashCode ^
      validation.hashCode ^
      description.hashCode;
}
