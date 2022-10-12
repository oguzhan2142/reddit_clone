import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_clone/base/base_model.dart';

part 'entry_data.g.dart';

@JsonSerializable()
class EntryData extends BaseModel {
  @JsonKey(name: 'selftext')
  final String? selfText;
  @JsonKey(name: 'author_fullname')
  final String? authorFullName;
  final String? title;
  final int? ups;
  @JsonKey(name: 'created_utc')
  final double? createdUtc;
  final String? description;
  final String? thumbnail;

  EntryData(
    this.selfText,
    this.authorFullName,
    this.title,
    this.ups,
    this.createdUtc,
    this.description,
    this.thumbnail,
  );

  @override
  Map<String, dynamic> toJson() => _$EntryDataToJson(this);

  factory EntryData.fromJson(Map<String, dynamic> json) => _$EntryDataFromJson(json);
}
