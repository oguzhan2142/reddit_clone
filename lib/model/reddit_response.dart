import 'package:json_annotation/json_annotation.dart';
import 'package:reddit_clone/base/base_model.dart';
import 'address.dart';
import 'company.dart';
part 'reddit_response.g.dart';

@JsonSerializable()
class RedditResponse extends BaseModel {
  int? id;
  String? name;
  String? username;
  String? email;
  Address? address;
  String? phone;
  String? website;
  Company? company;

  RedditResponse({
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  });

  factory RedditResponse.fromJson(Map<String, dynamic> json) => _$RedditResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RedditResponseToJson(this);
}
