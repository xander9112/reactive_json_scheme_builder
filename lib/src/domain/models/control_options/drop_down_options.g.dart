// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drop_down_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DropDownOptions _$DropDownOptionsFromJson(Map<String, dynamic> json) =>
    _DropDownOptions(
      data: json['data'] == null
          ? null
          : DropDownDataOptions.fromJson(json['data'] as Map<String, dynamic>),
      size: $enumDecodeNullable(_$TableSizeOptionsEnumMap, json['size']) ??
          TableSizeOptions.middle,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$DropDownOptionsToJson(_DropDownOptions instance) =>
    <String, dynamic>{
      'data': instance.data,
      'size': _$TableSizeOptionsEnumMap[instance.size]!,
      'label': instance.label,
    };

const _$TableSizeOptionsEnumMap = {
  TableSizeOptions.small: 'small',
  TableSizeOptions.middle: 'middle',
  TableSizeOptions.large: 'large',
};
