// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entry_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntryData _$EntryDataFromJson(Map<String, dynamic> json) => EntryData(
      json['selftext'] as String?,
      json['author_fullname'] as String?,
      json['title'] as String?,
      json['ups'] as int?,
      (json['created_utc'] as num?)?.toDouble(),
      json['description'] as String?,
      json['thumbnail'] as String?,
    );

Map<String, dynamic> _$EntryDataToJson(EntryData instance) => <String, dynamic>{
      'selftext': instance.selfText,
      'author_fullname': instance.authorFullName,
      'title': instance.title,
      'ups': instance.ups,
      'created_utc': instance.createdUtc,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
    };
