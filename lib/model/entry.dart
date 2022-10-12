import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_clone/base/base_model.dart';

import 'entry_data.dart';

part 'entry.g.dart';

@JsonSerializable()
class Entry extends BaseModel {
  final String? kind;
  final EntryData? data;

  Entry({
    this.kind,
    this.data,
  });

  @override
  Map<String, dynamic> toJson() => _$EntryToJson(this);

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
}
