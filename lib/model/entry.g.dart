// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entry _$EntryFromJson(Map<String, dynamic> json) => Entry(
      kind: json['kind'] as String?,
      data: json['data'] == null
          ? null
          : EntryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$EntryToJson(Entry instance) => <String, dynamic>{
      'kind': instance.kind,
      'data': instance.data,
    };
