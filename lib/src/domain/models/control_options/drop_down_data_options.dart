import 'package:freezed_annotation/freezed_annotation.dart';

part 'drop_down_data_options.freezed.dart';
part 'drop_down_data_options.g.dart';

@freezed
abstract class DropDownDataOptions with _$DropDownDataOptions {
  const factory DropDownDataOptions({
    String? source,
    @Default({}) Map<String, dynamic> items,
  }) = _DropDownDataOptions;

  factory DropDownDataOptions.fromJson(Map<String, Object?> json) =>
      _$DropDownDataOptionsFromJson(json);

  @override
  Map<String, Object?> toJson();
}
