// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableOptions _$TableOptionsFromJson(Map<String, dynamic> json) =>
    _TableOptions(
      data: TableDataOptions.fromJson(json['data'] as Map<String, dynamic>),
      size: $enumDecodeNullable(_$TableSizeOptionsEnumMap, json['size']) ??
          TableSizeOptions.middle,
      sticky: json['sticky'] as bool? ?? false,
      bordered: json['bordered'] as bool? ?? true,
      zebraStriped: $enumDecodeNullable(
          _$TableZebraStripedOptionsEnumMap, json['zebraStriped']),
      verticalAlign: $enumDecodeNullable(
          _$TableItemOptionsAlignEnumMap, json['verticalAlign']),
    );

Map<String, dynamic> _$TableOptionsToJson(_TableOptions instance) =>
    <String, dynamic>{
      'data': instance.data,
      'size': _$TableSizeOptionsEnumMap[instance.size]!,
      'sticky': instance.sticky,
      'bordered': instance.bordered,
      'zebraStriped': _$TableZebraStripedOptionsEnumMap[instance.zebraStriped],
      'verticalAlign': _$TableItemOptionsAlignEnumMap[instance.verticalAlign],
    };

const _$TableSizeOptionsEnumMap = {
  TableSizeOptions.small: 'small',
  TableSizeOptions.middle: 'middle',
  TableSizeOptions.large: 'large',
};

const _$TableZebraStripedOptionsEnumMap = {
  TableZebraStripedOptions.odd: 'odd',
  TableZebraStripedOptions.even: 'even',
};

const _$TableItemOptionsAlignEnumMap = {
  TableItemOptionsAlign.left: 'left',
  TableItemOptionsAlign.center: 'center',
  TableItemOptionsAlign.right: 'right',
};
