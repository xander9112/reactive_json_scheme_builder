// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_data_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TableDataOptions _$TableDataOptionsFromJson(Map<String, dynamic> json) =>
    _TableDataOptions(
      source: json['source'] as String?,
      items: (json['items'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(
                k, TableItemOptions.fromJson(e as Map<String, dynamic>)),
          ) ??
          const {},
    );

Map<String, dynamic> _$TableDataOptionsToJson(_TableDataOptions instance) =>
    <String, dynamic>{
      'source': instance.source,
      'items': instance.items,
    };
