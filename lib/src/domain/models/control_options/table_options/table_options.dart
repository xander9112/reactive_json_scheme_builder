import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_json_scheme/src/_src.dart';

part 'table_options.freezed.dart';
part 'table_options.g.dart';

enum TableSizeOptions { small, middle, large }

enum TableZebraStripedOptions { odd, even }

@freezed
abstract class TableOptions with _$TableOptions {
  const factory TableOptions({
    required TableDataOptions data,
    @Default(TableSizeOptions.middle) TableSizeOptions size,
    @Default(false) bool sticky,
    @Default(true) bool bordered,
    TableZebraStripedOptions? zebraStriped,
    TableItemOptionsAlign? verticalAlign,
    // TableItemOptionsAlign? headerVerticalAlign,
  }) = _TableOptions;

  const TableOptions._();

  factory TableOptions.fromJson(Map<String, Object?> json) =>
      _$TableOptionsFromJson(json);

  @override
  Map<String, Object?> toJson();
}



// import 'dart:convert';

// import 'package:flutter/foundation.dart';
// import 'package:reactive_forms_json_scheme/src/_src.dart';

// class TableOptions extends ControlOptions {
//   TableOptions({
//     required super.validation,
//     required super.description,
//     required this.buttonType,
//   });

//   factory TableOptions.fromJson(Map<String, dynamic> map) {
//     final options = ControlOptions.fromJson(map);

//     return TableOptions(
//       validation: options.validation,
//       description: options.description,
//       buttonType: TableOptionsType.fromString(map['htmlType'] as String?),
//     );
//   }

//   final TableOptionsType buttonType;

// final String? source;
// final Map<String, TableOptions>? items;

  

//   @override
//   TableOptions copyWith({
//     Map<String, dynamic>? validation,
//     String? description,
//     TableOptionsType? buttonType,
//   }) {
//     return TableOptions(
//       validation: validation ?? this.validation,
//       description: description ?? this.description,
//       buttonType: buttonType ?? this.buttonType,
//     );
//   }

//   @override
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'validation': validation,
//       'description': description,
//       'htmlType': buttonType.name,
//     };
//   }

//   @override
//   String toJson() => json.encode(toMap());

//   @override
//   String toString() =>
//       'TableOptions(validation: $validation, description, buttonType: $buttonType)';

//   @override
//   bool operator ==(covariant TableOptions other) {
//     if (identical(this, other)) return true;

//     return mapEquals(other.validation, validation) &&
//         other.description == description &&
//         other.buttonType == buttonType;
//   }

//   @override
//   int get hashCode =>
//       buttonType.hashCode ^ validation.hashCode ^ description.hashCode;
// }
