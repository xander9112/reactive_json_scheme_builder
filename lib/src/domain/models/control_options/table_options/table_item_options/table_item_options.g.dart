// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_item_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableItemOptions _$TableItemOptionsFromJson(Map<String, dynamic> json) =>
    _TableItemOptions(
      title: json['title'] as String,
      align:
          $enumDecodeNullable(_$TableItemOptionsAlignEnumMap, json['align']) ??
              TableItemOptionsAlign.left,
      fixed: json['fixed'] as bool? ?? false,
      width: json['width'] as num?,
      ellipsis: json['ellipsis'] as bool? ?? false,
      sortable: json['sortable'] as bool? ?? false,
      defaultSortOrder: $enumDecodeNullable(
              _$TableItemOptionsSortOrderEnumMap, json['defaultSortOrder']) ??
          TableItemOptionsSortOrder.none,
    );

Map<String, dynamic> _$TableItemOptionsToJson(_TableItemOptions instance) =>
    <String, dynamic>{
      'title': instance.title,
      'align': _$TableItemOptionsAlignEnumMap[instance.align]!,
      'fixed': instance.fixed,
      'width': instance.width,
      'ellipsis': instance.ellipsis,
      'sortable': instance.sortable,
      'defaultSortOrder':
          _$TableItemOptionsSortOrderEnumMap[instance.defaultSortOrder]!,
    };

const _$TableItemOptionsAlignEnumMap = {
  TableItemOptionsAlign.left: 'left',
  TableItemOptionsAlign.center: 'center',
  TableItemOptionsAlign.right: 'right',
};

const _$TableItemOptionsSortOrderEnumMap = {
  TableItemOptionsSortOrder.ascend: 'ascend',
  TableItemOptionsSortOrder.descend: 'descend',
  TableItemOptionsSortOrder.none: 'none',
};
