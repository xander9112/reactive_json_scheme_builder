import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_json_scheme/src/_src.dart';

part 'drop_down_options.freezed.dart';
part 'drop_down_options.g.dart';

@freezed
abstract class DropDownOptions with _$DropDownOptions {
  const factory DropDownOptions({
    DropDownDataOptions? data,
    @Default(TableSizeOptions.middle) TableSizeOptions size,
    String? label,
  }) = _DropDownOptions;

  const DropDownOptions._();

  factory DropDownOptions.fromJson(Map<String, Object?> json) =>
      _$DropDownOptionsFromJson(json);

  @override
  Map<String, Object?> toJson();
}
