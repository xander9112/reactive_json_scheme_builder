import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'table_item_options.freezed.dart';
part 'table_item_options.g.dart';

enum TableItemOptionsAlign {
  left,
  center,
  right;

  TextAlign get textAlign {
    switch (this) {
      case left:
        return TextAlign.left;
      case center:
        return TextAlign.center;
      case right:
        return TextAlign.right;
    }
  }
}

enum TableItemOptionsSortOrder {
  ascend,
  descend,
  none;
}

@freezed
abstract class TableItemOptions with _$TableItemOptions {
  const factory TableItemOptions({
    required String title,
    @Default(TableItemOptionsAlign.left) TableItemOptionsAlign align,
    @Default(false) bool fixed,
    num? width,
    @Default(false) bool ellipsis,
    @Default(false) bool sortable,
    @Default(TableItemOptionsSortOrder.none)
    TableItemOptionsSortOrder defaultSortOrder,
  }) = _TableItemOptions;

  factory TableItemOptions.fromJson(Map<String, Object?> json) =>
      _$TableItemOptionsFromJson(json);

  @override
  Map<String, Object?> toJson();
}
