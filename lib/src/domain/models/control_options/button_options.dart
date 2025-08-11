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
    required super.validation,
    required super.description,
    required this.buttonType,
  });

  factory ButtonOptions.fromJson(Map<String, dynamic> map) {
    final options = ControlOptions.fromJson(map);

    return ButtonOptions(
      validation: options.validation,
      description: options.description,
      buttonType: ButtonOptionsType.fromString(map['htmlType'] as String?),
    );
  }

  final ButtonOptionsType buttonType;

  @override
  ButtonOptions copyWith({
    Map<String, dynamic>? validation,
    String? description,
    ButtonOptionsType? buttonType,
  }) {
    return ButtonOptions(
      validation: validation ?? this.validation,
      description: description ?? this.description,
      buttonType: buttonType ?? this.buttonType,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'validation': validation,
      'description': description,
      'htmlType': buttonType.name,
    };
  }

  @override
  String toJson() => json.encode(toMap());

  @override
  String toString() =>
      'ButtonOptions(validation: $validation, description, buttonType: $buttonType)';

  @override
  bool operator ==(covariant ButtonOptions other) {
    if (identical(this, other)) return true;

    return mapEquals(other.validation, validation) &&
        other.description == description &&
        other.buttonType == buttonType;
  }

  @override
  int get hashCode =>
      buttonType.hashCode ^ validation.hashCode ^ description.hashCode;
}
