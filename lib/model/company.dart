import 'package:json_annotation/json_annotation.dart';

import '../base/base_model.dart';
part 'company.g.dart';

@JsonSerializable()
class Company extends BaseModel {
  String? name;
  String? catchPhrase;
  String? bs;

  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
