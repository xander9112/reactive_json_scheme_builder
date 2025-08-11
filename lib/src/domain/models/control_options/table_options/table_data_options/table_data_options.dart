import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_json_scheme/src/_src.dart';

part 'table_data_options.freezed.dart';
part 'table_data_options.g.dart';

@freezed
abstract class TableDataOptions with _$TableDataOptions {
  const factory TableDataOptions({
    String? source,
    @Default({}) Map<String, TableItemOptions> items,
  }) = _TableDataOptions;

  factory TableDataOptions.fromJson(Map<String, Object?> json) =>
      _$TableDataOptionsFromJson(json);

  @override
  Map<String, Object?> toJson();
}
